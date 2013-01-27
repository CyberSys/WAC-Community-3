if SERVER then AddCSLuaFile() end

local found=false
local f=file.Find('wac/*.lua', "LUA")
for k,v in pairs(f) do
	if v=="aircraft.lua" then
		include('wac/aircraft.lua')
		found=true
	end
end

timer.Simple(5,function()
	if not found and not WACFrame then
		if CLIENT then
			WACFrame=vgui.Create('DFrame')
			WACFrame:SetTitle("WAC is not installed")
			WACFrame:SetSize(ScrW()*0.95, ScrH()*0.95)
			WACFrame:SetPos((ScrW() - WACFrame:GetWide()) / 2, (ScrH() - WACFrame:GetTall()) / 2)
			WACFrame:MakePopup()
			
			local h=vgui.Create('DHTML')
			h:SetParent(WACFrame)
			h:SetPos(WACFrame:GetWide()*0.005, WACFrame:GetTall()*0.03)
			local x,y = WACFrame:GetSize()
			h:SetSize(x*0.99,y*0.96)
			h:SetAllowLua(true)
			h:OpenURL('http://mattjeanes.com/abyss/wac-warning.html')
		elseif SERVER then
			timer.Create("WAC-NotInstalled", 10, 0, function() print("WAC Aircraft is not installed!") end)
		end
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

sound.Add(
{
	name = "RAH66.External",
	channel = CHAN_STATIC,
	soundlevel = 120,
	sound = "WAC/rah66/external.wav"
})

sound.Add(
{
	name = "RAH66.Internal",
	channel = CHAN_STATIC,
	soundlevel = 50,
	sound = "WAC/Heli/heli_loop_int.wav"
})

sound.Add(
{
	name = "BD5J.External",
	channel = CHAN_STATIC,
	soundlevel = 140,
	sound = "WAC/bd5j/external.wav"
})

sound.Add(
{
	name = "BD5J.Internal",
	channel = CHAN_STATIC,
	soundlevel = 40,
	sound = "WAC/bd5j/internal.wav"
})

sound.Add(
{
	name = "KA50.External",
	channel = CHAN_STATIC,
	soundlevel = 120,
	sound = "WAC/KA-50/external.wav"
})

sound.Add(
{
	name = "KA50.Internal",
	channel = CHAN_STATIC,
	soundlevel = 60,
	sound = "WAC/KA-50/internal.wav"
})