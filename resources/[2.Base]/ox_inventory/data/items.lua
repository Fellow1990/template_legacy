return {
	
	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['cola'] = {
		label = 'eCola',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = true,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water',
			event = 'fw_alert:useItem'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['mastercard'] = {
		label = 'Mastercard',
		stack = false,
		weight = 10,
		client = {
			usetime = 0,
			event = 'fw_bank:useCard'
		},
	},

	['visa'] = {
		label = 'Visa',
		stack = false,
		weight = 10,
		client = {
			usetime = 0,
			event = 'fw_bank:useCard'
		},
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	['identification'] = {
		label = 'Identification',
		weight = 0,
		stack = false,
		close = true,
		consume = 0,
		client = {
			export = 'qidentification.identification'
		}
	},

	['passport'] = {
        label = 'Passport',
        weight = 0,
        stack = false,
        close = true,
        consume = 0,
        client = {
            export = 'qidentification.identification'
        }
    },

	['drivers_license'] = {
		label = 'Permis de conduire',
		weight = 0,
		stack = false,
		close = true,
		consume = 0,
		client = {
			export = 'qidentification.identification'
		}
	},
		
	['firearms_license'] = {
		label = 'Permis d\'armes à feu',
		weight = 0,
		stack = false,
		close = true,
		consume = 0,
		client = {
			export = 'qidentification.identification'
		}
	},

	['clothing'] = {
		label = 'Vêtements',
		weight = 0.250,
		stack = true,
		close = true,
		client = {
			usetime = 0,
			event = 'fw_clothing:wearClothes'
		},
		buttons = {
			{
				label = 'Enlever',
				action = function(slot)
					TriggerEvent('fw_clothing:removeClothes', slot)
				end
			}
		}
	},

	['torso'] = {
		label = 'Torse',
		weight = 0.125,
		stack = true,
		close = true,
		client = {
			usetime = 0,
			event = 'fw_clothing:wearClothes'
		},
		buttons = {
			{
				label = 'Enlever',
				action = function(slot)
					TriggerEvent('fw_clothing:removeClothes', slot)
				end
			}
		}
	},

	['pants'] = {
		label = 'Jeans',
		weight = 0.125,
		stack = true,
		close = true,
		client = {
			usetime = 0,
			event = 'fw_clothing:wearClothes'
		},
		buttons = {
			{
				label = 'Enlever',
				action = function(slot)
					TriggerEvent('fw_clothing:removeClothes', slot)
				end
			}
		}
	},

	['shoes'] = {
		label = 'Chaussures',
		weight = 0.125,
		stack = true,
		close = true,
		client = {
			usetime = 0,
			event = 'fw_clothing:wearClothes'
		},
		buttons = {
			{
				label = 'Enlever',
				action = function(slot)
					TriggerEvent('fw_clothing:removeClothes', slot)
				end
			}
		}
	},

	['decals'] = {
		label = 'Decals',
		weight = 0.125,
		stack = true,
		close = true,
		client = {
			usetime = 0,
			event = 'fw_clothing:wearClothes'
		},
		buttons = {
			{
				label = 'Enlever',
				action = function(slot)
					TriggerEvent('fw_clothing:removeClothes', slot)
				end
			}
		}
	},

	['bags'] = {
		label = 'Sac',
		weight = 0.125,
		stack = false,
		client = {
			usetime = 0
		},
		buttons = {
			{
				label = 'Enlever',
				action = function(slot)
					TriggerEvent('fw_clothing:removeClothes', slot)
				end
			},
			{
				label = 'Mettre',
				action = function(slot)
					TriggerEvent('fw_clothing:bagsClothes', slot)
				end
			},
		}
	},

	['chain'] = {
		label = 'Chaîne',
		weight = 0.125,
		stack = true,
		close = true,
		client = {
			usetime = 0,
			event = 'fw_clothing:wearClothes'
		},
		buttons = {
			{
				label = 'Enlever',
				action = function(slot)
					TriggerEvent('fw_clothing:removeClothes', slot)
				end
			}
		}
	},

	['helmet'] = {
		label = 'Casque',
		weight = 0.125,
		stack = true,
		close = true,
		client = {
			usetime = 0,
			event = 'fw_clothing:wearClothes'
		},
		buttons = {
			{
				label = 'Enlever',
				action = function(slot)
					TriggerEvent('fw_clothing:removeClothes', slot)
				end
			}
		}
	},

	['glasses'] = {
		label = 'Lunettes',
		weight = 0.125,
		stack = true,
		close = true,
		client = {
			usetime = 0,
			event = 'fw_clothing:wearClothes'
		},
		buttons = {
			{
				label = 'Enlever',
				action = function(slot)
					TriggerEvent('fw_clothing:removeClothes', slot)
				end
			}
		}
	},

	['mask'] = {
		label = 'Masque',
		weight = 0.125,
		stack = true,
		close = true,
		client = {
			usetime = 0,
			event = 'fw_clothing:wearClothes'
		},
		buttons = {
			{
				label = 'Enlever',
				action = function(slot)
					TriggerEvent('fw_clothing:removeClothes', slot)
				end
			}
		}
	},

	['ears'] = {
		label = 'Oreille',
		weight = 0.125,
		stack = true,
		close = true,
		client = {
			usetime = 0,
			event = 'fw_clothing:wearClothes'
		},
		buttons = {
			{
				label = 'Enlever',
				action = function(slot)
					TriggerEvent('fw_clothing:removeClothes', slot)
				end
			}
		}
	},

	['bracelets'] = {
		label = 'Bracelet',
		weight = 0.125,
		stack = true,
		close = true,
		client = {
			usetime = 0,
			event = 'fw_clothing:wearClothes'
		},
		buttons = {
			{
				label = 'Enlever',
				action = function(slot)
					TriggerEvent('fw_clothing:removeClothes', slot)
				end
			}
		}
	},

	['watches'] = {
		label = 'Montre',
		weight = 0.125,
		stack = true,
		close = true,
		client = {
			usetime = 0,
			event = 'fw_clothing:wearClothes'
		},
		buttons = {
			{
				label = 'Enlever',
				action = function(slot)
					TriggerEvent('fw_clothing:removeClothes', slot)
				end
			}
		}
	},

	['bproof'] = {
		label = 'Armure',
		weight = 0.125,
		stack = true,
		close = true,
		client = {
			usetime = 0,
			event = 'fw_clothing:wearClothes'
		},
		buttons = {
			{
				label = 'Enlever',
				action = function(slot)
					TriggerEvent('fw_clothing:removeClothes', slot)
				end
			}
		}
	},

	['handcuffs'] = {
		label = 'Handcuffs',
		weight = 100,
		stack = false,
		allowArmed = true
	},

	['rope'] = {
		label = 'Rope',
		weight = 100,
		stack = false,
		allowArmed = true
	},

	['carkey'] = {
		label = 'Carkey',
		weight = 300,
		stack = false,
		client = {
			usetime = 0,
			event = 'fw_keys:useKey'
		},
		buttons = {
			{
				label = 'Vendre véhicule',
				group = 'Options',
				action = function(slot)
					TriggerEvent('fw_keys:sellCar', slot)
				end
			}
		}
	},

	['cloth'] = {
		label = 'Chiffon',
		weight = 100,
		stack = false,
		consume = 0,
		allowArmed = true
	},

	['tire'] = {
		label = 'Pneu',
		weight = 2500,
		stack = false,
		consume = 0,
		allowArmed = true
	},

	['blowpipe'] = {
		label = 'Chalumeaux',
		weight = 950,
		stack = false,
		consume = 0,
		allowArmed = true
	},

	['fixtool'] = {
		label = 'Kit de réparation',
		weight = 1000,
		stack = false,
		consume = 0,
		allowArmed = true
	},

	['key'] = {
		label = 'Clé',
		stack = false,
		weight = 10,
	},

	['cartegrise'] = {
		label = 'Carte grise',
		weight = 500
	},

	['tel'] = {
		label = 'Téléphone',
		weight = 0.125,
		stack = true,
		close = true,
		client = {
			usetime = 0,
			event = 'fw_territories:useTel'
		}
	},

	['pinkgrapes'] = {
		label = 'Raisin rose',
		weight = 0.125,
		stack = true,
		close = true
	},

	['blackgrapes'] = {
		label = 'Raisin noir',
		weight = 0.125,
		stack = true,
		close = true
	},

	['whitegrapes'] = {
		label = 'Raisin blanc',
		weight = 0.125,
		stack = true,
		close = true
	},

	['pinkgrapesjuice'] = {
		label = 'Jus de raisin rose',
		weight = 0.125,
		stack = true,
		close = true
	},

	['blackgrapesjuice'] = {
		label = 'Jus de raisin noir',
		weight = 0.125,
		stack = true,
		close = true
	},

	['whitegrapesjuice'] = {
		label = 'Jus de raisin blanc',
		weight = 0.125,
		stack = true,
		close = true
	}, 

	['vinrose'] = {
		label = 'Vin Rosé',
		weight = 0.125,
		stack = true,
		close = true
	},

	['vinrouge'] = {
		label = 'Vin Rouge',
		weight = 0.125,
		stack = true,
		close = true
	},

	['vinblanc'] = {
		label = 'Vin Blanc',
		weight = 0.125,
		stack = true,
		close = true
	},

	['emptywinebottle'] = {
		label = 'Empty Wine Bottle',
		weight = 0.125,
		stack = true,
		close = true
	}, 

	['screwdriver'] = {
		label = 'Tourne vis',
		weight = 1.0,
		stack = true,
		close = true
	},

	['fakeplate'] = {
		label = 'Fausse plaque',
		weight = 1.0,
		stack = true,
		close = true,
		client = {
			usetime = 0,
			event = 'fw_fakeplates:usePlate'
		},
	},

	['key_ring'] = {
		label = 'Trousseau de clés',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	}, 

	['bulletproof'] = {
		label = 'Gilet par balle',
		weight = 1,
		stack = false,
		close = false,
		consume = 0,
		client = {
			export = 'aza_bullet.bulletproof'
		}
	},
	
	['usb_key'] = {
		label = 'Usb',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	}, 

	['bike'] = {
		label = 'BMX',
		weight = 1.0,
		stack = true,
		close = true,
		client = {
			usetime = 0,
			event = 'fw_bike:useItem'
		},
	},

	['inductor2'] = {
		label = 'Inductor II',
		weight = 1.0,
		stack = true,
		close = true,
		client = {
			usetime = 0,
			event = 'fw_bike:useItem'
		},
	},
}