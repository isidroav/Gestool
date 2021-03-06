/*
 * Harbour 3.2.0dev (r1307082134)
 * Borland C++ 5.8.2 (32-bit)
 * Generated C source from ".\Prg\WebBrow.prg"
 */

#include "hbvmpub.h"
#include "hbinit.h"


HB_FUNC( OPENWEBBROWSER );
HB_FUNC_EXTERN( OWND );
HB_FUNC_EXTERN( CPARAMSMAIN );
HB_FUNC_EXTERN( FULLCURDIR );
HB_FUNC_EXTERN( FILE );
HB_FUNC_EXTERN( EMPTY );
HB_FUNC_EXTERN( ISINTERNET );
HB_FUNC_EXTERN( TWINDOW );
HB_FUNC_EXTERN( GETSYSMETRICS );
HB_FUNC_EXTERN( TACTIVEX );
HB_FUNC( EVENTINFO );
HB_FUNC_EXTERN( SETPARENT );
HB_FUNC_EXTERN( CVALTOCHAR );
HB_FUNC_EXTERN( SUBSTR );
HB_FUNC_EXTERN( AT );
HB_FUNC_EXTERN( BCHAR2BLOCK );
HB_FUNC( CLOSEWEBBROWSER );
HB_FUNC_EXTERN( ERRORBLOCK );
HB_FUNC_EXTERN( APOLOBREAK );
HB_FUNC_EXTERN( FW_GT );
HB_FUNC_EXTERN( ERRORSYS );
HB_FUNC_INITSTATICS();


HB_INIT_SYMBOLS_BEGIN( hb_vm_SymbolInit_WEBBROW )
{ "OPENWEBBROWSER", {HB_FS_PUBLIC | HB_FS_FIRST | HB_FS_LOCAL}, {HB_FUNCNAME( OPENWEBBROWSER )}, NULL },
{ "OWND", {HB_FS_PUBLIC}, {HB_FUNCNAME( OWND )}, NULL },
{ "CPARAMSMAIN", {HB_FS_PUBLIC}, {HB_FUNCNAME( CPARAMSMAIN )}, NULL },
{ "FULLCURDIR", {HB_FS_PUBLIC}, {HB_FUNCNAME( FULLCURDIR )}, NULL },
{ "FILE", {HB_FS_PUBLIC}, {HB_FUNCNAME( FILE )}, NULL },
{ "EMPTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( EMPTY )}, NULL },
{ "ISINTERNET", {HB_FS_PUBLIC}, {HB_FUNCNAME( ISINTERNET )}, NULL },
{ "NEW", {HB_FS_PUBLIC | HB_FS_MESSAGE}, {NULL}, NULL },
{ "TWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( TWINDOW )}, NULL },
{ "GETSYSMETRICS", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETSYSMETRICS )}, NULL },
{ "TACTIVEX", {HB_FS_PUBLIC}, {HB_FUNCNAME( TACTIVEX )}, NULL },
{ "_BONEVENT", {HB_FS_PUBLIC | HB_FS_MESSAGE}, {NULL}, NULL },
{ "EVENTINFO", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( EVENTINFO )}, NULL },
{ "_OCLIENT", {HB_FS_PUBLIC | HB_FS_MESSAGE}, {NULL}, NULL },
{ "DO", {HB_FS_PUBLIC | HB_FS_MESSAGE}, {NULL}, NULL },
{ "SETPARENT", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETPARENT )}, NULL },
{ "HWND", {HB_FS_PUBLIC | HB_FS_MESSAGE}, {NULL}, NULL },
{ "OWNDCLIENT", {HB_FS_PUBLIC | HB_FS_MESSAGE}, {NULL}, NULL },
{ "ACTIVATE", {HB_FS_PUBLIC | HB_FS_MESSAGE}, {NULL}, NULL },
{ "SETFOCUS", {HB_FS_PUBLIC | HB_FS_MESSAGE}, {NULL}, NULL },
{ "CVALTOCHAR", {HB_FS_PUBLIC}, {HB_FUNCNAME( CVALTOCHAR )}, NULL },
{ "SUBSTR", {HB_FS_PUBLIC}, {HB_FUNCNAME( SUBSTR )}, NULL },
{ "AT", {HB_FS_PUBLIC}, {HB_FUNCNAME( AT )}, NULL },
{ "BCHAR2BLOCK", {HB_FS_PUBLIC}, {HB_FUNCNAME( BCHAR2BLOCK )}, NULL },
{ "CLOSEWEBBROWSER", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( CLOSEWEBBROWSER )}, NULL },
{ "ERRORBLOCK", {HB_FS_PUBLIC}, {HB_FUNCNAME( ERRORBLOCK )}, NULL },
{ "APOLOBREAK", {HB_FS_PUBLIC}, {HB_FUNCNAME( APOLOBREAK )}, NULL },
{ "_BVALID", {HB_FS_PUBLIC | HB_FS_MESSAGE}, {NULL}, NULL },
{ "END", {HB_FS_PUBLIC | HB_FS_MESSAGE}, {NULL}, NULL },
{ "_OWNDCLIENT", {HB_FS_PUBLIC | HB_FS_MESSAGE}, {NULL}, NULL },
{ "FW_GT", {HB_FS_PUBLIC}, {HB_FUNCNAME( FW_GT )}, NULL },
{ "ERRORSYS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ERRORSYS )}, NULL },
{ "(_INITSTATICS00002)", {HB_FS_INITEXIT | HB_FS_LOCAL}, {hb_INITSTATICS}, NULL }
HB_INIT_SYMBOLS_EX_END( hb_vm_SymbolInit_WEBBROW, ".\\Prg\\WebBrow.prg", 0x0, 0x0003 )

#if defined( HB_PRAGMA_STARTUP )
   #pragma startup hb_vm_SymbolInit_WEBBROW
#elif defined( HB_DATASEG_STARTUP )
   #define HB_DATASEG_BODY    HB_DATASEG_FUNC( hb_vm_SymbolInit_WEBBROW )
   #include "hbiniseg.h"
#endif

HB_FUNC( OPENWEBBROWSER )
{
	static const HB_BYTE pcode[] =
	{
		13,2,1,116,32,0,36,14,0,95,1,100,8,28,
		9,176,1,0,12,0,80,1,36,16,0,106,9,84,
		69,82,77,73,78,65,76,0,176,2,0,12,0,24,
		28,48,36,18,0,176,3,0,12,0,106,15,119,101,
		98,92,105,110,100,101,120,46,104,116,109,108,0,72,
		80,2,36,20,0,176,4,0,95,2,12,1,31,61,
		36,21,0,100,110,7,36,26,0,106,46,104,116,116,
		112,58,47,47,119,119,119,46,103,101,115,116,111,111,
		108,46,101,115,47,102,111,110,100,111,50,107,116,111,
		114,99,101,47,105,110,100,101,120,46,104,116,109,108,
		0,80,2,36,30,0,176,5,0,95,1,12,1,32,
		247,0,176,6,0,12,0,29,239,0,36,32,0,48,
		7,0,176,8,0,12,0,92,228,92,250,176,9,0,
		122,12,1,93,208,0,49,176,9,0,121,12,1,92,
		10,72,106,1,0,100,100,100,100,100,9,9,100,100,
		100,100,9,9,9,9,120,112,21,82,1,0,36,34,
		0,48,7,0,176,10,0,12,0,103,1,0,106,15,
		83,104,101,108,108,46,69,120,112,108,111,114,101,114,
		0,112,2,80,3,36,35,0,48,11,0,95,3,89,
		23,0,3,0,1,0,3,0,176,12,0,95,1,95,
		2,95,3,95,255,12,4,6,112,1,73,36,37,0,
		48,13,0,103,1,0,95,3,112,1,73,36,39,0,
		48,14,0,95,3,106,9,78,97,118,105,103,97,116,
		101,0,95,2,112,2,73,36,41,0,176,15,0,48,
		16,0,103,1,0,112,0,48,16,0,48,17,0,95,
		1,112,0,112,0,20,2,36,43,0,48,18,0,103,
		1,0,100,100,100,100,100,100,100,100,100,100,100,100,
		100,100,100,100,90,4,9,6,112,17,73,36,45,0,
		48,19,0,95,1,112,0,73,36,49,0,100,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( EVENTINFO )
{
	static const HB_BYTE pcode[] =
	{
		13,3,4,36,59,0,95,2,96,6,0,129,1,1,
		29,129,0,36,61,0,176,20,0,95,1,12,1,106,
		16,66,101,102,111,114,101,78,97,118,105,103,97,116,
		101,50,0,8,28,91,36,63,0,176,20,0,95,6,
		12,1,80,5,36,65,0,106,11,105,110,100,101,120,
		46,104,116,109,108,0,95,5,24,28,58,106,2,35,
		0,95,5,24,28,49,36,67,0,176,21,0,95,5,
		176,22,0,106,2,35,0,95,5,12,2,122,72,12,
		2,80,7,36,69,0,176,5,0,95,7,12,1,31,
		12,36,70,0,176,23,0,95,7,20,1,36,77,0,
		130,31,132,132,36,79,0,100,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( CLOSEWEBBROWSER )
{
	static const HB_BYTE pcode[] =
	{
		13,2,1,116,32,0,36,88,0,176,25,0,89,15,
		0,1,0,0,0,176,26,0,95,1,12,1,6,12,
		1,80,2,36,89,0,113,110,0,0,36,91,0,95,
		1,100,8,28,9,176,1,0,12,0,80,1,36,93,
		0,176,5,0,95,1,12,1,31,73,176,5,0,103,
		1,0,12,1,31,63,36,95,0,48,27,0,103,1,
		0,90,4,120,6,112,1,73,36,97,0,176,5,0,
		48,17,0,95,1,112,0,12,1,31,30,36,98,0,
		48,28,0,48,17,0,95,1,112,0,112,0,73,36,
		99,0,48,29,0,95,1,100,112,1,73,36,102,0,
		114,10,0,0,36,104,0,115,80,3,36,108,0,176,
		25,0,95,2,20,1,36,110,0,100,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITSTATICS()
{
	static const HB_BYTE pcode[] =
	{
		117,32,0,2,0,116,32,0,106,1,0,82,2,0,
		7
	};

	hb_vmExecute( pcode, symbols );
}

