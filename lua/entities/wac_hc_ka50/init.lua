
include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
ENT.WheelInfo={
	{
		mdl="models/sentry/ka-50_fwheel.mdl",
		pos=Vector(163,0,4),
		friction=100,
		mass=250,
	},
	{
		mdl="models/sentry/ka-50_bwheel.mdl",
		pos=Vector(-25.5,-56,10),
		friction=100,
		mass=550
	},
	{
		mdl="models/sentry/ka-50_bwheel.mdl",
		pos=Vector(-25.5,56,10),
		friction=100,
		mass=550,
	},

}
function ENT:CustomPhysicsUpdate(ph)
	if self.rotorRpm > 0.6 and self.rotorRpm < 0.79 and IsValid(self.TopRotorModel) then
		self.TopRotorModel:SetBodygroup(1,1)
	elseif self.rotorRpm > 0.8 and IsValid(self.TopRotorModel) then
		self.TopRotorModel:SetBodygroup(1,2)
	elseif self.rotorRpm < 0.4 and IsValid(self.TopRotorModel) then
		self.TopRotorModel:SetBodygroup(1,0)
	end

	if self.rotorRpm > 0.6 and self.rotorRpm < 0.79 and IsValid(self.BackRotor) then
		self.BackRotorModel:SetBodygroup(1,1)
	elseif self.rotorRpm > 0.8 and IsValid(self.BackRotor) then
		self.BackRotorModel:SetBodygroup(1,2)
	elseif self.rotorRpm < 0.4 and IsValid(self.BackRotor) then
		self.BackRotorModel:SetBodygroup(1,0)
	end
end

function ENT:SpawnFunction(ply, tr)
	if (!tr.Hit) then return end
	local ent=ents.Create(ClassName)
	ent:SetPos(tr.HitPos+tr.HitNormal*10)
	ent:Spawn()
	ent:Activate()
	Skin = math.random( 0, 1 );
	ent:SetSkin(Skin)
	ent.Owner=ply	
	self.Sounds=table.Copy(sndt)
	return ent
end


