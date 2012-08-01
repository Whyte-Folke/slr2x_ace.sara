// Runs all scripts from in goodsarray defined "Items/Weapons/Etc". The scripts are called with "init".

sleep 2;
_initFileNames = [];

{													
_filename = _x call INV_getitemFilename;							
_item     = _x call INV_getitemScriptName;				

if ((_filename != "") and (!(_filename in _initFileNames))) then 
{								
_initFileNames = _initFileNames + [_filename];								
["init", _item] execVM format["%1", _filename];															
};

} forEach INV_AlleItemsArray;
// Debug option:
if (interndebug) then {
	debugarray = debugarray + [ format["Filenames prepared for init-run: %1", _initFileNames ] ];
};