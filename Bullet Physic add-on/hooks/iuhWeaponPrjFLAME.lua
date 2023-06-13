iuhWeaponPrjFLAME = iuhWeaponPrjFLAME or class(ProjectileBase)

function iuhWeaponPrjFLAME:init(unit)
	iuhWeaponPrjFLAME.super.init(self, unit, true)

	self._slot_mask = managers.slot:get_mask("arrow_impact_targets")

	self._damage_class = CoreSerialize.string_to_classtable("InstantBulletBase")
end

function iuhWeaponPrjFLAME:set_weapon_unit(weapon_unit)
	iuhWeaponPrjFLAME.super.set_weapon_unit(self, weapon_unit)

	self._slot_mask = weapon_unit:base()._bullet_slotmask
	self._damage = weapon_unit:base()._damage

end

function iuhWeaponPrjFLAME:throw(dir)
	local velocity = dir
	local launch_speed = 3500

	velocity = velocity * launch_speed
	velocity = Vector3(velocity.x, velocity.y, velocity.z)
	local mass_look_up_modifier = 1
	local mass = math.max(mass_look_up_modifier * (1 + math.min(0, dir.z)), 1)

	if self._simulated then
		self._unit:push_at(mass, velocity, self._unit:body(0):center_of_mass())	
		-- World:play_physic_effect(Idstring("physic_effects/anti_gravitate"), self._unit)	
		self._velocity = velocity
	end
end

function iuhWeaponPrjFLAME:_on_collision(col_ray, weapon_unit, user_unit, damage, blank)
	local damage_mult = self._weapon_damage_mult or 1
	local hit_unit = col_ray.unit
	if alive(col_ray.unit) then
		self._damage_class:on_collision(col_ray, self._weapon_unit or self._unit, self._thrower_unit, self._damage, false, false)

		if not hit_unit:character_damage() or not hit_unit:character_damage()._no_blood then
			
		end

		if Network:is_server() or client_damage or Network:is_client() then

			self._damage_class:on_collision(col_ray, self._weapon_unit or self._unit, self._thrower_unit, self._damage, false, false)

			if col_ray and col_ray.unit and alive(col_ray.unit:body("mover_blocker")) and col_ray.unit:character_damage() then 
					local fire_dot_data = {
						dot_damage = 5,
						dot_trigger_max_distance = 10000,
						dot_trigger_chance = 100,
						dot_length = 10,
						dot_tick_period = 0.5
					}
					local action_data = {}
					action_data.variant = "fire" 
					action_data.damage = self._damage * damage_mult
					action_data.attacker_unit = nil 
					action_data.col_ray = col_ray
					action_data.fire_dot_data = fire_dot_data
					col_ray.unit:character_damage():damage_fire(action_data)
					self._unit:set_slot(0)
					return		
			end
		end

	end

	self._unit:set_slot(0)

end



-- if alive(col_ray.unit:body("mover_blocker")) then 