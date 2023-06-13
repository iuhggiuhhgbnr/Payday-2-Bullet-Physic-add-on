-- Projectile
Hooks:PostHook(NewRaycastWeaponBase, "_update_stats_values", "iuhWeaponPrj_NewRaycastWeaponBase:_update_stats_values", function (self, disallow_replenish)
	local factory_id = self._factory_id
    	local blueprint = self._blueprint
	self.has_iuh_ConvertWeaponPrj_perk = managers.weapon_factory:has_perk("iuh_ConvertWeaponPrj", factory_id, blueprint)
		self._projectile_type = self:weapon_tweak_data().projectile_type
		log("self.has_iuh_ConvertWeaponPrj_perk"..tostring(self.has_iuh_ConvertWeaponPrj_perk))	
		
end)

local ids_volley = Idstring("volley")
local FIRE_MODE_IDS = {
	single = ids_single,
	auto = ids_auto,
	burst = ids_burst,
	volley = ids_volley
}
local iuhWeaponPrj_RaycastWeaponBase_fire_raycast = NewRaycastWeaponBase._fire_raycast 
function NewRaycastWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data, ammo_usage)
	if self.has_iuh_ConvertWeaponPrj_perk then
		if self._fire_mode == ids_volley then
			return iuhWeaponPrjVOLLEYWeaponBase._fire_raycast(self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
		else
			return iuhWeaponPrjWeaponBase._fire_raycast(self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data, ammo_usage)
		end
		
	else
		return iuhWeaponPrj_RaycastWeaponBase_fire_raycast(self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data, ammo_usage)
	end

end




