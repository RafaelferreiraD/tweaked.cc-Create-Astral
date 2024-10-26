function IsFull()
    turtle.select(1)

    for slot, item in pairs(turtle.list()) do
        print(("%d x %s in slot %d"):format(item.count, item.name, slot))
    end
end
