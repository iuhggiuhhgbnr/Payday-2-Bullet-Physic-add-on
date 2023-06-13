iuhWeaponPrjWeaponBase = iuhWeaponPrjWeaponBase or class(NewRaycastWeaponBase)
iuhWeaponPrjFLAMEWeaponBase = iuhWeaponPrjFLAMEWeaponBase or class(NewRaycastWeaponBase)
iuhWeaponPrjTHERMITEWeaponBase = iuhWeaponPrjTHERMITEWeaponBase or class(NewRaycastWeaponBase)
iuhWeaponPrjBUCKWeaponBase = iuhWeaponPrjBUCKWeaponBase or class(NewRaycastWeaponBase)
iuhWeaponPrjVOLLEYWeaponBase = iuhWeaponPrjVOLLEYWeaponBase or class(NewRaycastWeaponBase)

-- More Weapon Stats Support
if Faker then
	ProjectileWeaponBase = ProjectileWeaponBase or class(NewRaycastWeaponBase)

	Faker.classes.iuhWeaponPrjWeaponBase = iuhWeaponPrjWeaponBase
	Faker:redo_class('iuhWeaponPrjWeaponBase', 'ProjectileWeaponBase')

	Faker.classes.iuhWeaponPrjFLAMEWeaponBase = iuhWeaponPrjFLAMEWeaponBase
	Faker:redo_class('iuhWeaponPrjFLAMEWeaponBase', 'ProjectileWeaponBase')

	Faker.classes.iuhWeaponPrjBUCKWeaponBase = iuhWeaponPrjBUCKWeaponBase
	Faker:redo_class('iuhWeaponPrjBUCKWeaponBase', 'ProjectileWeaponBase')

	Faker.classes.iuhWeaponPrjTHERMITEWeaponBase = iuhWeaponPrjTHERMITEWeaponBase
	Faker:redo_class('iuhWeaponPrjTHERMITEWeaponBase', 'ProjectileWeaponBase')

	Faker.classes.iuhWeaponPrjVOLLEYWeaponBase = iuhWeaponPrjVOLLEYWeaponBase
	Faker:redo_class('iuhWeaponPrjVOLLEYWeaponBase', 'ProjectileWeaponBase')
end