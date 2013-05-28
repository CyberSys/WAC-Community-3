if not wac then return end

ENT.Base 				= "wac_hc_base"
ENT.Type 				= "anim"

ENT.PrintName			= "KA-50 BlackShark"
ENT.Author				= "SentryGunMan"
ENT.Category			= wac.aircraft.spawnCategory
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""
ENT.Spawnable			= true
ENT.AdminSpawnable		= true

ENT.Model			= "models/sentry/ka-50.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel		= "models/sentry/ka-50_br.mdl"
ENT.BackRotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.BackRotorModel	= "models/sentry/ka-50_tr.mdl"
ENT.TopRotorDir        = 1
ENT.BackRotorDir	= -1
ENT.TopRotorPos = Vector(30,0,106)
ENT.BackRotorPos	= Vector(30,0,158.5)
ENT.EngineForce	= 36
ENT.Weight		= 21600
ENT.SmokePos	= Vector(-30,60,97)
ENT.FirePos		= Vector(-30,60,97)
ENT.SmokePos2	= Vector(-30,-60,97)
ENT.FirePos2	= Vector(-30,-60,97)
ENT.TwinBladed = true

ENT.Seats = {
	{
		pos=Vector(116, 0, 52),
		exit=Vector(160,70,40),
	}
}

ENT.Sounds={
	Start="WAC/KA-50/start.wav",
	Blades="WAC/KA-50/external.wav",
	Engine="WAC/KA-50/internal.wav",
	MissileAlert="WAC/Heli/heatseeker_track_warning.wav",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="WAC/Heli/fire_alarm_tank.wav",
	LowHealth="WAC/Heli/fire_alarm.wav",
	CrashAlarm="WAC/Heli/laser_warning.wav"
}