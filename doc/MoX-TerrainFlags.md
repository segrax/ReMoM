





TF_Road
TF_Enc_Road
TF_Corruption



0x00    00000000    nothing, nada, nunca, zero, NONE, UNDEFINED
0x01    00000001    Volcano - Player Num 1 / Player Idx 0
0x02    00000010    Volcano - Player Num 2 / Player Idx 1
0x03    00000011    Volcano - Player Num 3 / Player Idx 2
0x04    00000100    Volcano - Player Num 4 / Player Idx 3
0x05    00000101    Volcano - Player Num 5 / Player Idx 4
0x06    00000110    Volcano - Player Num 6 / Player Idx 5
0x07    00000111    Volcano - Player Num 7 / Player Idx 6
0x08    00001000    Road
0x10    00010000    Enchanted Road
0x18    00011000    Road & Enchanted Road
0x20    00100000    ¿ Corruption ?  ¿ NOT 11011111  0xDF ?
0x28    00101000    Corruption & Road



CITYCALC.C:    _map_square_flags[((wp * WORLD_SIZE) + (wy * WORLD_WIDTH) + wx)] &= 0xF7;  // not TF_Road
CITYCALC.C:    _map_square_flags[((wp * WORLD_SIZE) + (wy * WORLD_WIDTH) + wx)] &= 0xEF;  // not TF_Enc_Road

0xF7    11110111    ^0x08
0xEF    11101111    ^0x10
0xDF    11011111    ^0x20



int16_t Get_Useable_City_Area(int16_t city_wx, int16_t city_wy, int16_t city_wp, int16_t *wx_array, int16_t *wy_array)
    uint8_t * terrain_flags_table_row;
    terrain_flags_table_row = (uint8_t *)&_map_square_flags[(city_wp * WORLD_SIZE) + (square_y * WORLD_WIDTH)];
    if( (*(terrain_flags_table_row + square_x) & 0x20) == 0 ) /* TF_Corruption */



mov     cx, [bp+wx]
mov     si, [bp+wy]
mov     di, [bp+wp]
mov     ax, di
mov     dx, e_WORLD_SIZE
imul    dx
les     bx, [_map_square_flags]         ; 12Eh paragraphs in World_Data@
add     bx, ax
mov     ax, si
mov     dx, e_WORLD_WIDTH
imul    dx
add     bx, ax
add     bx, cx
mov     al, [es:bx]
and     al, 0DFh
push    ax
mov     ax, di
mov     dx, e_WORLD_SIZE
imul    dx
les     bx, [_map_square_flags]         ; 12Eh paragraphs in World_Data@
add     bx, ax
mov     ax, si
mov     dx, e_WORLD_WIDTH
imul    dx
add     bx, ax
add     bx, cx
pop     ax
mov     [es:bx], al


_map_square_flags[((wp * WORLD_SIZE) + (wy * WORLD_WIDTH) + wx)] = (_map_square_flags[((wp * WORLD_SIZE) + (wy * WORLD_WIDTH) + wx)] ^ 0xDF);


and     al, 11011111b




ALLOC.C:    _map_square_flags = (uint8_t *)Allocate_Next_Block(World_Data, 302);   // 302 Paragraphs, 4832 Bytes

CITYCALC.C:            terrain_flags_table_row = (uint8_t *)&_map_square_flags[(city_wp * WORLD_SIZE) + (square_y * WORLD_WIDTH)];
CITYCALC.C:    _map_square_flags[((wp * WORLD_SIZE) + (wy * WORLD_WIDTH) + wx)] &= 0xF7;  // not TF_Road
CITYCALC.C:    _map_square_flags[((wp * WORLD_SIZE) + (wy * WORLD_WIDTH) + wx)] &= 0xEF;  // not TF_Enc_Road

MainScr.C:    if((_map_square_flags[((_map_plane * WORLD_SIZE) + (unit_wy * WORLD_WIDTH) + unit_wx)] & TF_Corruption) == TF_Corruption)

MainScr_Maps.C:                terrain_flag = _map_square_flags[(world_plane * WORLD_SIZE_DB) + (itr_world_y * WORLD_WIDTH) + (curr_world_x)];
MainScr_Maps.C:                terrain_flags_table_sgmt = (uint8_t *)_map_square_flags;

MoX.C:_map_square_flags
MoX.C:    // _map_square_flags

MoX_Data.C:uint8_t * _map_square_flags;                // load in Load_SAVE_GAM()
MoX_Data.H:extern uint8_t * _map_square_flags;         // alloc in Allocate_Data_Space()

MoX_GAM.C:    fwrite(_map_square_flags, NUM_PLANES, 2400, file_pointer);
MoX_GAM.C:    fread(_map_square_flags, NUM_PLANES, 2400, file_pointer);

Terrain.C:    uint8_t * ptr_TBL_Terrain_Flags;
Terrain.C:    // _map_square_flags[((wp * WORLD_SIZE) + (wy * WORLD_WIDTH) + wx)] = (_map_square_flags[((wp * WORLD_SIZE) + (wy * WORLD_WIDTH) + wx)] | 0xDF);
Terrain.C:    ptr_TBL_Terrain_Flags = &_map_square_flags[((wp * WORLD_SIZE) + (wy * WORLD_WIDTH) + wx)];
Terrain.C:    terrain_flags = _map_square_flags[((wp * WORLD_SIZE) + (wy * WORLD_WIDTH) + wx)];
Terrain.C:    *ptr_TBL_Terrain_Flags = terrain_flags;
Terrain.C:    terrain_flags = _map_square_flags[((wp * WORLD_SIZE) + (wy * WORLD_WIDTH) + wx)];
Terrain.C:    _map_square_flags[((wp * WORLD_SIZE) + (wy * WORLD_WIDTH) + wx)] = (_map_square_flags[((wp * WORLD_SIZE) + (wy * WORLD_WIDTH) + wx)] & 0xDF);
Terrain.C:    _map_square_flags[((wp * WORLD_SIZE) + (wy * WORLD_WIDTH) + wx)] = 0;

UnitMove.C:        terrain_flags_ptr = (int8_t *)&_map_square_flags[wp * WORLD_SIZE];

WZD_o143.C:                    if((_map_square_flags[((city_wp * WORLD_SIZE) + ((city_wy + Y_Loop_Var) * WORLD_WIDTH) + (city_wx + X_Loop_Var))] & 0x08) != 0)  // TF_Road
WZD_o143.C:                        if((_map_square_flags[((city_wp * WORLD_SIZE) + (Y_Loop_Var * WORLD_WIDTH) + X_Loop_Var)] & 0x08) == 0)  // TF_Road
