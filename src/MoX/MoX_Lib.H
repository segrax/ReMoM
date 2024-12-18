#ifndef MOX_LIB_H
#define MOX_LIB_H

#include "MoX_BASE.H"
#include "MoX_BITS.H"
#include "MoX_DEF.H"
#include "MoX_TYPE.H"

#include "..\MoM_DEF.H"
#include "..\MoM_Data.H"

#include "MoX_Temp.H"

#include "MOX_T4.H"  // ~ MOX & MOX2 //MoO2

#include "Allocate.H"
#include "CFG.H"
#include "DBG.H"
#include "DIR.H"
#include "DOS.H"
#include "EMM.H"
#include "Exit.H"
#include "Fields.H"
#include "file_ani.H"
#include "FLIC_Draw.H"
#include "Fonts.H"
#include "GENDRAW.H"
#include "Graphics.H"
#include "Input.H"
#include "IO_Buffer.H"
#include "Keyboard.H"
#include "LBX_Load.H"
#include "LOADSAVE.H"
#include "Mouse.H"
#include "paragrph.H"
#include "random.H"
#include "Timer.H"
#include "Util.H"
#include "Video.H"
#include "Video2.H"

#ifdef STU_DEBUG
#include "STU_DBG.H"    /* DLOG() */
#endif

#include <assert.h>
#include <malloc.h>     /* malloc() */
#include <stdio.h>      /* FILE; fclose(), fopen(), fread(), fseek(); */
#include <stdlib.h>     /* itoa() */
#include <string.h>     /* strcat(), strcpy() */

#endif  /* MOX_LIB_H */

// Allocate.C 
// #include "MoX_TYPE.H"   /* SAMB_ptr, etc. */
// #include "MoX_BITS.H"   /* GET_2B_OFS() etc. */
// #include "MoX_BASE.H"    /* ST_FAILURE, etc. */
// #include "MoX_DBG.H"    /* Check_Release_Version() */
// #include "Allocate.H"
// #include <malloc.h>     /* malloc() */
// #include <stdlib.h>     /* itoa() */
// #include <string.h>     /* strcat(), strcpy() */
