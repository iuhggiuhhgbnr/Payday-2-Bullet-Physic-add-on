-- Projectile
Hooks:PostHook(NewRaycastWeaponBase, "_update_stats_values", "iuhWeaponPrj_NewRaycastWeaponBase:_update_stats_values", function (self, disallow_replenish)
	local factory_id = self._factory_id
    	local blueprint = self._blueprint
	self.has_iuh_ConvertWeaponPrj_perk = managers.weapon_factory:has_perk("iuh_ConvertWeaponPrj", factory_id, blueprint)
		self._projectile_type = self:weapon_tweak_data().projectile_type
		log("self.has_iuh_ConvertWeaponPrj_perk"..tostring(self.has_iuh_ConvertWeaponPrj_perk))	
		
end)


local iuhWeaponPrj_RaycastWeaponBase_fire_raycast = NewRaycastWeaponBase._fire_raycast 
function NewRaycastWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data, ammo_usage)
	if self.has_iuh_ConvertWeaponPrj_perk then
		return iuhWeaponPrjWeaponBase._fire_raycast(self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data, ammo_usage)
		
	else
		return iuhWeaponPrj_RaycastWeaponBase_fire_raycast(self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data, ammo_usage)
	end

end




