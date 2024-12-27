print("Specify target length")
local length = tonumber(read())

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

function chkFuel()
    if turtle.getFuelLevel() < 10 then
        for k = 1, 15, 1 do
            turtle.select(k)
            turtle.refuel(5)
        end
    end
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
        for j = 1, width-1, 1 do
            gravelD3stroy()
            turtle.dig()
            turtle.digUp()
            turtle.digDown()
            turtle.forward()
            turtle.digUp()
            turtle.digDown()
            --gravelD3stroy()
        end
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
    gravelD3stroy()
    dig()
end
print("Job ended")
