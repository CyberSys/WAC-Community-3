if not wac then return end

ENT.Base 				= "wac_hc_base_twin"
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
ENT.Coaxial		= true

function ENT:AddSeatTable()
    return{
        [1]={
            Pos=Vector(116, 0, 52),
            ExitPos=Vector(160,70,40),
            NoHud=false,
		wep={[1]=wac.aircraft.getWeapon("M134",{
		Name="Shipunov 2A42",
		Ammo=460,
		MaxAmmo=460,
		NextShoot=1,
		LastShot=0,
		Gun=1,
		ShootDelay=0.04,
		ShootPos1=Vector(140,-35,43),
		ShootPos2=Vector(140,-35,43),
		func=function(self, t, p)
			if t.NextShoot <= CurTime() then
				if t.Ammo>0 then
					if !t.Shooting then
						t.Shooting=true
						t.SStop:Stop()
						t.SShoot:Play()
					end
					local bullet={}
					bullet.Num 		= 1
					bullet.Src 		= self:LocalToWorld(t.Gun==1 and t.ShootPos1 or t.ShootPos2)
					bullet.Dir 		= self:GetForward()
					bullet.Spread 	= Vector(0.023,0.023,0)
					bullet.Tracer		= 0
					bullet.Force		= 10
					bullet.Damage	= 80
					bullet.Attacker 	= p
					local effectdata=EffectData()
					effectdata:SetOrigin(bullet.Src)
					effectdata:SetAngles(self:GetAngles())
					effectdata:SetScale(1.5)
					util.Effect("MuzzleEffect", effectdata)
					self.Entity:FireBullets(bullet)
					t.Gun=(t.Gun==1 and 2 or 1)
					t.Ammo=t.Ammo-1
					t.LastShot=CurTime()
					t.NextShoot=t.LastShot+t.ShootDelay
					local ph=self:GetPhysicsObject()
					if ph:IsValid() then
						ph:AddAngleVelocity(Vector(0,0,t.Gun==1 and 3 or -3))
					end
				end
				if t.Ammo<=0 then
					t.StopSounds(self,t,p)
					t.Ammo=t.MaxAmmo
					t.NextShoot=CurTime()+60
				end
			end
		end,
		StopSounds=function(self,t,p)
			if t.Shooting then
				t.SShoot:Stop()
				t.SStop:Play()
				t.Shooting=false
			end
		end,
		Init=function(self,t)
			t.SShoot=CreateSound(self,"WAC/KA-50/2A42.wav")
			t.SStop=CreateSound(self,"WAC/KA-50/2A42_stop.wav")
		end,
		Think=function(self,t,p)
			if t.NextShoot<=CurTime() then
				t.StopSounds(self,t,p)
			end
		end,
		DeSelect=function(self,t,p)
			t.StopSounds(self,t,p)
		end
			}),
				[2]=wac.aircraft.getWeapon("Hydra 70",{
					Name="S-8",
					Ammo=80,
					MaxAmmo=80,
					ShootPos={
						[1]=Vector(14,-80,46),
						[2]=Vector(14,80,46),
					}
				}),	
			},
		},

	}
end

function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity,"WAC/KA-50/start.wav"),
		Blades=CreateSound(self.Entity,"KA50.External"),
		Engine=CreateSound(self.Entity,"KA50.Internal"),
		MissileAlert=CreateSound(self.Entity,"WAC/Heli/heatseeker_track_warning.wav"),
		MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
		MinorAlarm=CreateSound(self.Entity,"WAC/Heli/fire_alarm_tank.wav"),
		LowHealth=CreateSound(self.Entity,"WAC/Heli/fire_alarm.wav"),
		CrashAlarm=CreateSound(self.Entity,"WAC/Heli/laser_warning.wav"),
	}
end
