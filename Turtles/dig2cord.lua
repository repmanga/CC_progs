k = 2
dirRL, dirUD = true, true -- true - normal, false - opposite
print("Specify target width")
local width = tonumber(read())


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
            turtle.turnLeft()
            turtle.place()
            turtle.turnRight()
            turtle.turnRight()
        end
        if dirRL == false then
            turtle.turnRight()
            turtle.place()
            turtle.turnLeft()
            turtle.turnLeft()
        end
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

print("Set target x")
tarX = tonumber(read())
print("Set target Z")
tarZ = tonumber(read())


function gpsNav(tarX, tarY, tarZ)
local function turnAround()
    turtle.turnLeft()
    turtle.turnLeft()
end
local x, y, z,curX, curY, curZ, StartDirection, Direction
x,y,z = gps.locate()
print(x)
print(y)
print(z)

turtle.forward()
curX, curY, curZ = gps.locate()

if curX > x then
    StartDirection = "east"
elseif curX < x then
    StartDirection = "west"
elseif curZ > z then
    StartDirection = "south"
elseif curZ < z then
    StartDirection = "north"
end


if StartDirection == "east" and tarX < curX then
    turnAround()
    Direction = "west"
    --target on West
elseif  StartDirection == "east" and tarX > curX then
    --target on East
    Direction = "east"
elseif  StartDirection == "west" and tarX < curX then
    Direction = "West"
    --target on West
elseif  StartDirection == "west" and tarX > curX then
    turnAround()
    Direction = "east"
    --target on East
elseif StartDirection == "south" and tarX < curX then
    turtle.turnRight()
    Direction = "west"
    --target on West
elseif StartDirection == "south" and tarX > curX then
    turtle.turnLeft()
    Direction = "east"
    --target on East
elseif StartDirection == "north" and tarX < curX then
    turtle.turnLeft()
    Direction = "west"
    --target on West
elseif StartDirection == "north" and tarX > curX then
    turtle.turnRight()
    Direction = "east"
    --target on East
end
curX, curY, curZ = gps.locate()
for p = 1, math.abs(curX - tarX), 1 do
    chkBLK()
    chkFuel()
    dig()
end



if Direction == "east" and tarZ > curZ then
    turtle.turnRight()
elseif Direction == "east" and tarZ < curZ then
    turtle.turnLeft()
elseif Direction == "west" and  tarZ > curZ then
    turtle.turnLeft()
elseif Direction == "west" and tarZ < curZ then
    turtle.turnRight()
end

curX, curY, curZ = gps.locate()
for p = 1, math.abs(curZ - tarZ), 1 do
    chkBLK()
    chkFuel()
    dig()
end

end

gpsNav(tarX, tarY, tarZ)

print("Job done")
