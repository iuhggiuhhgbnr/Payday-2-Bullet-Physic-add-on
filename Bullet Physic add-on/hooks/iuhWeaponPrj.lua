iuhWeaponPrj = iuhWeaponPrj or class(ProjectileBase)

function iuhWeaponPrj:init(unit)
	iuhWeaponPrj.super.init(self, unit, true)

	self._slot_mask = managers.slot:get_mask("arrow_impact_targets")

	self._damage_class = CoreSerialize.string_to_classtable("InstantBulletBase")
end

function iuhWeaponPrj:set_weapon_unit(weapon_unit)
	iuhWeaponPrj.super.set_weapon_unit(self, weapon_unit)

	self._slot_mask = weapon_unit:base()._bullet_slotmask
	self._damage = weapon_unit:base()._damage
end

function iuhWeaponPrj:throw(dir)
	local velocity = dir
	local launch_speed = 15000
	-- local launch_speed = 9500

	velocity = velocity * launch_speed
	velocity = Vector3(velocity.x, velocity.y, velocity.z)
	-- velocity = Vector3(velocity.x, velocity.y, velocity.z)
	local mass_look_up_modifier = 3
	local mass = math.max(mass_look_up_modifier * (1 + math.min(0, dir.z)), 1)

	if self._simulated then
		self._unit:push_at(mass, velocity, self._unit:body(0):center_of_mass())	
		-- World:play_physic_effect(Idstring("physic_effects/anti_gravitate"), self._unit)	
		self._velocity = velocity
	end
end

function iuhWeaponPrj:_on_collision(col_ray)

	if alive(col_ray.unit) then
		self._damage_class:on_collision(col_ray, self._weapon_unit or self._unit, self._thrower_unit, self._damage, false, false)

	end

	self._unit:set_slot(0)
end