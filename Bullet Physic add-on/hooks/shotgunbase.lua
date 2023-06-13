-- Projectile
Hooks:PostHook(NewRaycastWeaponBase, "_update_stats_values", "iuhWeaponPrj_ShotgunBase:_update_stats_values", function (self, disallow_replenish)
	local factory_id = self._factory_id
    	local blueprint = self._blueprint
    	self.has_iuh_ConvertWeaponPrjBUCK_perk = managers.weapon_factory:has_perk("iuh_ConvertWeaponPrjBUCK", factory_id, blueprint)
		self._projectile_type = self:weapon_tweak_data().projectile_type
		log("self.has_iuh_ConvertWeaponPrj_perk"..tostring(self.has_iuh_ConvertWeaponPrjBUCK_perk))
end)


local iuhWeaponPrj_ShotgunBase_fire_raycast = ShotgunBase._fire_raycast 
function ShotgunBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)

	if self.has_iuh_ConvertWeaponPrjBUCK_perk then
		return iuhWeaponPrjBUCKWeaponBase._fire_raycast(self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	else
		return iuhWeaponPrj_ShotgunBase_fire_raycast(self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	end
end

