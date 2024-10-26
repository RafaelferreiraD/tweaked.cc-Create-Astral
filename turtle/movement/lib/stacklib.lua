stacklib = {}

function stacklib.push(item)
    table.insert(stacklib, item)
end

function stacklib.pop()
    return table.remove(stacklib)
end

function test()
    s = stacklib

    for i = 1, 10 do
        s.push(i)
    end

    a = s.pop()
    while (a) do
        print(a)
        a = s.pop()
    end
end
