print("Specify target length")
local length = tonumber(read())
k = 2
--print("Specify target height")
--local height = tonumber(read())
dirRL, dirUD = true, true -- true - normal, false - opposite
print("Specify target width")
local width = tonumber(read())

if length < 1 then
    print("Length must be at least 1 block")
    errorhandler()
end
if length < 1 then
    print("Length must be at least 1 block")
    errorhandler()
end


--if width < 2 then
--    print("Width must be at least 2 block")
--    errorhandler()
--end

function errorhandler()
    print("Error has occured!")
    while true do
        
    end
end

function gravelD3stroy()
    local gravel = "minecraft:gravel"
    local sand = "minecraft:sand"
    success, data = turtle.inspect()
    if data.name == gravel or data.name == sand then
        while data.name == gravel or data.name == sand do
            turtle.dig()
            sleep(0.5)
            success, data = turtle.inspect()
        end
    end
end

function chkBLK()
    local attempts = 0
    if turtle.getItemCount(k) < 5 then
        while turtle.getItemCount(k) < 5 do
            turtle.select(k)
            if k < 16 then
                k = k + 1
            end
            if k == 16 then
                attempts = attempts + 1
            end
            if attempts == 3 then
                print("Need more blocks")
                sleep(0.5)
                k = 2
                turtle.select(k)
                attempts = 0
            end
        end
    end
    return 0
end

function chkFuel()
    while turtle.getFuelLevel() < 10 do
        for b = 1, 15, 1 do
            turtle.select(b)
            turtle.refuel(5)
        end
        print("Need fuel")
        sleep(0.5)
    end
    return 0
end

function dig()
    local netherrack = "minecraft:netherrack"
    gravelD3stroy()
    turtle.dig()
    turtle.forward()
    gravelD3stroy()
        if dirRL == true then
            turtle.turnRight()
        end
        if dirRL == false then
            turtle.turnLeft()
        end
            turtle.select(k)
        for j = 1, width-1, 1 do
            gravelD3stroy()
            turtle.dig()
            turtle.digUp()
            --turtle.digDown()
            turtle.placeDown()
            turtle.forward()
            turtle.digUp()
            turtle.placeDown()
            --turtle.digDown()
            --if turtle.getItemCount(j+1) > 1 then
            --    turtle.placeDown()
            --end
            --gravelD3stroy()
        end
        turtle.place()
        if dirRL == false then
            turtle.turnRight()
        end
        if dirRL == true then
            turtle.turnLeft()
        end
        dirRL = not dirRL
        dirUD = not dirUD
    gravelD3stroy()
end

for i = 1, length, 1 do
    chkFuel()
    chkBLK()
    gravelD3stroy()
    dig()
end
print("Job ended")
