require "lib.stacklib"
require "lib.storage"
require "gps-reciver.gps-cc"
require "lib.menu"


local function main()
    -- computercraft:computer_normal  tconstruct:seared_melter
    local route = Showmenu(shell.resolve("config.conf"))

    term.clear()

    print("Initiating route: " .. route["from_to_str"])
    local s = Setup(route["setup_str"])

    if s then
        for i = 1, #route["step"], 1 do
            Gotolocation(
                tonumber(route["step"][i][1]),
                tonumber(route["step"][i][2]),
                tonumber(route["step"][i][3])
            )
        end

        return 0
    end

    print("Falha no setup")
    return nil
end

main()
