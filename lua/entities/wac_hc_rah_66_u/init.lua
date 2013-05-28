
include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

ENT.EngineForce = 50
ENT.Weight = 14000
ENT.MaxEnterDistance = 100

function ENT:SpawnFunction(p, tr)
	if (!tr.Hit) then return end
	local e = ents.Create(ClassName)
	e:SetPos(tr.HitPos+Vector(0,0,70))
	e.Owner = p
	e:Spawn()
	e:Activate()
	return e
end

ENT.Wheels={
	{
		mdl="models/drmatt/rah66/frontwheel1.mdl",
		pos=Vector(2.34,-30,-46),
		friction=100,
		mass=250,
	},
	{
		mdl="models/drmatt/rah66/frontwheel2.mdl",
		pos=Vector(2.34,26,-46),
		friction=100,
		mass=250,
	},
	{
		mdl="models/drmatt/rah66/backwheel.mdl",
		pos=Vector(-272,-2,-52),
		friction=100,
		mass=250,
	},
}