


MoX vs. MoM


¿ For Sure ?
MoX
    MoX.C/.H <-> MoX_Lib.C/.H
    Allocate
    (FLIC_)Draw
    EMM
    Exit
    Fields
    file_ani
    Fonts
    GENDRAW
    Graphics
    Input
    IO_Buffer
    (LBX)Load
    Mouse
    MoX_DBG
    paragrph
    SOUND
    TEXTBOX
    Video
    Video2
    ...
    types
    defines
    enums?
    structs?

~== MoX, but specifically/only for MoM?
ALLOC
..., defines, enums, structs, ...
...record sizes...
The settings and config would seem to be prime examples of this conundrum.
    ...structures...filenames...

Progression?
rename MoX_Data.C/.H
rename MoX.C/.H - ...MoX_MoM...MoX_Lib...

¿ weirdly add MoX_STRU, MoX_ENUM, etc. ? just used MoX_DEF? move to MoX_Lib?
...something I saw somewhere just had a massive <lib name>.H with *everything* in there...


eliminate the declarations in MoX.H for the MoX functions
add all MoX headers to MoX_Lib.H
move all MoM includes to MoM.H from MoX.H
...requires moving the modules to the MoX project