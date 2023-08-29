--Printing

print("Hello world!")


--Variables

local myName = 4 --local makes the script runs faster

print(myName)

-- Arithmetic + Object-Oriented Programming

-- * - multiplication
-- / - division
-- + - addition
-- - subtration 
-- true or false its a boolean
-- ^ exponentiation

local PartTransparency = 0.3 + 0.3

local PartMaterial = "Wood"

local Baseplate = game.Workspace.Baseplate-- to make easier to script takes less time (instead of always writing game.workspace.baseplate)

Baseplate.Transparency = PartTransparency -- it manipulates the transparency of the baseplate with basic scripting

Baseplate.Material = PartMaterial  -- it manupulates the material of the baseplate with basic scripting

--Functions

local function MyFirstFunction()
	local BestNumber = 15
	local FavoriteNumber = 10
	print(BestNumber+FavoriteNumber)
end

MyFirstFunction() -- calls the function to make it work, if we don´t call the function she will not be triggered and it will not work


-- Scope
local a = 2 -- if the variable is outside the fucntion, the variable is global and can be used by any function or command because is outside of the function

local function Test1()
	local b = 4 -- but if the variable is inside the function and we use local, the variable will be local and it only be used inside this function
	c = 6
	print(a)
	print(b)
	print(c)
end

local function Test2 ()
	print(a)
	print(b) -- this will not be printed cus the variable b is a local variable of the function Test1 and only works in that function
	print(c) -- this will work cus the variable c is not local so it will run in another functions	
end

Test1()
Test2()


-- Returning

local function hi()
	print("hi")
	return 0
end

local Hotdog = hi() -- we can make a variable equal to a function to get the value of the function and we be able to see the returning the value
print(Hotdog)

-- Parameters
local function add(Number1, Number2) -- Number1 and Number2 are parameters that we can give values when we call the function they are basically variables
	print(Number1+Number2)
end

add(3,2)

local function adi(Hotdog, Ham) -- Number1 and Number2 are parameters that we can give values when we call the function they are basically variables
	print(Hotdog)
end

adi("Sweet",2)-- Hotdog will be = "Sweet" and Ham will be = 2
adi("Cool",2)-- Hotdog will be = "Cool" and Ham will still be = 2


-- Else and Elseif Statements
local DogWater = 3

if DogWater == 2 then
	print("DogWater is equal to 3")
elseif DogWater == 3 then
	print("DogWater isn´t equal to 3")
else
	print("None are equal to 3")
end


local Baseplate = game.Workspace.Baseplate

if Baseplate.Anchored == true then
	print("The baseplate is anchored")
	Baseplate.Anchored = false
	wait(2)
	Baseplate.Anchored = true
	return 0
end

-- Events

game.Workspace.MyPart.Touched:Connect(function() -- this event works if the block MyPart is touched
	print("I was stepped on")
end)

local function AwesomeSauce()
	print("FUNCTION CALLED")
	print("I WAS STEPPED ON")
	game.Workspace.MyPart.Anchored = false
end

game.Workspace.MyPart.Touched:Connect(AwesomeSauce) 

-- Built- in fucntions

local Mylove = game.Workspace:WaitForChild("MyPart") -- it will wait for the part Mypart to exist to print "Yay my love "
print("Yay my love")

local MelonFriend = "MyPart"

local Melon = game.Workspace:FindFirstChild(MelonFriend)

-- While and Repeat Loops

local doghot = 1

while doghot < 5 do -- it will only run if doghot < 5 (it doesn´t run automatically)
	print("Hello")
	print(doghot)
	doghot = doghot + 1
end

repeat -- automatically will run until something happens
	print("Hello")
	doghot = doghot + 1
until doghot == 3 


-- More events

local MyPart = game.Workspace.MyPart

MyPart.Touched:Connect(function(hit)
	print(hit) -- this will print the part that touched the block
	if hit.Parent:FindFirstChild("Humanoid") then -- this will find my character or the humanoid so if anything else touches it, it will not bug then
		hit.Parent.Humanoid.Health = 0
		
	end
end)


-- Instances
local NewPart = Instance.new("Part", game.Workspace) -- it will create a part while the game is running after that the part is deleted

NewPart.Size = Vector3.new(50,50,50) -- vector3 is a 3 value (x,y,z) we use vector3 to all the 3 values variables
NewPart.Position = Vector3.new(50,200,50)
NewPart.Anchored = true

-- Making rain block


while true do
	wait()
	local rain = Instance.new("Part", game.Workspace) -- this will create a new part forever
	rain.Position = Vector3.new(0,50,0)
	rain.Size = Vector3.new(0.2,0.5,0.2)
	rain.Anchored = false
	rain.Transparency = 0.25
	rain.BrickColor = BrickColor.new("Baby blue")

end


-- Breaks / Loop Breaking

local rainspawned = 0

while true do
	if rainspawned >= 250 then
		break
	end
	rainspawned = rainspawned + 1
	wait()
	local rainSpawner = Instance.new("Part",game.Workspace)
	rainSpawner.Size = Vector3(0.5,2,0.5)
	rainSpawner.Position = Vector3(0,50,0)
	rainSpawner.Anchored = false
	rainSpawner.Transparency = 0.5
end

-- Random

local RandomNumber = math.random(1,30) -- this will get a random number between 1 and 30

math.randomseed(tick()) -- tick is the time since 1967, so if we want to always have a random seed we put tick there cus is always different

-- Random Rain


while true do
	if rainspawned >= 250 then
		break
	end
	local randomrain = math.random(1,53)
	rainspawned = rainspawned + 1
	wait()
	local rainSpawner = Instance.new("Part",game.Workspace)
	rainSpawner.Size = Vector3(0.5,2,0.5)
	rainSpawner.Position = Vector3(randomrain,50,randomrain)
	rainSpawner.Anchored = false
	rainSpawner.Transparency = 0.5
end

-- Leaderboard / Leaderstats

game.Players.PlayerAdded:Connect(function(player)
	
	local leaderstats = Instance.new("Folder",player) -- a folder store values and data
	leaderstats.Name = "leaderstats" -- we need to name the folder to work
	
	local Points = Instance.new("IntValue", leaderstats) -- intvalue variable thats a number that can be used across any script 
	Points.Name = "Points"
	Points.Value = 5 -- changes the value of the points
	
	local XP = Instance.new("IntValue", leaderstats) -- intvalue variable thats a number that can be used across any script 
	XP.Name = "XP"
	XP.Value = 5 -- changes the value of the XP
end)

-- Points giver (inside a part, we need to add a click detector to a part then we script it)

game.Workspace.MyPart.ClickDetector.MouseClick:Connect(function(player)
	
	local PlayerPoints = player.leaderstats.Points
	PlayerPoints.Value = PlayerPoints.Value + 1 
end)


-- Tables

local MyFirstTable = {5, 3, 6, 8, "Eleven", game.Workspace.Baseplate} -- this is a table

local PlayersPhoneNumbers = {2, 5, 8, 9, 1}

local OmletteIngredients = {"Ham", "Eggs", "Cheese"}
print(OmletteIngredients[1]) -- in roblox lua a table starts at 1

print(table.concat(PlayersPhoneNumbers, ", ")) -- it will print 2, 5, 8, 9, 1 u can use with strings too

table.insert(PlayersPhoneNumbers, 6) -- it will insert 6

table.remove(PlayersPhoneNumbers, 2) -- it will remove the second number of the table

table.sort(PlayersPhoneNumbers) -- its sorts the smallest number



-- in pairs loop / pairs loop

local SecondTable = {"Pizza", "Pasta", "Hotdogs"}

for key, foods in pairs(SecondTable) do -- the first time it loop the key value will be one and the foods value will be pizza and so on
	print(key.."="..foods) -- how to concatenate in print
	
end

local HouseParts = {game.Workspace.Part1, game.Workspace.Part2, game.Workspace.Part3, game.Workspace.Part4}

for i, v in pairs(HouseParts) do
	wait(3)
	v:Destroy() -- will delete all the parts
end

