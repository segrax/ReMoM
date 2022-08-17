TITLE _s33p35.asm GUI_RestoreCursorArea_DSP

.MODEL LARGE, C

EXTRN g_CRSR_Prev:WORD
EXTRN g_CRSR_Save_RSP:WORD
EXTRN g_RSP_Idx:WORD

.CODE
;segment seg033 byte public 'CODE' use16
;    assume cs:seg033
;    ;org 6
;    assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

PUBLIC CRL_Restore_DSP

proc CRL_Restore_DSP

    Width_Bytes = byte ptr -6
    Height_Lines = word ptr -4
    ScreenPage_Offset = word ptr -2

    push bp
    mov  bp, sp
    sub  sp, 6
    push si
    push di
    push es
    push ds

;    mov ax, seg dseg
    mov ax, seg DGROUP
    mov ds, ax
    ;assume ds:dseg
    assume ds:DGROUP

    cmp [g_CRSR_Prev], 0
    jnz short loc_24979

    pop ds
    pop es
    pop di
    pop si
    mov sp, bp
    pop bp
    ret

loc_24979:
    mov ax, 1
    sub ax, [g_RSP_Idx]
    mov ah, al
    xor al, al
    shl ax, 1
    shl ax, 1
    add ax, 0A000h
    mov es, ax
    sub si, si
    ;mov di, [word ptr g_CRSR_Save_RSP.ScreenPage_Offset+si]
    mov di, [word ptr g_CRSR_Save_RSP+si]
    add si, 2
    mov [bp+ScreenPage_Offset], di
    mov ax, g_CRSR_Save_RSP[si]
    add si, 2
    mov [bp+Width_Bytes], al
    mov ax, g_CRSR_Save_RSP[si]
    add si, 2
    mov [bp+Height_Lines], ax
    mov bl, 1
    mov dx, 3C4h
    mov al, 2
    out dx, al
    inc dx

@@LoopsPlanes:
    mov al, bl
    out dx, al
    sub bh, bh

@@LoopLines:
    mov cx, [bp+Height_Lines]

@@LoopWords:
    mov ax, g_CRSR_Save_RSP[si]
    stosw
    add si, 2
    add di, 4Eh
    loop @@LoopWords

    mov di, [bp+ScreenPage_Offset]
    inc bh
    sub ah, ah
    mov al, bh
    shl ax, 1
    add di, ax
    cmp bh, [bp+Width_Bytes]
    jnz short @@LoopLines

    shl bl, 1
    mov di, [bp+ScreenPage_Offset]
    cmp bl, 10h
    jnz short @@LoopsPlanes

    pop ds
    pop es
    pop di
    pop si
    mov sp, bp
    pop bp
    ret

endp CRL_Restore_DSP

;ends seg033

end