if SERVER then AddCSLuaFile() end

local f=file.Find('wac/*.lua', "LUA")
local found=false
for k,v in pairs(f) do
	if v=="aircraft.lua" then
		include('wac/aircraft.lua')
		found=true
	end
end

timer.Simple(2,function()
	if not found and CLIENT then
		LocalPlayer():ChatPrint("WAC Aircraft is not installed, opening steam browser..")
		timer.Simple(3,function()
			gui.OpenURL('http://steamcommunity.com/sharedfiles/filedetails/?id=104990330')
		end)
	elseif not found and SERVER then
		print("WAC is not installed!")
	end
end)

if not found then return end

wac.aircraft.spawnCategoryU = "WAC Unbreakable"

sound.Add(
{
	name = "UH1D.External",
	channel = CHAN_STATIC,
	soundlevel = 140,
	sound = "WAC/uh1d/external.wav"
})

sound.Add(
{
	name = "UH1D.Internal",
	channel = CHAN_STATIC,
	soundlevel = 60,
	sound = "WAC/uh1d/internal.wav"
})

sound.Add(
{
	name = "OH58D.External",
	channel = CHAN_STATIC,
	soundlevel = 110,
	sound = "WAC/kiowa/external.wav"
})

sound.Add(
{
	name = "OH58D.Internal",
	channel = CHAN_STATIC,
	soundlevel = 60,
	sound = "WAC/kiowa/internal.wav"
})

sound.Add(
{
	name = "MV22.External",
	channel = CHAN_STATIC,
	soundlevel = 110,
	sound = "WAC/mv22/external.wav"
})

sound.Add(
{
	name = "MV22.Internal",
	channel = CHAN_STATIC,
	soundlevel = 60,
	sound = "WAC/mv22/internal.wav"
})