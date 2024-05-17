msc_prototype={}
custom_prototypes[prototype]=msc_prototype
local computations={
    {second_constant=0,operation="+"},
    {second_constant=0,operation="+"},
    {second_constant=-1,operation="*"},
    {second_constant=2,operation="^"},
    {second_constant=2,operation="^"},
    {second_constant=-4,operation="/"},
    {second_constant=4,operation="/"}
}

local connections={
    {0,1,"green"},
    {0,2,"green"},
    {0,2,"red"},
    {0,3,"red"},
    {1,4,"green"},
    {3,4,"green"},
    {2,5,"green"},
    {4,6,"green"},
    {5,7,"green"},
    {6,0,"green"},
    {6,0,"red"},
    {7,0,"green"},
    {7,0,"red"}
}
function msc_prototype:new(entity)
    local combinators={}
    for i,computation in pairs(computations) do
        local combinator=entity.surface.create_entity({name=ghost_merge_signals_provider,position=entity.position,force=entity.force,direction=entity.direction})
        combinator.get_or_create_control_behavior().parameters={
            first_signal={type="virtual",name="signal-each"},
            output_signal={type="virtual",name="signal-each"},
            second_constant=computation.second_constant,
            operation=computation.operation
        }
        table.insert(combinators,combinator)
        combinator.operable = false
		combinator.minable = false
		combinator.destructible = false
    end
    for _,connection in pairs(connections) do
        local source=connection[1]==0 and entity or combinators[connection[1]]
        local source_circuit_id=connection[1]==0 and defines.circuit_connector_id.combinator_input or defines.circuit_connector_id.combinator_output
        local target_entity=connection[2]==0 and entity or combinators[connection[2]]
        local target_circuit_id=connection[2]==0 and defines.circuit_connector_id.combinator_output or defines.circuit_connector_id.combinator_input
        source.connect_neighbour{wire=defines.wire_type[connection[3]],target_entity=target_entity,source_circuit_id=source_circuit_id,target_circuit_id=target_circuit_id}
    end
	return {
		entity=entity,
		combinators=combinators
	}
end

function msc_prototype:on_removed()
    for _,combinator in pairs(self.combinators) do
        combinator.destroy()
    end
end