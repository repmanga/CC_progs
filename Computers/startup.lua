--This is startup script for GPS host
local x, y, z = _ , _ , _  -- write computer coordinates into blank spaces
shell.run("gps", "host", x, y, z)
