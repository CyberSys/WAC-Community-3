include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:SpawnFunction(ply, tr)
	if (!tr.Hit) then return end
	local ent=ents.Create(ClassName)
	ent:SetPos(tr.HitPos+tr.HitNormal*10)
	ent:Spawn()
	ent:Activate()
	ent:SetSkin(math.random(0,1))
	ent.Owner=ply
	return ent
end

ENT.Wheels={
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

function ENT:addRotors()
	self:base("wac_hc_base").addRotors(self)
	if self.UsePhysRotor2 then
		self.TopRotor2 = self:addEntity("prop_physics")
		self.TopRotor2:SetModel("models/props_junk/sawblade001a.mdl")
		self.TopRotor2:SetPos(self:LocalToWorld(self.TopRotorPos2))
		self.TopRotor2:SetAngles(self:GetAngles())
		self.TopRotor2:SetOwner(self.Owner)
		self.TopRotor2:SetNotSolid(true)
		self.TopRotor2:Spawn()
		self.TopRotor2.Phys = self.TopRotor2:GetPhysicsObject()
		self.TopRotor2.Phys:EnableGravity(false)
		self.TopRotor2.Phys:SetMass(5)
		self.TopRotor2.Phys:EnableDrag(false)
		self.TopRotor2:SetNoDraw(true)
		self.TopRotor2.fHealth = 100
		self.TopRotor2.wac_ignore = true
		if self.RotorModel2 then
			local e = self:addEntity("wac_hitdetector")
			self:SetNWEntity("wac_air_rotor_secondary", e)
			e:SetModel(self.RotorModel2)
			e:SetPos(self:LocalToWorld(self.TopRotorPos2))
			e:SetAngles(self:GetAngles())
			e:Spawn()
			e:SetNotSolid(true)
			e:SetParent(self.TopRotor2)
			e.wac_ignore = true
			local obb=e:OBBMaxs()
			self.RotorWidth2=(obb.x>obb.y and obb.x or obb.y)
			self.RotorHeight2=obb.z
			self.TopRotorModel2=e
		end
		constraint.Axis(self.Entity, self.TopRotor2, 0, 0, self.TopRotorPos2, Vector(0,0,1),0,0,0,1)
		self:AddOnRemove(self.TopRotor2)
	end
end

function ENT:PhysicsUpdate(ph)
	self:base("wac_hc_base").PhysicsUpdate(self,ph)
	
	local vel = ph:GetVelocity()	
	local pos = self:GetPos()
	local ri = self:GetRight()
	local up = self:GetUp()
	local fwd = self:GetForward()
	local ang = self:GetAngles()
	local dvel = vel:Length()
	local lvel = self:WorldToLocal(pos+vel)

	local realism = 2
	local pilot = self.Passenger[1]
	if IsValid(pilot) then
		realism = math.Clamp(tonumber(pilot:GetInfo("wac_cl_air_realism")), 1, 3)
	end

	local t = self:calcHover(ph,pos,vel,ang)

	local rotateX = (self.controls.roll*1.5+t.r)*self.rotorRpm
	local rotateY = (self.controls.pitch+t.p)*self.rotorRpm
	local rotateZ = self.controls.yaw*1.5*self.rotorRpm

	--local phm = (wac.aircraft.cvars.doubleTick:GetBool() and 2 or 1)
	local phm = FrameTime()*66
	if self.UsePhysRotor2 then
		if self.TopRotor2 and self.TopRotor2.Phys and self.TopRotor2.Phys:IsValid() then
			-- top rotor 2 physics
			local rotor = {}
			rotor.phys = self.TopRotor2.Phys
			rotor.angVel = rotor.phys:GetAngleVelocity()
			rotor.upvel = self.TopRotor2:WorldToLocal(self.TopRotor2:GetVelocity()+self.TopRotor2:GetPos()).z
			rotor.brake =
				math.Clamp(math.abs(rotor.angVel.z) - 2950, 0, 100)/10 -- RPM cap
				+ math.pow(math.Clamp(1500 - math.abs(rotor.angVel.z), 0, 1500)/900, 3)
				+ math.abs(rotor.angVel.z/10000)
				- (rotor.upvel - self.rotorRpm)*self.controls.throttle/1000

			rotor.targetAngVel =
				Vector(0, 0, math.pow(self.engineRpm,2)*self.TopRotorDir2*10)
				- rotor.angVel*rotor.brake/200

			rotor.phys:AddAngleVelocity(rotor.targetAngVel)
		end
	end
	
	if self.rotorRpm > 0.6 and self.rotorRpm < 0.79 and IsValid(self.TopRotorModel) then
		self.TopRotorModel:SetBodygroup(1,1)
	elseif self.rotorRpm > 0.8 and IsValid(self.TopRotorModel) then
		self.TopRotorModel:SetBodygroup(1,2)
	elseif self.rotorRpm < 0.4 and IsValid(self.TopRotorModel) then
		self.TopRotorModel:SetBodygroup(1,0)
	end

	if self.rotorRpm > 0.6 and self.rotorRpm < 0.79 and IsValid(self.TopRotorModel2) then
		self.TopRotorModel2:SetBodygroup(1,1)
	elseif self.rotorRpm > 0.8 and IsValid(self.TopRotorModel2) then
		self.TopRotorModel2:SetBodygroup(1,2)
	elseif self.rotorRpm < 0.4 and IsValid(self.TopRotorModel2) then
		self.TopRotorModel2:SetBodygroup(1,0)
	end
end

function ENT:KillTopRotor()
	self:base("wac_hc_base").KillTopRotor(self)
	
	if !self.TopRotor2 then return end
	local e = self:addEntity("prop_physics")
	e:SetPos(self.TopRotor2:GetPos())
	e:SetAngles(self.TopRotor2:GetAngles())
	e:SetModel(self.RotorModel2)
	e:SetSkin(self.TopRotorModel2:GetSkin())
	e:Spawn()
	local ph = e:GetPhysicsObject()
	e.wac_ignore=true
	if ph:IsValid() then
		ph:SetMass(1000)
		ph:EnableDrag(false)
		ph:AddAngleVelocity(self.TopRotor2.Phys:GetAngleVelocity())
		ph:SetVelocity(self.TopRotor2.Phys:GetAngleVelocity():Length()*self.TopRotor2:GetUp()*0.5 + self.TopRotor2:GetVelocity())
	end
	self.TopRotor2:Remove()
	self.TopRotor2 = nil
	e:SetNotSolid(true)
	timer.Simple(15, function()
		if !e or !e:IsValid() then return end
		e:Remove()
	end)
end