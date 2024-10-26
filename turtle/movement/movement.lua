-- base: x: 3, y: 70, z: 3
-- mover_subir: x:3, y: 70, z: 6
-- subir: x:3, y: 130, z: 6
-- porta: x: 137, y: 66, z: 94

-- direita diminue o z
-- frente diminue o x

require "lib.stacklib"
require "lib.storage"
require "gps-reciver.gps-cc"


local function main()
    -- computercraft:computer_normal  tconstruct:seared_melter
    local s = Setup("tconstruct:seared_melter")

    if s then
        Gotolocation(3, 100, 6)
        Gotolocation(3, 70, 6)
        Gotolocation(137, 100, 94)
        Gotolocation(137, 66, 94)

        return 0
    end

    s = Setup("minecraft:cobblestone")

    if s then
        Gotolocation(137, 66, 94)
        Gotolocation(137, 70, 94)
        Gotolocation(124, 100, 87)
        Gotolocation(3, 70, 6)
        Gotolocation(3, 70, 3)

        return 0
    end

    print("Falha no setup")
    return nil
end

main()
