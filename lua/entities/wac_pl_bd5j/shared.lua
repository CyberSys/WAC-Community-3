if not wac then return end

ENT.Base 				= "wac_pl_base"
ENT.Type 				= "anim"

ENT.PrintName			= "BD-5J MicroJet"
ENT.Author				= "Dr. Matt"
ENT.Category			= wac.aircraft.spawnCategory
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""
ENT.Spawnable			= true
ENT.AdminSpawnable	= true

ENT.Model			= "models/drmatt/bd5/body.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.TopRotorDir        = 1
ENT.TopRotorPos	= Vector(70, 0, 10)
ENT.BackRotorPos	= Vector(8, 0, -48)
ENT.EngineForce	= 240
ENT.Weight		= 300
ENT.SmokePos		= Vector(-138.73,-1,36.81)
ENT.FirePos		= Vector(-138.73,-1,36.81)

ENT.EngineWeight = {
	Weight = 50,
	Position = Vector(-100,0,0)
}


ENT.WheelInfo={
    {
        mdl="models/drmatt/bd5/wheel.mdl",
        pos=Vector(117.12,-0.69,-45.6),
        friction=1,
        mass=40,
    },
    {	mdl="models/drmatt/bd5/wheel.mdl",
        pos=Vector(0.34,-55.12,-38.44),
        friction=1,
        mass=40,
    },
    {	mdl="models/drmatt/bd5/wheel.mdl",
        pos=Vector(3.81,55.43,-38.62),
        friction=1,
        mass=40,
    },
}


function ENT:AddSeatTable()
    return{
        [1]={
			Pos=Vector(20,0,-5),
            ExitPos=Vector(62.11,49.27,-40),
			NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
    }
end

function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity,"WAC/bd5j/start.wav"),
		Blades=CreateSound(self.Entity,"BD5J.External"),
		Engine=CreateSound(self.Entity,"BD5J.Internal"),
		MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
		MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
		MinorAlarm=CreateSound(self.Entity,"HelicopterVehicle/MinorAlarm.mp3"),
		LowHealth=CreateSound(self.Entity,"HelicopterVehicle/LowHealth.mp3"),
		CrashAlarm=CreateSound(self.Entity,"HelicopterVehicle/CrashAlarm.mp3"),
	}
end
