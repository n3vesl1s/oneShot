-- Kafif (white) [BROKEN]

local sprite = Resources.sprite_load("oneShot", "item/kafif", PATH.."assets/sprites/items/Sprite-0004.png", 1, 16, 16)

local item = Item.new("oneShot", "kafif")
local meat = Item.find("ror-meatNugget")

item:set_sprite(sprite)
item:set_tier(Item.TIER.common)
item:set_loot_tags(Item.LOOT_TAG.category_utility)

local function itemCheck(actor, item1, item2)
    if item1 == nil then
        print("item1 is nil")
        return nil
    end

    if item2 == nil then
        print("item2 is nil")
        return nil
    end

    local item1_cnt = actor:item_stack_count(item1, 0)
    local item2_cnt = actor:item_stack_count(item2, 0)

    if item1_cnt > 0 and item2_cnt > 0 then
        actor:item_remove(item2, item2_cnt, 0)
        actor:item_give(item1, item2_cnt, 0)
    else
        return nil
    end
end

item:onAcquire(function(actor, stack)
    print(item)
    Alarm.create(itemCheck, 60, actor, item, meat)
end)

meat:onAcquire(function(actor, stack)
    print(meat)
    Alarm.create(itemCheck, 60, actor, item, meat)
end)

item:onKillProc(function(actor, victim, stack)
    if Helper.chance(1 - 1 / (1 + 0.05 * stack)) then
        actor:heal(actor.maxhp / 2)
    end
end)