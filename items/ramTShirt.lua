-- Ram T-Shirt (Green) [DONE]

local sprite = Resources.sprite_load("oneShot", "item/tShirt", PATH.."assets/sprites/items/Sprite-0001.png", 1, 16, 16)

local item = Item.new("oneShot", "tShirt")

item:set_sprite(sprite)
item:set_tier(Item.TIER.uncommon)
item:set_loot_tags(Item.LOOT_TAG.category_utility)

item:onKillProc(function(actor, victim, stack)
    if Helper.chance(1 - 1 / (1 + 0.01 * stack)) then
        local item_rand = Item.get_random(0,1,2,4,5)
        actor:item_give(item_rand, 1, 1)
    end
end)