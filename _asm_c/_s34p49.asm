TITLE _s34p49.asm GUI_CreateHotkey()
; ST_GUI.H

.MODEL LARGE, C

EXTRN g_GUI_Control_Count:WORD
EXTRN gfp_GUI_Control_Table:DWORD

.CODE
;segment seg034 byte public 'CODE' use16
; 	 assume cs:seg034
; 	 ;org 0Eh
; 	 assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

PUBLIC GUI_CreateHotkey

;struc GUI_CTRL ; (sizeof=0x26)
GUI_CTRL struc
Left dw ?
Top dw ?
Right dw ?
Bottom dw ?
Ctrl_Type dw ?
UU_Help dw ?
Font_Index dw ?
ColorSet1 dw ?
Rect_FX dw ?
Selectable dw ?
ColorSet2 dw ?
Param0 dw ?                             ; Text@                           (6:Min_Val, 9:Parent)
Param1 dw ?                             ; Trig_State     (6:Max_Val, 9/A:Index, B:IMG, C:CellW)
Param2 dw ?                             ; State@        (4/B:BG_Color, 6:StSeg, 8:Len, C:CellH)
Param3 dw ?                             ; FullFrames    (4:Align, 6:MinSlide, A:CBlock, C:Col@)
Param4 dw ?                             ; MaxSlide                           (4:CStyle, C:Row@)
Param5 dw ?                             ; IMG_Seg                        (4/B:MaxLen, 6:Orient)
Param6 dw ?                             ; CorsorColors@                    (6:StOff, B:Outline)
Hotkey db ?
Unused_25h db ?
;ends GUI_CTRL
GUI_CTRL ends

proc GUI_CreateHotkey

    Hotkey_Char = word ptr 6

    push bp
    mov  bp, sp
    push si
    push di

    mov di, [bp+Hotkey_Char]

    mov ax, [g_GUI_Control_Count]
    mov dx, 26h
    imul dx
    les bx, [gfp_GUI_Control_Table]
    add bx, ax
    mov [es:bx+GUI_CTRL.Left], 500
    mov ax, [g_GUI_Control_Count]
    mov dx, 26h
    imul dx
    les bx, [gfp_GUI_Control_Table]
    add bx, ax
    mov [es:bx+GUI_CTRL.Top], 500
    mov ax, [g_GUI_Control_Count]
    mov dx, 26h
    imul dx
    les bx, [gfp_GUI_Control_Table]
    add bx, ax
    mov [es:bx+GUI_CTRL.Right], 500
    mov ax, [g_GUI_Control_Count]
    mov dx, 26h
    imul dx
    les bx, [gfp_GUI_Control_Table]
    add bx, ax
    mov [es:bx+GUI_CTRL.Bottom], 500
    mov ax, [g_GUI_Control_Count]
    mov dx, 26h
    imul dx
    les bx, [gfp_GUI_Control_Table]
    add bx, ax
    mov [es:bx+GUI_CTRL.Ctrl_Type], 07h ; Ctrl_Label
    mov ax, [g_GUI_Control_Count]
    mov dx, 26h
    imul dx
    les bx, [gfp_GUI_Control_Table]
    add bx, ax
    mov [es:bx+GUI_CTRL.UU_Help], -1
    mov ax, [g_GUI_Control_Count]
    mov dx, 26h
    imul dx
    les bx, [gfp_GUI_Control_Table]
    add bx, ax

    mov al, [di]
    mov [es:bx+GUI_CTRL.Hotkey], al

    mov ax, [g_GUI_Control_Count]
    mov dx, 26h
    imul dx
    les bx, [gfp_GUI_Control_Table]
    add bx, ax
    cmp [es:bx+GUI_CTRL.Hotkey], 60h
    jle short @@Done
    mov ax, [g_GUI_Control_Count]
    mov dx, 26h
    imul dx
    les bx, [gfp_GUI_Control_Table]
    add bx, ax
    cmp [es:bx+GUI_CTRL.Hotkey], 7Bh
    jge short @@Done
    mov ax, [g_GUI_Control_Count]
    mov dx, 26h
    imul dx
    les bx, [gfp_GUI_Control_Table]
    add bx, ax
    mov al, [es:bx+GUI_CTRL.Hotkey]
    add al, 'A'-'a'
    push ax
    mov ax, [g_GUI_Control_Count]
    mov dx, 26h
    imul dx
    les bx, [gfp_GUI_Control_Table]
    add bx, ax
    pop ax
    mov [es:bx+GUI_CTRL.Hotkey], al

@@Done:
    mov ax, [g_GUI_Control_Count]
    inc ax
    mov [g_GUI_Control_Count], ax

    mov ax, [g_GUI_Control_Count]
    dec ax

    jmp short $+2

    pop di
    pop si
    pop bp
    ret

endp GUI_CreateHotkey

;ends seg034

end