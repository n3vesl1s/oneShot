-- Old lens (red) [DONE]

local sprite = Resources.sprite_load("oneShot", "item/oldLens", PATH.."assets/sprites/items/Sprite-0003.png", 1, 16, 16)

local item = Item.new("oneShot", "oldLens")

item:set_sprite(sprite)
item:set_tier(Item.TIER.rare)
item:set_loot_tags(Item.LOOT_TAG.category_damage)

item:onAttackCreate(function(actor, stack, attack_info)
    attack_info:set_critical(true)
    attack_info:set_damage(attack_info.damage * (1 + ((stack - 1) * 0.33)))
end)