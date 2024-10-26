function Readlines(file)
    local file = fs.open(file, "r")
    local lines = {}
    local line
    while true do
        line = file.readLine()

        -- If line is nil then we've reached the end of the file and should stop
        if not line then break end

        lines[#lines + 1] = line
    end

    file.close()
    return lines
end
