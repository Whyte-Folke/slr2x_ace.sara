GFX_ArmaViewDistance         = 1200;				
GFX_ArmaTerrainGrids         = [50, 25, 12.5, 6.25, 3.125];															
GFX_ArmaTerrainGridsSel      = 1;											

setViewDistance GFX_ArmaViewDistance;														
setTerrainGrid (GFX_ArmaTerrainGrids select GFX_ArmaTerrainGridsSel);