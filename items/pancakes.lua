-- Pancakes (green) [DONE]

local sprite = Resources.sprite_load("oneShot", "item/pancakes", PATH.."assets/sprites/items/Sprite-0002.png", 1, 16, 16)

local item = Item.new("oneShot", "pancakes")

item:set_sprite(sprite)
item:set_tier(Item.TIER.uncommon)
item:set_loot_tags(Item.LOOT_TAG.category_healing)

local bonus_hp = 0

item:onAcquire(function(actor, stack)
    bonus_hp = bonus_hp + math.ceil(40 / (1 + 0.1 * stack))
end)

item:onStatRecalc(function(actor, stack)
    actor.attack_speed = actor.attack_speed + (1 - 1 / (1 + 0.05 * stack))
    actor.maxhp = actor.maxhp + bonus_hp
    actor:heal(actor.maxhp)
end)