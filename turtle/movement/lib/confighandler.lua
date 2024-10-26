require "lib.filehandler"
require "lib.stringhandler"

function Readconf(file)
    local lines = Readlines(file)
    local line = {}
    local conf = {
        {
            ["from_to_str"] = nil,
            ["setup_str"] = nil,
            ["step"] = {}
        }
    }

    for i = 1, #lines, 1 do
        if string.find(lines[i], "---") then
            goto done
        end

        line = Split(lines[i], "=")
        if string.find(line[1], "step") then
            conf[i][line[1]][#conf[i][line[1]] + 1] = Split(line[2])
        else
            conf[i][line[1]] = line[2]
        end

        ::done::
    end

    return conf
end
