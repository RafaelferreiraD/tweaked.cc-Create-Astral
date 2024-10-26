require "lib.filehandler"
require "lib.stringhandler"

function Readconf(file)
    local lines = Readlines(file)
    local line = {}
    local index = tonumber(0)
    local conf = {
        ---        {
        ---            ["from_to_str"] = nil,
        ---            ["setup_str"] = nil,
        ---            ["step"] = {}
        ---        }
    }

    for i = 1, #lines, 1 do
        if not string.find(lines[i], "---") then
            line = Split(lines[i], "=")
            if string.find(line[1], "index") then
                index = tonumber(line[2])
                conf[index] = {}
                conf[index]["step"] = {}
            end
            if string.find(line[1], "step") then
                conf[index]["step"][#conf[index]["step"] + 1] = Split(line[2], ",")
            else
                conf[index][line[1]] = line[2]
            end
        end
    end

    return conf
end
