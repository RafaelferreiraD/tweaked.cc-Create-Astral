require "lib.confighandler"

function Showmenu(file)
    local conf =  Readconf(file)
    print("Press any key to continue:")

    for i=1, #conf, 1 do
        print("["..i.."]".."- Route name: "..conf[i]["from_to_str"].." - Setpu block"..conf[i]["setup_str"])
        read()
    end
    
    write("Select a route: ")
    local route = read()

    return conf[route]
end