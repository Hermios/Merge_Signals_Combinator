require "__Hermios_Framework__.runtime-stage-libs"
require "constants"

for _,combinator in pairs(game.get_surface(1).find_entities_filtered{name=prototype}) do
    local custom_prototype,index=get_custom_prototype(combinator)
    global.custom_entities[combinator.unit_number].sender.destroy()
    custom_entity=msc_prototype:new(combinator)
    global.custom_entities[combinator.unit_number]=custom_entity
    custom_entity.prototype_index=index
	setmetatable(custom_entity, custom_prototype)
	custom_prototype.__index=custom_prototype
end