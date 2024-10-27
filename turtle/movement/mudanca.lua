require "lib.storage"
require "lib.confighandler"
require "gps-reciver.gps-cc"

local function wait_redstone()
    sleep(20)
    while not redstone.getInput("left") do
        sleep(5)
    end
    return nil
end

local function main()
    local conf = Readconf(shell.resolve("config.conf"))
    local route
    local s

    while true do
        route = conf[1]
        print("Initiating route: " .. route["from_to_str"])
        s = Setup(route["setup_str"])

        read()

        if s then
            for i = 1, #route["step"], 1 do
                Gotolocation(
                    tonumber(route["step"][i][1]),
                    tonumber(route["step"][i][2]),
                    tonumber(route["step"][i][3])
                )
            end
        end

        route = conf[2]
        print("Initiating route: " .. route["from_to_str"])
        s = Setup(route["setup_str"])
        wait_redstone()
        
        if s then
            for i = 1, #route["step"], 1 do
                Gotolocation(
                    tonumber(route["step"][i][1]),
                    tonumber(route["step"][i][2]),
                    tonumber(route["step"][i][3])
                )
            end
        end
    end
end

main()
