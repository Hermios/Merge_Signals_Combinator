msc_prototype={}
custom_prototypes[prototype]=msc_prototype
function msc_prototype:new(entity)
	local sender = entity.surface.create_entity({name=ghost_merge_signals_provider,position=entity.position,force=entity.force})
		sender.operable = false
		sender.minable = false
		sender.destructible = false
		entity.connect_neighbour{wire=defines.wire_type.green,target_entity=sender,source_circuit_id=defines.circuit_connector_id.combinator_output}
		entity.connect_neighbour{wire=defines.wire_type.red,target_entity=sender,source_circuit_id=defines.circuit_connector_id.combinator_output}
	return {
		entity=entity,
		sender=sender
	}
end

function msc_prototype:update_output()
    self.sender.get_or_create_control_behavior().parameters=nil
    local red_data=self.entity.get_circuit_network(defines.wire_type.red,defines.circuit_connector_id.combinator_input)
    local green_data=self.entity.get_circuit_network(defines.wire_type.green,defines.circuit_connector_id.combinator_input)
    if not red_data or not green_data then
        return
    end
    for i,signal_data in pairs(red_data.signals or {}) do
        signal_data.count=green_data.get_signal(signal_data.signal)*signal_data.count
        if signal_data.count>0 then
            self.sender.get_or_create_control_behavior().set_signal(i,signal_data)
        end
    end
end

function msc_prototype:on_removed()
    self.sender.destroy()
end