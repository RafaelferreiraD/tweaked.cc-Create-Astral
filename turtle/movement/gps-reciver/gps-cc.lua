-- https://tweaked.cc/guide/gps_setup.html

-- https://tweaked.cc/module/gps.html#v:locate

-- local do satelite: x: 137, y:313, z: 110

function Getposition()
    -- CHANNEL_GPS = 65534
    return gps.locate(2, false)
end

function Setup(expected)
    local has_block, data

    for i = 1, 4, 1 do
        turtle.turnLeft()

        has_block, data = turtle.inspect()

        if has_block then
            print(textutils.serialise(data["name"]))
            if string.find(textutils.serialise(data["name"]), expected) then
                return true
            end

            -- print(textutils.serialise(data["name"]))
            -- {
            --   name = "minecraft:oak_log",
            --   state = { axis = "x" },
            --   tags = { ["minecraft:logs"] = true, ... },
            -- }
        end
    end

    return nil
end

function Gotolocation(x, y, z)
    local g_x, g_y, g_z
    local lookingto = 0

    while true do
        if ((x == g_x) and (y == g_y) and (z == g_z)) then
            break
        end

        g_x, g_y, g_z = Getposition()
        
        -- movimento no z
        if z > g_z then
            for i = lookingto - 1, 1, 1 do
                turtle.turnRight()
            end

            for i = g_z, z - 1, 1 do
                if not turtle.forward() then
                    return nil
                end
            end
            lookingto = 1
        elseif z < g_z then
            for i = lookingto + 1, -1, -1 do
                turtle.turnLeft()
            end

            for i = g_z, z + 1, -1 do
                if not turtle.forward() then
                    return nil
                end
            end
            lookingto = -1
        end
        -- fin movimento z

        -- reset position
        if lookingto < 0 then
            for i = lookingto - 1, 0, 1 do
                turtle.turnRight()
            end

            lookingto = 0
        elseif lookingto > 0 then
            for i = lookingto + 1, 0, -1 do
                turtle.turnLeft()
            end

            lookingto = 0
        end
        -- fin reset position

        -- movimento x
        if x < g_x then
            for i = g_x, x + 1, -1 do
                if not turtle.forward() then
                    return nil
                end
            end
        else
            if x > g_x then
                for i = g_x, x - 1, 1 do
                    if not turtle.back() then
                        return nil
                    end
                end
            end
        end
        -- fin movimento x

        -- movimento y
        if y < g_y then
            for i = g_y, y + 1, -1 do
                if not turtle.down() then
                    return nil
                end
            end
        else
            if y > g_y then
                for i = g_y, y - 1, 1 do
                    if not turtle.up() then
                        return nil
                    end
                end
            end
        end
        -- fin movimento y
    end

    return true
end
