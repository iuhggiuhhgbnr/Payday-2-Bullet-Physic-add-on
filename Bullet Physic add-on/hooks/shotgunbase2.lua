-- Projectile
Hooks:PostHook(NewRaycastWeaponBase, "_update_stats_values", "iuhWeaponPrjFLAME_ShotgunBase:_update_stats_values", function (self, disallow_replenish)
	local factory_id = self._factory_id
    	local blueprint = self._blueprint
	self.has_iuh_ConvertWeaponPrjFLAME_perk = managers.weapon_factory:has_perk("iuh_ConvertWeaponPrjFLAME", factory_id, blueprint)
		self._projectile_type = self:weapon_tweak_data().projectile_type
		log("self.has_iuh_ConvertWeaponPrjFLAME_perk"..tostring(self.has_iuh_ConvertWeaponPrjFLAME_perk))
end)


local iuhWeaponPrjFLAME_ShotgunBase_fire_raycast = ShotgunBase._fire_raycast 
function ShotgunBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	if self.has_iuh_ConvertWeaponPrjFLAME_perk then
		return iuhWeaponPrjFLAMEWeaponBase._fire_raycast(self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)	
	else
		return iuhWeaponPrjFLAME_ShotgunBase_fire_raycast(self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	end

end

