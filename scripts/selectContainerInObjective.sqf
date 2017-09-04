// grab the objective location
_objectiveLocation = _this select 0;
_availableObjectiveContainers = _objectiveLocation select 1;
_containerToSelect = (floor (random (count _availableObjectiveContainers)));
_selectedContainer = _availableObjectiveContainers select _containerToSelect;
_selectedContainer;