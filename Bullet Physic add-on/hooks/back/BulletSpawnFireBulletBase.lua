BulletPhysicFireBulletBase = BulletPhysicFireBulletBase or class(FlameBulletBase)

function BulletPhysicFireBulletBase:play_impact_sound_and_effects(weapon_unit, col_ray)
	managers.game_play_central:play_impact_sound_and_effects(self:_get_sound_and_effects_params(weapon_unit, col_ray, false))
	self:_spawn_environment_fire(normal, col_ray)
end

function BulletPhysicFireBulletBase:_spawn_environment_fire(normal, col_ray)
	local position = col_ray.position
	local rotation = Rotation(0, 0, 0)
	local data = tweak_data.env_effect:incendiary_fire()
	--local data = tweak_data.env_effect:trip_mine_fire()
	--local data = tweak_data.env_effect:molotov_fire()
	data.burn_duration = 10

	EnvironmentFire.spawn(position, rotation, data, normal, self._thrower_unit, 0, 1)

	self.burn_stop_time = TimerManager:game():time() + 10
end


