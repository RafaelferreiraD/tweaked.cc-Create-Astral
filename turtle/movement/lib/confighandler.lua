require "lib.filehandler"
require "lib.stringhandler"

function Readconf(file)
    local lines = Readlines(file)
    local line = {}
    local index = 0
    local coord = {}
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
            print(line[1])
            print(line[2])
            if string.find(line[1], "index") then
                index = line[2]
                conf[index] = {}
                conf[index]["step"] = {}
            end
            if string.find(line[1], "step") then
                coord = Split(line[2])
                conf[index][line[1]][1] = coord[1]
                conf[index][line[1]][2] = coord[2]
                conf[index][line[1]][3] = coord[3]
            else
                conf[index][line[1]] = line[2]
            end
        end
    end

    return conf
end
