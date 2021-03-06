private ["_freq"];	
if ((TF_tangent_lr_pressed) and {alive TFAR_currentUnit}) then {
	private "_radio";
	_radio = call TFAR_fnc_activeLrRadio;
	if ((_radio call TFAR_fnc_getAdditionalLrChannel) > -1) then {
		_freq = [_radio, (_radio call TFAR_fnc_getAdditionalLrChannel) + 1] call TFAR_fnc_GetChannelFrequency;
	
		["OnBeforeTangent", TFAR_currentUnit, [TFAR_currentUnit, _radio, 1, true, false]] call TFAR_fnc_fireEventHandlers;
		[format[localize "STR_additional_transmit_end",format ["%1<img size='1.5' image='%2'/>",[_radio select 0, "displayName"] call TFAR_fnc_getLrRadioProperty, getText(configFile >> "CfgVehicles"  >> typeof (_radio select 0) >> "picture")], (_radio call TFAR_fnc_getAdditionalLrChannel) + 1, _freq],
		format["TANGENT_LR	RELEASED	%1%2	%3	%4", _freq, (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrRadioCode, ([_radio select 0, "tf_range"] call TFAR_fnc_getLrRadioProperty) * (call TFAR_fnc_getTransmittingDistanceMultiplicator), [_radio select 0, "tf_subtype"] call TFAR_fnc_getLrRadioProperty]
		] call TFAR_fnc_ProcessTangent;
		TF_tangent_lr_pressed = false;
		//						unit, radio, radioType, additional, buttonDown
		["OnTangent", TFAR_currentUnit, [TFAR_currentUnit, _radio, 1, true, false]] call TFAR_fnc_fireEventHandlers;
	};
};
false