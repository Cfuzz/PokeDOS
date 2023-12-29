TITLE POKEMON
  
  .Model Small
  DOSSEG    
  .Stack 100H
  
  .Data
  
; Estructuras:
TPPOKEMON STRUC
	CoordY db 0
	CoordX db 0
	NCoordY db 0
	NCoordX db 0
	Indice db 0
	Velocidad db 2
ENDS

; Registros
TPESTADO RECORD bola1:1=0,bola2:1=0, curTipo:1, curCamb:1=0, PkMov:1=0, mew:1=0,evol1:1=0, evol2:1=0

; Constantes de graficos
        pant Equ 0b800h

        espaciolibre  Equ ' '
        zonaSolida    Equ 'Ы'
        BolaEvolucion Equ 'X'
	gfxCursor     Equ ''
        textoBlanco   Equ 0fh
	textoAmarillo Equ 0eh

; Constantes de Coordenadas
        iniX1 Equ 1
        iniY1 Equ 6
        iniX2 Equ 77
        iniY2 Equ 22

; Notas Musicales
	notaSIL equ 3217
	notaDO equ 3217
	notaDOsus equ 3036
	notaRE equ 2865
	notaREsus equ 2705
	notaMI equ 2553
	notaFA equ 2409
	notaFAsus equ 2275
	notaSOL equ 2146
	notaSOLsus equ 2026
	notaLA equ 1912
	notaLAsus equ 1805
	notaSI equ 1704
	notaDOalto equ 1608
	notaDOsusalto equ 1518
	notaREalto equ 1432
	notaREsusalto equ 1352
	notaMIalto equ 1276
	notaFAalto equ 1204
	notaFAsusalto equ 1137
	notaSOLalto equ 1073
	notaSOLsusalto equ 1013
	notaLAalto equ 956
	notaLAsusalto equ 902
	notaSIalto equ 852
	notaDO2alto equ 804
	
; Variables de gr ficos
     Marcador db "                                                                                "
     db "                                      contra                                    " 
     db "                                                                                "
     db "EVOLUCION                          RELOJ: 00:00                        EVOLUCION"
     db "                                                                                "
     
     Laberintos db "ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ"
     db "Ы     Ы       Ы          Ы       Ы     ЫЫ     Ы       Ы          Ы       Ы     Ы"
     db "Ы     Ы       Ы          Ы       Ы     ЫЫ     Ы       Ы          Ы       Ы     Ы"
     db "Ы     Ы       Ы    ЫЫ    Ы       Ы            Ы       Ы    ЫЫ    Ы       Ы     Ы"
     db "Ы     Ы  ЫЫЫ  Ы    ЫЫ    Ы  ЫЫЫ  Ы            Ы  ЫЫЫ  Ы    ЫЫ    Ы  ЫЫЫ  Ы     Ы"
     db "Ы          Ы  Ы          Ы  Ы                      Ы  Ы          Ы  Ы          Ы"
     db "Ы          Ы  ЫЫЫ      ЫЫЫ  Ы                      Ы  ЫЫЫ      ЫЫЫ  Ы          Ы"
     db "Ы  ЫЫЫЫЫЫ  Ы                Ы  ЫЫЫЫЫЫ      ЫЫЫЫЫЫ  Ы                Ы  ЫЫЫЫЫЫ  Ы"
     db "Ы          Ы                Ы                      Ы                Ы          Ы"
     db "Ы          Ы    ЫЫЫЫЫЫЫЫ    Ы                      Ы    ЫЫЫЫЫЫЫЫ    Ы          Ы"
     db "Ы          Ы    ЫЫЫЫЫЫЫЫ    Ы                      Ы    ЫЫЫЫЫЫЫЫ    Ы          Ы"
     db "Ы          Ы                Ы                      Ы                Ы          Ы"
     db "Ы  ЫЫЫЫЫЫ  Ы                Ы  ЫЫЫЫЫЫ      ЫЫЫЫЫЫ  Ы                Ы  ЫЫЫЫЫЫ  Ы"
     db "Ы          Ы  ЫЫЫ      ЫЫЫ  Ы                      Ы  ЫЫЫ      ЫЫЫ  Ы          Ы"
     db "Ы          Ы  Ы          Ы  Ы                      Ы  Ы          Ы  Ы          Ы"
     db "Ы     Ы  ЫЫЫ  Ы    ЫЫ    Ы  ЫЫЫ  Ы            Ы  ЫЫЫ  Ы    ЫЫ    Ы  Ы    Ы     Ы"
     db "Ы     Ы       Ы    ЫЫ    Ы       Ы            Ы       Ы    ЫЫ    Ы  ЫЫЫ  Ы     Ы"
     db "Ы     Ы       Ы          Ы       Ы     ЫЫ     Ы       Ы          Ы       Ы     Ы"
     db "Ы     Ы       Ы          Ы       Ы     ЫЫ     Ы       Ы          Ы       Ы     Ы"
     db "ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ"
     
     db "ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ"
     db "Ы                                                                              Ы"
     db "Ы                                                                              Ы"
     db "Ы  ЫЫЫЫЫЫЫЫЫЫЫ  ЫЫЫЫЫЫЫЫЫЫ  ЫЫЫЫЫЫЫЫЫЫ    ЫЫЫЫЫЫЫЫЫЫ  ЫЫЫЫЫЫЫЫЫЫ  ЫЫЫЫЫЫЫЫЫЫЫ  Ы"
     db "Ы  Ы                                                                        Ы  Ы"
     db "Ы  Ы                                                                        Ы  Ы"
     db "Ы  Ы  ЫЫЫЫЫЫЫЫ  ЫЫЫЫЫЫЫЫЫЫ  ЫЫЫЫЫЫЫЫЫЫ    ЫЫЫЫЫЫЫЫЫЫ  ЫЫЫЫЫЫЫЫЫЫ  ЫЫЫЫЫЫЫЫ  Ы  Ы"
     db "Ы  Ы  Ы                                                                  Ы  Ы  Ы"
     db "Ы  Ы  Ы                                                                  Ы  Ы  Ы"
     db "Ы        ЫЫЫЫЫ  ЫЫЫЫЫЫЫЫЫЫ  ЫЫЫЫЫЫЫЫЫЫ    ЫЫЫЫЫЫЫЫЫЫ  ЫЫЫЫЫЫЫЫЫЫ  ЫЫЫЫЫ        Ы"
     db "Ы        ЫЫЫЫЫ  ЫЫЫЫЫЫЫЫЫЫ  ЫЫЫЫЫЫЫЫЫЫ    ЫЫЫЫЫЫЫЫЫЫ  ЫЫЫЫЫЫЫЫЫЫ  ЫЫЫЫЫ        Ы"
     db "Ы  Ы  Ы                                                                  Ы  Ы  Ы"
     db "Ы  Ы  Ы                                                                  Ы  Ы  Ы"
     db "Ы  Ы  ЫЫЫЫЫЫЫЫ  ЫЫЫЫЫЫЫЫЫЫ  ЫЫЫЫЫЫЫЫЫЫ    ЫЫЫЫЫЫЫЫЫЫ  ЫЫЫЫЫЫЫЫЫЫ  ЫЫЫЫЫЫЫЫ  Ы  Ы"
     db "Ы  Ы                                                                        Ы  Ы"
     db "Ы  Ы                                                                        Ы  Ы"
     db "Ы  ЫЫЫЫЫЫЫЫЫЫЫ  ЫЫЫЫЫЫЫЫЫЫ  ЫЫЫЫЫЫЫЫЫЫ    ЫЫЫЫЫЫЫЫЫЫ  ЫЫЫЫЫЫЫЫЫЫ  ЫЫЫЫЫЫЫЫЫЫЫ  Ы"
     db "Ы                                                                              Ы"
     db "Ы                                                                              Ы"
     db "ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ"

     db "ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ"
     db "Ы                                                                              Ы"
     db "Ы                                                                              Ы"
     db "Ы  ЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  Ы"
     db "Ы                                                                              Ы"
     db "Ы                                                                              Ы"
     db "Ы  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫ  Ы"
     db "Ы                                                                              Ы"
     db "Ы                                                                              Ы"
     db "Ы    ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ    Ы"
     db "Ы                                                                              Ы"
     db "Ы                                                                              Ы"
     db "Ы  ЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  Ы"
     db "Ы                                                                              Ы"
     db "Ы                                                                              Ы"
     db "Ы  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫ  Ы"
     db "Ы                                                                              Ы"
     db "Ы                                                                              Ы"
     db "Ы    ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ  ЫЫЫЫ    Ы"
     db "ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ"

     db "ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ"
     db "Ы                                                                              Ы"
     db "Ы                                                                              Ы"
     db "Ы    ЫЫЫЫЫЫ  ЫЫЫЫЫЫ  ЫЫЫЫЫЫ  ЫЫЫЫЫЫ  ЫЫЫЫЫЫ  ЫЫЫЫЫЫ  ЫЫЫЫЫЫ  ЫЫЫЫЫЫ  ЫЫЫЫЫЫ    Ы"
     db "Ы                                                                              Ы"
     db "Ы                                                                              Ы"
     db "Ы    ЫЫЫЫ    ЫЫЫ  ЫЫЫ  ЫЫ      ЫЫ  ЫЫЫЫЫЫ  ЫЫ      ЫЫ  ЫЫЫ  ЫЫЫ  ЫЫЫ       ЫЫ  Ы"
     db "Ы  ЫЫ    ЫЫ  ЫЫ    ЫЫ  ЫЫ    ЫЫ    ЫЫ      ЫЫЫЫ  ЫЫЫЫ  ЫЫ    ЫЫ  ЫЫЫЫ      ЫЫ  Ы"
     db "Ы  ЫЫ    ЫЫ  ЫЫ    ЫЫ  ЫЫ  ЫЫ      ЫЫ      ЫЫ  ЫЫ  ЫЫ  ЫЫ    ЫЫ  ЫЫ  Ы     ЫЫ  Ы"
     db "Ы  ЫЫ    ЫЫ  ЫЫ    ЫЫ  ЫЫЫЫ        ЫЫЫЫЫЫ  ЫЫ      ЫЫ  ЫЫ    ЫЫ  ЫЫ   Ы    ЫЫ  Ы"
     db "Ы  ЫЫ  ЫЫ    ЫЫ    ЫЫ  ЫЫЫЫ        ЫЫЫЫЫЫ  ЫЫ      ЫЫ  ЫЫ    ЫЫ  ЫЫ    Ы   ЫЫ  Ы"
     db "Ы  ЫЫ        ЫЫ    ЫЫ  ЫЫ  ЫЫ      ЫЫ      ЫЫ      ЫЫ  ЫЫ    ЫЫ  ЫЫ     Ы  ЫЫ  Ы"
     db "Ы  ЫЫ        ЫЫ    ЫЫ  ЫЫ    ЫЫ    ЫЫ      ЫЫ      ЫЫ  ЫЫ    ЫЫ  ЫЫ      ЫЫЫЫ  Ы"
     db "Ы  ЫЫ        ЫЫЫ  ЫЫЫ  ЫЫ      ЫЫ  ЫЫЫЫЫЫ  ЫЫ      ЫЫ  ЫЫЫ  ЫЫЫ  ЫЫ       ЫЫЫ  Ы"
     db "Ы                                                                              Ы"
     db "Ы                                                                              Ы"
     db "Ы    ЫЫЫЫЫЫ  ЫЫЫЫЫЫ  ЫЫЫЫЫЫ  ЫЫЫЫЫЫ  ЫЫЫЫЫЫ  ЫЫЫЫЫЫ  ЫЫЫЫЫЫ  ЫЫЫЫЫЫ  ЫЫЫЫЫЫ    Ы"
     db "Ы                                                                              Ы"
     db "Ы                                                                              Ы"
     db "ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ"

     Titulo db "                                                                                "
     db "    ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ     "
     db "                 ___                    /^>                                     "
     db "           __--~~ _ ~\     ,-'~]/^\    (.'--, Ъ--ї Ъ---ї    ___                 "
     db "         \~     -~.)  J.ъ-ъ\.  п   `>'п />,'. [   ^   .Lъ-ъ.1  щї4щщщ7          "
     db "          `-.      ,ъ(п (__, )  . ~-(  пп %п `>      (  (__ъ)   '   /           "
     db "             `\    \ `-.__,-п|  |`\  `ъ.__,-'[___/`п\ `-В.-Вп ,1   /            "
     db "               `\_--`        ~~~~  `\/п              ~~~   ~~~ L__/             "
     db "           ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ TM         "
     
     TituloColorFondo db "@ABCDEFGHIJKLMNO@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@ANNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNA@@@@@@"
     db "@@@@@@ANNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNA@@@@@@@"
     db "@@@@@@@ANNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNA@@@@@@@@"
     db "@@@@@@@@ANNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNA@@@@@@@@@"
     db "@@@@@@@@@ANNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNA@@@@@@@@@@"
     db "@@@@@@@@@@ANNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNA@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     
       TituloColorFrente db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA@@@@@"
     db "@@@@@@@@@@@@@AAAAAAAAAA@@@@@@@@@@@@@@@@AAAAA@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@AAAAAAAAAAAAAAA@@AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA@@AAAAAAAAAAAA@@@@@@@@@"
     db "@@@@@@@@AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA@@@@@@@@@"
     db "@@@@@@@@@AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA@@@@@@@@@@"
     db "@@@@@@@@@@@@AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@AAAAAAAA@@@@@@AAAAAAAAAAAA@@@@@@@@@@@@AAAAA@AAAAAAAAAOOOO@@@@@@@@@"
     db "@@@@@@@@@@@AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOOO@@@@@@@@@"
     
     MenuPrincipal db "                                                                                "
     db "                        _.:<:[ Gotta catch 'em all!! ]:>:._                     "
     db "                                                               .-'-._,п`;       "
     db "    <Vv.   _---_   ,vV7                                      /п. ,-'    :       "
     db "     `'.`7~     ~Tп,'п  _                                  _( ( (        |.     "
     db "        f ) . ) 1 _-'~|         MENU PRINCIPAL         ,Щ ~'ъъ'^1      ; )    "
     db "        |() ъъ ()|~   _|         ~~~~~~~~~~~~~~         ;. . 0  ,.`\-._/  ;    "
     db "        ,'       ':  ;~                                 ,L·  ъ   4_| `п_`\J     "
     db "        f  \   /  1`> >          Modo 2 Jugadores       `\-_ъ ъ__,ъ,A`Y a )     "
     db "        | \_} {_/ | Vп             Modo Captura          ( \~~~'~,п   )   J     "
     db "       :^'.     ,'^;                 Creditos            |  7‡-,_ж  ,<  <п      "
     db "        \_Б-'~'-Б_/                  Opciones            ~'~ ~~  ~'~  ~'~       "
     db "                                      Ayuda                                     "
     db "                                                                                "
     db "                                                                                "
     db "                                                                                "

     MenuPrincipalColorFondo db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"     
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     
     MenuPrincipalColorFrente db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
     db "NNNNNNNNNNNNNNNNNNNNNNNNN@@@@OOOOOOOOOOOOOOOOOOOOOOO@@JJJJJJJJJJJJJJJJJJJJJJJJJJ"
     db "NNNNNNNNNNNNNNNNNNNNNNNNN@@@@OOOOOOOOOOOOOOOOOOOOOOO@@JJJJJJJJJJJJJJJJJJJJJJJJJJ"
     db "NNNNNNNNNNNNNNNNNNNNNNNNN@@@@OOOOOOOOOOOOOOOOOOOOOOO@@JJJJJJJJJJJJJJJJJJJJJJJJJJ"
     db "NNNNNNNNNNNNNNNNNNNNNNNNN@@@@OOOOOOOOOOOOOOOOOOOOOOO@@JJJJJJJJJJJJJJJJJJJJJJJJJJ"
     db "NNNNNNNNNNNNNNNNNNNNNNNNN@@@@OOOOOOOOOOOOOOOOOOOOOOO@@JJJJJJJJJJJJJJJJJJJJJJJJJJ"
     db "NNNNNNNNNNNNNNNNNNNNNNNNN@@@@OOOOOOOOOOOOOOOOOOOOOOO@@JJJJJJJJJJJJJJJJJJJJJJJJJJ"
     db "NNNNNNNNNNNNNNNNNNNNNNNNN@@@@OOOOOOOOOOOOOOOOOOOOOOO@@JJJJJJJJJJJJJJJJJJJJJJJJJJ"
     db "NNNNNNNNNNNNNNNNNNNNNNNNN@@@@OOOOOOOOOOOOOOOOOOOOOOO@@JJJJJJJJJJJJJJJJJJJJJJJJJJ"
     db "NNNNNNNNNNNNNNNNNNNNNNNNN@@@@OOOOOOOOOOOOOOOOOOOOOOO@@JJJJJJJJJJJJJJJJJJJJJJJJJJ"
     db "NNNNNNNNNNNNNNNNNNNNNNNNN@@@@OOOOOOOOOOOOOOOOOOOOOOO@@JJJJJJJJJJJJJJJJJJJJJJJJJJ"
     db "NNNNNNNNNNNNNNNNNNNNNNNNN@@@@OOOOOOOOOOOOOOOOOOOOOOO@@JJJJJJJJJJJJJJJJJJJJJJJJJJ"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
    
	menuAyuda db "                                                                                "
     db "                        _.:<:[ Gotta catch 'em all!! ]:>:._                     "
     db "                                                                                "
     db "  El objetivo del juego consiste en comerte a tu enemigo. Para ello, debes co-  "
     db "  rrer por el laberinto, sorteando los obstaculos, para atrapar una Poke-ball   "
     db "  y comertela. Al hacerlo, evolucionaras y tendras unos preciosos segundos pa-  "
     db "  ra atrapar al otro, pasados los cuales desevolucionaras y tendras que volver  "
     db "  a atrapar una Poke-ball. El juego termina cuando uno de los dos jugadores     "
     db "  pilla al otro, estando evolucionado, o cuando pasa un tiempo determinado,     "
     db "  asi que date prisa!! Atrapalos a todos!! Y descubre sus secretos!!            "
     db "                                                                                "
     db "  Controles comunes: ESC vuelve del juego al menu principal, o desde el menu,   "
     db "                     vuelve a la pantalla anterior. ENTER selecciona una op-    "
     db "                     cion. Las flechas izq y der mueven la ruleta de seleccion. "
     db "                                                                                "
     db "                              << ESC para volver >>                             "

       menuAyudaColorFondo db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"     
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

       menuAyudaColorFrente db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "IIIIIIIIIIOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOIIIIIIIIII"
     db "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII"
     db "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII"
     db "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII"
     db "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII"
     db "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII"
     db "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII"
     db "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII"
     db "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII"
     db "JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ"     
     db "JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ"     
     db "JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ"     
     db "JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ"     
     db "JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ"
     db "JJJJJJJJJJJJJJJJJOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOJJJJJJJJJJJJ"

MenuEligeV2 db "                                                                                "
     db "                          _.:<JUGADOR ? ELIGE POKEMON>:._                       "
     db "   ЙНННННННННННННННННННННН»                          ЙНННННННННННННННННННННН»   "
     db "   є<Vv.   _---_   ,vV7   є ЙНННННННННННННННННННННН» є        .-'-._,п`;    є   "
     db "   є `'.`7~     ~Tп,'п  _ є є                      є є      /п. ,-'    :    є   " 
     db "   є    f ) . ) 1 _-'~| є є                      є є    _( ( (        |.  є   "
     db "   є    |() ъъ ()|~   _| є є                      є є  ,Щ ~'ъъ'^1      ; ) є   "
     db "  є    ,'       ':  ;~   є є                      є є  ;. . 0  ,.`\-._/  ; є  "
     db "   є    f  \   /  1`> >   є є                      є є ,L·  ъ   4_| `п_`\J  є   "
     db "   є    | \_} {_/ | Vп    є є                      є є `\-_ъ ъ__,ъ,A`Y a )  є   "
     db "   є   :^'.     ,'^;      є є                      є є  ( \~~~'~,п   )   J  є   "
     db "   є    \_Б-'~'-Б_/       є є                      є є  |чч7‡т,_жчч,<ччZп   є   "
     db "   ИННННННННННННННННННННННј є                      є ИННННННННННННННННННННННј   "
     db "                            ИННННННННННННННННННННННј                            "
     db "                         <                          >                         "
     db "                                                                                "

     MenuEligeV2ColorFondo db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@OOOOOOOOOOOOOOOOOOOOOO@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@OOOOOOOOOOOOOOOOOOOOOO@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@OOOOOOOOOOOOOOOOOOOOOO@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@OOOOOOOOOOOOOOOOOOOOOO@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@OOOOOOOOOOOOOOOOOOOOOO@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@OOOOOOOOOOOOOOOOOOOOOO@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@OOOOOOOOOOOOOOOOOOOOOO@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@OOOOOOOOOOOOOOOOOOOOOO@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@OOOOOOOOOOOOOOOOOOOOOO@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     
     MenuEligeV2ColorFrente db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
     db "OOOOGGGGGGGGGGGGGGGGGGGGGGOOOOOOOOOOOOOOOOOOOOOOOOOOOOGGGGGGGGGGGGGGGGGGGGGGOOOO"
     db "OOOOGGGGGGGGGGGGGGGGGGGGGGOOOOOOOOOOOOOOOOOOOOOOOOOOOOGGGGGGGGGGGGGGGGGGGGGGOOOO"
     db "OOOOGGGGGGGGGGGGGGGGGGGGGGOOOOOOOOOOOOOOOOOOOOOOOOOOOOGGGGGGGGGGGGGGGGGGGGGGOOOO"
     db "OOOOGGGGGGGGGGGGGGGGGGGGGGOOOOOOOOOOOOOOOOOOOOOOOOOOOOGGGGGGGGGGGGGGGGGGGGGGOOOO"
     db "OOOOGGGGGGGGGGGGGGGGGGGGGGOOOOOOOOOOOOOOOOOOOOOOOOOOOOGGGGGGGGGGGGGGGGGGGGGGOOOO"
     db "OOOOGGGGGGGGGGGGGGGGGGGGGGOOOOOOOOOOOOOOOOOOOOOOOOOOOOGGGGGGGGGGGGGGGGGGGGGGOOOO"
     db "OOOOGGGGGGGGGGGGGGGGGGGGGGOOOOOOOOOOOOOOOOOOOOOOOOOOOOGGGGGGGGGGGGGGGGGGGGGGOOOO"
     db "OOOOGGGGGGGGGGGGGGGGGGGGGGOOOOOOOOOOOOOOOOOOOOOOOOOOOOGGGGGGGGGGGGGGGGGGGGGGOOOO"
     db "OOOOGGGGGGGGGGGGGGGGGGGGGGOOOOOOOOOOOOOOOOOOOOOOOOOOOOGGGGGGGGGGGGGGGGGGGGGGOOOO"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"

MenuVictoria db "                                                                                "
	  db "             ЙНННННННННННННННННННННН»      ЙНННННННННННННННННННННН»             "
	  db "             єGGGGGGGGGGGGGGGGGGGGGGє      єPPPPPPPPPPPPPPPPPPPPPPє             "
	  db "             єGGGGGGGGGGGGGGGGGGGGGGє ===> єPPPPPPPPPPPPPPPPPPPPPPє             "
	  db "             єGGGGGGGGGGGGGGGGGGGGGGє      єPPPPPPPPPPPPPPPPPPPPPPє             "
	  db "             єGGGGGGGGGGGGGGGGGGGGGGє      єPPPPPPPPPPPPPPPPPPPPPPє             "
	  db "             єGGGGGGGGGGGGGGGGGGGGGGє ===> єPPPPPPPPPPPPPPPPPPPPPPє             "
	  db "             єGGGGGGGGGGGGGGGGGGGGGGє      єPPPPPPPPPPPPPPPPPPPPPPє             "
	  db "             єGGGGGGGGGGGGGGGGGGGGGGє      єPPPPPPPPPPPPPPPPPPPPPPє             "
	  db "             єGGGGGGGGGGGGGGGGGGGGGGє ===> єPPPPPPPPPPPPPPPPPPPPPPє             "
	  db "             єGGGGGGGGGGGGGGGGGGGGGGє      єPPPPPPPPPPPPPPPPPPPPPPє             "
          db "             ИННННННННННННННННННННННј      ИННННННННННННННННННННННј             "
	  db "                                                                                "
	  db "                  << AAAAAAAAAAA   debilita a   BBBBBBBBBBB >>                  "
	  db "                                                                                "
	  db "                       <[-  EL JUGADOR ? HA GANADO!!  -]>        < Pulsa ESC >  "
	  
     MenuVictoriaColorFondo db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

     MenuVictoriaColorFrente db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
     db "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
     db "NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN"
     db "NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNOOOOOOOOOOOOOOOOOO"
capturLin db "                      <[-  HAS ATRAPADO EL POKEMON!!  -]>        < Pulsa ESC >  "    

	mnuLaberintos db "    Selecciona Laberinto    "
		      db " ЙННЛНЛЛНЛНН»  ЙНННННННННН» "
		      db " є » Й  » Й є  є ЙНННННН» є "
		      db " є ј И  ј И є  є ИННННННј є "		      
		      db " ИННКНККНКННј  ИННННННННННј "
		      db "  1.Original   2. Acordeon  "
		      db " ЙНННННННННН»  ЙНННННННННН» "
		      db " є Н Н Н Н Нє  є POKEMON  є "
		      db " єН Н Н Н Н є  є Н Н Н Н  є "		      
		      db " ИННННННННННј  ИННННННННННј "
		      db "  3. Morse     4. Pokemon!  "
	
	mnuOpciones   db "                            "
		      db "          OPCIONES          "		   
		      db "          ________          "
		      db "                            "
		      db "  Tiempo de partida: 1 min  "
		      db "  Tiempo evolucion:  5 seg  "
		      db "     Configurar Teclas      "
		      db "          Volver            "
		      db "                            "
		      db "                            "
		      db "                            "
		     
	mnuTeclas     db "  Jugador 1 Arriba   :  ?   "
		      db "  Jugador 1 Abajo    :      "
		      db "  Jugador 1 Izquierda:      "
		      db "  Jugador 1 Derecha  :      "
		      db "                            "
		      db "  Jugador 2 Arriba   :      "
		      db "  Jugador 2 Abajo    :      "
		      db "  Jugador 2 Izquierda:      "
		      db "  Jugador 2 Derecha  :      "
		      db "                            "		      
		      db "         Volver             "

	mnuCreditos   db "                            "
		      db "          Autores:          "
		      db "                            "
		      db " Eduard Porta MartЎn-Moreno "
		      db "    Joaquin P‚rez Marco     "
		      db "                            "
		      db "     (ESC para volver)      "
		      db "                            "
		      db "                            "
		      db "2006.Sin Derechos Reservados"
      		      db " (Copyright?? No, gracias.) "

     Pokedex 	db "<Vv.   _---_   ,vV7   "
     		db " `'.`7~     ~Tп,'п  _ " 
     		db "    f ) . ) 1 _-'~| "
     		db "    |() ъъ ()|~   _| "
     		db "    ,'       ':  ;~   "
     		db "    f  \   /  1`> >   "
     		db "    | \_} {_/ | Vп    "
     		db "   :^'.     ,'^;      "
     		db "    \_Б-'~'-Б_/       "
     	
		db "        .-'-._,п`;    "
    	 	db "      /п. ,-'    :    " 
     		db "    _( ( (        |.  "
	     	db "  ,Щ ~'ъъ'^1      ; ) "
     		db "  ;. . 0  ,.`\-._/  ; "
     		db " ,L·  ъ   4_| `п_`\J  "
     		db " `\-_ъ ъ__,ъ,A`Y a )  "
     		db "  ( \~~~'~,п   )   J  "
     		db "  |чч7‡т,_жчч,<ччZп   "
 	
		db "     ,'щщ'\           "
    	 	db "   ,ќ   ’Р !          " 
     		db "   fъ.  `п |      w   "
	     	db "  ч`=___-' (._ч  WWw  "
     		db " ',щ/   '.  ._,' WwW  "
     		db "   T      ! T    ч);  "
     		db "   (      ; Г--'щ,/   "
     		db " (п \    / п`)-'щ     "
     		db " ‡чч'щ--щ'‡ччJ        "

		db "   ,ъ'щщщ',           "
    	 	db "  |Р   ’щ) \          " 
     		db "  Гп. .`~п !.         "
	     	db " ,_-=--=пч,ч))        "
     		db "'ч `/щщщ\(  ))Р       "
     		db "  щT ---- \_/, )_--_  "
     		db "   (>-Е--<  ((/   т \ "
     		db "   ,\, \  `/ ((  (__/ "
     		db "  Ђчч('--- ‡чч/пщщщ   "

		db "                      "
    	 	db "                      " 
     		db "                      "
	     	db "                      "
     		db "          ?           "
     		db "                      "
     		db "                      "
     		db "                      "
     		db "                      "
		
		db "  $ ГДґ Й» є) () ИКј  "  
		db "                      "
		db " ЫЫЫ                  "
		db " Ы  Ы ЙНWWWWWWWН»  ЫЫ "
		db " Ы  Ы є/W ^ ^ W\є  Ы Ы"
		db "ЫЫ ЫЫ {.|  >  |.} ЫЫ  "
		db "ЫЫ ЫЫ  \. 'Н  ,/  ЫЫ  "
		db "         )\_/(        "
		db "     /~~~`щщщп~~~\    "

		db "ЙтЙН щН»Н»   ....     "
    	 	db "И М   ЙјЙј .п    `\   "
     		db "      ИНИН _/п~~~~`)  "
	     	db "   /''\    | '  ' |   "
     		db "  |. |   (   )  )   "
     		db "  .\_/,`\   \ \. /    "
     		db " ъ|    \ |   )  (     "
     		db "ъ`п\   ;п`'~~ ''п~~`\ "
     		db " `-пННп`-п           ."
		
		db "                      "
    	 	db "                      " 
     		db "                      "
	     	db "                      "
     		db "          ?           "
     		db "                      "
     		db "                      "
     		db "                      "
     		db "                      "
		
		db "                      "
    	 	db "                      " 
     		db "                      "
	     	db "                      "
     		db "          ?           "
     		db "                      "
     		db "                      "
     		db "                      "
     		db "                      "
		
		db "                      "
    	 	db "                      " 
     		db "                      "
	     	db "                      "
     		db "          ?           "
     		db "                      "
     		db "                      "
     		db "                      "
     		db "                      "

     pokemonDiseno db "=o^@/D~OщASWCFWvK+Y*"
     pokemonColor db 0e0h,0a1h,4eh,1eh,0b9h, 4fh, 9eh, 4eh, 0e0h, 1fh
     nombrePokemon  db "PIKACHU    "
                    db "BULBASAUR  "
                    db "CHARMANDER "
                    db "SQUIRTLE   "
                    db "MEW        "
		    db "SHADOW     "
		    db "C-Fщ22     "
		    db "MOLTRES    "
		    db "ZAPDOS     "
		    db "ARTICUNO   "
		    
     nombreEvolucion db "RAICHU     "
     		     db "VENUSAUR   "
		     db "CHARIZARD  "
		     db "BLASTOISE  "
		     db "MEW      "
		     db "TRUE SHADOW"
		     db "TUX        "
		     db "MOLTRES  "
		     db "ZAPDOS   "
		     db "ARTICUNO "
		     
; Graficos de teclas
     	gfxTeclas  db " 1234567890'­"
		   db "qwertyuiop`+ё"
		   db "asdfghjkl¤п§‡"
                   db "zxcvbnm,.-*Ы"
		   db "12345678907 "
		   db "9- 5 +1 30.  <ыэ"
	
; Variables del reloj
        int_reloj dd ?
	nueva_int_rel dw 0
        modificado_rel db 0
        interrupciones db 0
	minutos db 0
	segundos db 0
	
        contadorEvolucion1 db 0
        contadorEvolucion2 db 0
        contadorBola1 db 0
        contadorSonar db 0
	contadorMov db 0 
        nota dw 0

; Variables del teclado
        int_tec dd ?
        nueva_int_tec  dw 0
        modificado_tec db 0
	teclaPulsada db 0

;Variables de control
        EstadoElementos TPESTADO < >
	
        estadoBolas db 0
        estado1 db 0ffh    
	estado2 db 0ffh

        indiceNombre db 0
	indiceLaberinto db 0

        salir db 0
        entrar db 0
	menuActual db 0
	cursor db 0

	autoMov db 2 dup (0)
        mover db 0
	incrementador db 0
	zonaBloqueo db zonaSolida
	contadorRoto db 2 dup (0)

; Variable de Opciones
	Opciones db 1
		 db 5
		 
; Variables de Pokemon
	Pokemon1 TPPOKEMON < >
	Pokemon2 TPPOKEMON < >
	
; Variables de posicion
        OfsetBola1 dw 2000
        posnombre dw 0
	
; Variables de la IA
	IAbuffer db 1600 dup (0)
	IAbuffer2 dw 1600 dup (0)
	TRpos dw 0
	trazada db 0
	puntoRuta dw 0
	longruta dw 0
	IAon db 0
	pasos dw 0
	IAcarga db 'Procesando...'

; Variables de teclas
	teclas db 11h
               db 1fh
               db 1eh
               db 20h

               db 17h
               db 25h
               db 24h
               db 26h
	  
; Variables del motor de sonido

	buffersonidos dw 100 dup (0)
	bufferduraciones dw 100 dup (0)
	notaActual db 0
	sonando db 0
	offsetmelodia dw ?
	offsetDuracion dw ?
	
	melodiaPrincipalSon	 dw notaSol
				 dw notaSi
				 dw notaReAlto
				 dw notaSil
				 dw notaFaAlto
				 dw notaMiAlto
				 dw notaResusAlto
				 dw notaReAlto
				 dw notaSil
				 dw notaFa
				 dw notaMi
				 dw notaResus
				 dw notaRe
				 dw notaSil
				 dw notaDoalto
				 dw notaSi
				 dw notaDoalto
				 dw notaSol
				 dw notaSi
				 dw notaReAlto
				 dw notaSil
				 dw notaFaAlto
				 dw notaSolAlto
				 dw notaLaAlto
				 dw notaSolSusAlto
				 dw notaSolAlto
				 dw 0
	
	melodiaPrincipalDur	dw 12
				dw 4
				dw 24
				dw 8
				dw 12
				dw 2
				dw 2
				dw 14
				dw 2
				dw 12
				dw 2
				dw 2
				dw 14
				dw 2
				dw 6
				dw 6
				dw 4
				dw 12
				dw 4
				dw 24
				dw 8
				dw 16			
				dw 12
				dw 2
				dw 2
				dw 16
				dw 0

melodiaVictoriaSon	dw notaSil
			dw notaReAlto
			dw notaSil
			dw notaReAlto
			dw notaSil
			dw notaReAlto
			dw notaSil
			dw notaReAlto
			dw notaSil
			dw notaReAlto
			dw notaSil
			dw notaDoAlto
			dw notaLaSus
			dw notaFa
			dw notaSil
			dw notaReAlto
			dw notaSil
			dw notaReAlto
			dw notaDoAlto
			dw notaLaSus
			dw notaDoAlto
			dw notaSil
			dw notaLaSus
			dw notaReSusAlto
			dw notaSil
			dw notaReSusAlto
			dw notaSil
			dw notaReSusAlto
			dw notaFaAlto
			dw notaReAlto
			dw notaDoAlto
			dw notaLaSus
			dw notaSil
			dw notaLaSus
			dw notaReAlto
			dw notaSil
			dw notaReAlto
			dw notaDoAlto
			dw notaLaSus
			dw notaReAlto
			dw notaSil
			dw notaReAlto
			dw notaFaAlto
			dw notaSolAlto
			dw 0
			
melodiaVictoriaDur	dw 8
			dw 3
			dw 1
			dw 3
			dw 1
			dw 3
			dw 1
			dw 3
			dw 1
			dw 10
			dw 2
			dw 8
			dw 4
			dw 16
			dw 4
			dw 3
			dw 1
			dw 12
			dw 8
			dw 4
			dw 16
			dw 8
			dw 4
			dw 3
			dw 1
			dw 3
			dw 1
			dw 8
			dw 4
			dw 8
			dw 8
			dw 8
			dw 8
			dw 4
			dw 3
			dw 1
			dw 8
			dw 8
			dw 4
			dw 11
			dw 9
			dw 4
			dw 4
			dw 12
			dw 0

; Variables del generador de numeros aleatorios
	cuentaBucle dw 0
        Aleatorio dw 0
        maxAleatorio dw 1432

; Variables del dibujado de pantalla
        punteroMenu dw 0
	punterominiMenu dw 0
	punteroNombre dw 0

; Variables del dibujado de pokedex	
	colorPokedex db 0
	indicePokedex db 0
	PosPokedex dw 0
	maxPokedex db 4
	PokedexActual db 0,2,1,3,20,20,20,20,20
	indiceSeleccion db 0
	Ampliacion db 0
	
; Variables de gestion de ficheros	
	nombreFichero db "partida.pkm",00h
	handle dw 0
	DatosAescribir db 10 dup (?)

  .Code
;***************************************************************************
;*                                 Macros	                           *
;***************************************************************************

; <=> Asigna a una variable de tipo byte un dato en caso de que cmp1=cmp2 
   	SI_ASIGNA MACRO cmp1, cmp2, variable, dato 
	  	    LOCAL salto
		PUSH AX
	 	XOR AX, AX
		MOV AL, cmp1
                CMP AL, cmp2
                JNE salto
                MOV variable, dato
	 salto: POP AX
      	ENDM
	
; <=> Asigna a var un valor asignar en caso de que tecla=TeclaPulsada
	PULSA MACRO tecla, var, asignar
		SI_ASIGNA teclaPulsada, tecla, var, asignar
	ENDM	

; <=> Salto largo si es Igual: Realiza un salto largo si CF=0.
	JFE MACRO Destino
	    LOCAL noSaltar
       		JNZ noSaltar
		JMP Destino
	 noSaltar: NOP
	 ENDM

; <=> Establece CF=0 si el bit numeroBit del vector EstadoElementos = 1
	 CMPE MACRO numeroBit
		PUSH AX CX
		MOV AL, byte ptr EstadoElementos
		MOV AH, 1
		MOV CL, numerobit
		SHL AH, CL
		AND AL, AH
		CMP AL, AH
		POP CX AX
	ENDM

; <=> Establece el bit numeroBit de EstadoElementos a valor (debe ser 1 o 0)
	STE MACRO numeroBit, valor
		PUSH AX CX
		MOV AL, 1
		MOV CL, numeroBit
		SHL AL, CL
		NOT AL
		AND byte ptr EstadoElementos, AL
		MOV AL, valor
		SHL AL, CL
		OR byte ptr EstadoElementos, AL
		POP CX AX
	ENDM
	
; <=> Salta a Destino PK si pokemon 1 activo ( bit 3 de estado= 0)	
	 JPK1 MACRO DestinoPK
	      LOCAL MPoke2
	      	CMPE 3
	      	JE MPoke2
	      	JMP DestinoPK
	 MPoke2:NOP
	 ENDM

; <=> Intercambia el valor de dos variables tipo byte
	 XCHGBV MACRO xchgvar1, xchgvar2
	 	PUSH AX
		MOV Al, xchgvar1
		XCHG Al, xchgvar2
		MOV xchgvar1, Al
		POP AX
	ENDM
	
; <=> Mueve un valor de una variable tipo byte a otra
	MOVBV MACRO movvar1, movvar2
		PUSH AX
		MOV AL, movvar2
		MOV movvar1, AL
		POP AX
	ENDM

; <=> Suma un byte a un Word sin extension de signo
	ABW MACRO abwop1, abwop2
		PUSH AX
		MOV Al, abwop2
		XOR AH, AH
		ADD abwop1, AX
		POP AX
	ENDM

; <=> mueve un byte a un word sin extension de signo
	MBW MACRO mbwop1, mbwop2
		PUSH AX
		MOV Al, mbwop2
		XOR AH, AH
		MOV mbwop1, AX
		POP AX
	ENDM		
	
; <=> Detiene la ejecucion y bloquea el sistema (usado para depuracion)
	 BLOQ MACRO
	      LOCAL bloqueador
	 bloqueador: nop
		     jmp bloqueador
	 ENDM
	 
;***************************************************************************
;*                       Gestion de Interrupciones                         *
;***************************************************************************

mi_reloj PROC FAR
;===========================================================================
;= INTERRUPCION DE RELOJ DURANTE EL JUEGO                                  =
;===========================================================================
;= Esta rutina se produce 18'2 veces por segundo y gestiona:               =
;=   .1 - El reloj, que incrementa un segundo cada 18 interrupciones       =
;=        excepto para segundos multiplos de 5, que duran 19, ajustando asi=
;=        el error de reloj ( 18'2*5= 91 = 18*4+19 ).                      =
;=   .2 - La generacion de numeros aleatorios, cuyo contador incrementa    =
;=	  tanto aqui como en el bucle principal de la partida.		   =
;=   .3 _ Las bolas de evolucion: parpadeo y activacion. 		   =
;=   .4 - La evolucion de los pokemon: parpadeo y activacion.              =
;=   .5 - La generacion de notas empleando el altavoz de PC.               =
;=   .6	- El movimiento automatico de los pokemon mientras las teclas de   =
;=	  movimiento permanezcan pulsadas.				   =
;===========================================================================
        CALL GeneraAleatorio
        PUSHF                   ; Guarda los flags en la pila
        PUSH AX BX CX DX ES SI DI; Guarda los registros empleados 
                                ; en la pila
		
        CMPE 7	                ; Bola de evolucion activada?
        JNE CntBola	
        CMP interrupciones, 1   ; interrupcion 1 de 18: 
        JNE BolaOff1              
        MOV estadoBolas, 00h  	; bola invisible (mascara 0)
        JMP CntBola
BolaOff1:CMP interrupciones, 10 ; interrupcion 10 de 18:
        JNE CntBola
        MOV estadoBolas, 0ffh	; bola visible  (mascara ffh)

CntBola:CMP contadorBola1, 0    ; Esta esperando nueva bola?
        JE EvoPoke1
        CMP interrupciones, 1   ; Interrupcion 1 de 18:
        JNE EvoPoke1
        DEC contadorBola1       ; Decrementa el contador
        CMP contadorBola1, 0    ; Fin de la cuenta atras?
        JNE EvoPoke1
        STE 7, 1          	; Activa Bola de evolucion
        MOV OfsetBola1, 2000    ; Offset a 2000 para generar uno nuevo

EvoPoke1:CMPE 1		        ; Evoluciona el pokemon 1?
        JNE EvoPoke2
        CMP interrupciones, 1  	; Interrupcion 1 de 18:
        JNE EvoOff1               
        CMP contadorEvolucion1, 0; Fin de la cuenta atras?
        JNE EvoDec1             
        STE 1, 0    		  ;a. Termina la evolucion
        MOV pokemon1.velocidad, 2 ;b. Velocidad normal
        MOV contadorBola1, 5      ;c. Inicializa el contador de la bola 1
	MOV contadorRoto+1, 0	  ;d. No puede romper paredes
        JMP Sonido
EvoDec1:DEC contadorEvolucion1	; Decrementa contador de evolucion
        MOV estado1, 00h	; Pokemon no visible (parpadeo: mascara 0)
        JMP EvoPoke2
EvoOff1:CMP interrupciones, 5	; interrupcion 5 de 18:
        JNE EvoPoke2
        MOV estado1, 0ffh	; Pokemon visible (parpadeo: mascara ffh)
	
EvoPoke2:CMPE 0		        ; Evoluciona el pokemon 2?
        JNE Sonido
        CMP interrupciones, 1  	; Interrupcion 1 de 18:
        JNE EvoOff2               
        CMP contadorEvolucion2, 0; Fin de la cuenta atras?
        JNE EvoDec2             
        STE 0, 0    		  ;a. Termina la evolucion
        MOV pokemon2.velocidad, 2 ;b. Velocidad normal
	CALL limpiaNombreJuego    ;c. Marcador de nombre Vacio
        MOV contadorBola1, 5      ;d. Inicializa el contador de la bola 1
	MOV contadorRoto, 0	  ;e. No puede romper paredes
        JMP Sonido
EvoDec2:DEC contadorEvolucion2  ; Decrementa el contador de evolucion
        MOV estado2, 00h	; Pokemon no Visible (parpadeo: mascara 0)
        JMP Sonido      			
EvoOff2:CMP interrupciones, 5	; interrupcion 5 de 18:
        JNE Sonido
        MOV estado2, 0ffh	; Pokemon visible (parpadeo: mascara ffh)

Sonido: CMP contadorSonar, 0    ; Debe sonar el altavoz?
        JE AutoMP1
        MOV CX, nota            ; Nota que debe sonar
        MOV AL, CL
        OUT 42h, AL		; Envia byte bajo de la nota
        MOV AL, CH
        OUT 42h, AL		; Envia byte alto
        IN AL, 61h
        OR AL, 00000011b        ;activa el altavoz
        OUT 61h, AL
        
        DEC contadorSonar
        CMP contadorSonar, 0    ; Fin del sonido?
        JNE AutoMP1
        IN AL, 61h              
        AND AL, 11111100b	;desactiva altavoz
        OUT 61h, AL
	
	
AutoMP1:CLI                     ; inhibe interrupciones	
        INC contadorMov         ; Incrementa el contador de movimiento
	XOR DI, DI  		; Inicializa DI
	XOR SI, SI		; Inicializa SI
	STE 3, 0		; Pokemon a mover -> pokemon 1
	CALL AutoMoverReloj	; Movimiento Automatico con reloj
	CMP IAon, 1		; Usa la IA
	JNE RelnIA		
	CALL IAsimple
RElnIA:	INC DI			; Establece DI para pokemon 2
	MOV SI, 6		; Establece SI para pokemon 2
	STE 3, 1		; Pokemon a mover -> pokemon 2
	CALL AutoMoverReloj	; movimiento automatico con reloj

	INC interrupciones      ; Incrementa contador de interrupciones  
        CMP interrupciones, 19  ; Interrupcion 18 de 18 (19-1):
        JNE finReloj             
        MOV interrupciones, 1	; Establece interrupciones a 1
        INC segundos		; Incrementa segundos
        MOV AL, segundos
        XOR AH, AH
        MOV BL, 5               
        DIV BL                  ; Dividide segundos entre 5, si resto=0 
        CMP AH, 0                 ; segundos es multiplo de 5, estableciendo
        JNE AjsteRlj              ;interrupciones a 0 el proximo segundo
        MOV interrupciones, 0     ; durara 19 interrupciones y ajustaremos 
				  ; el error de reloj (1sg=18.2int)
AjsteRlj:CMP segundos, 60       ; Han pasado 60 segundos?
        JNE finReloj              
        INC minutos 		; incrementa minutos
        MOV segundos, 0		; establece segundos a 0
	SI_ASIGNA minutos, opciones, salir, 1 ; Minutos=opciones[0] -> fin juego
finReloj: MOV AL, 20h           ; fin de interrupcion (EOI)
        OUT 20h, AL
        STI                     ; Permite las interrupciones
        POP DI SI ES DX CX BX AX; Restauramos los registros
        POPF                    ; Restauramos los flags
        IRET
mi_reloj ENDP

mi_reloj_menus PROC FAR
;===========================================================================
;= INTERRUPCION DE RELOJ DURANTE LOS MENUS (para melodias)                 =
;===========================================================================
	PUSHF  			; Guarda los flags
	PUSH AX			; Guarda AX en la pila
	CALL suenamelodia	; Hace sonar una nota de la melodia
	
	MOV AL, 20h		; EOI (fin de interrupcion)
	OUT 20h, AL
	POP AX			; Restaura AX
	POPF			; Restaura los flags
	IRET
mi_reloj_menus ENDP

mi_teclado_menus PROC FAR
;===========================================================================
;= INTERRUPCION DE TECLADO PARA EL SISTEMA DE MENUS                        =
;===========================================================================
;= Esta rutina se ejecuta cada vez que el usuario pulsa una tecla estando  =
;= en un menu. Se encarga de la gestion del movimiento entre los menus y   =
;= de establecer variables segun las teclas que el usuario pulsa para las  =
;= acciones disponibles.                                                   =
;===========================================================================

        PUSHF                   ; Guarda los flags en la pila
        PUSH AX BX              ; Guarda los registros empleados en la pila
        IN  AL, 60h             ; Guarda en AL la tecla pulsada
	MOV teclaPulsada, AL	; mueve el keyCode a teclaPulsada

        PULSA 01h, salir, 1     ; Si se pulsa ESC -> salir=1
        
	CMP menuActual, 1	; Estamos en menu 1 (principal) ?
	JNE tecMnu2
	MOV incrementador, 0    ; Inicializa incrementador
        PULSA 50h, incrementador, 1  ; Tecla () -> incrementa contador
        PULSA 48h, incrementador, -1 ; Tecla () -> decrementa contador
	MOV AL, incrementador
        ADD cursor, AL          ; Actualiza posicion del cursor (de teclado)
        SI_ASIGNA cursor, 4, cursor, 5  ; Margenes del cursor
	SI_ASIGNA cursor, 10, cursor, 9
	STE 4, 1
	CMP TeclaPulsada, 1Ch	; Se ha pulsdo enter?
	JNE tecMnu2
	MOVBV entrar, cursor	; Selecciona una opcion segun el cursor
	SUB entrar, 4		; Ajusta la variable entrar

tecMnu2:CMP menuActual, 2       ; Estamos en menu 2 (elegir pokemon Jug1) ?
	JNE tecMnu3
        MOV incrementador, 0    ; Inicializa incrementador
	PULSA 1Ch, entrar, 1	; Tecla intro    -> Pasar a menu 3
	PULSA 4bh, incrementador,-1 ; Tecla (<-) -> decrementa el contador       	
	PULSA 4dh, incrementador,1  ; Tecla (->) -> incrementa el contador
	MOV AL, incrementador
        ADD indiceSeleccion, AL ; Actualiza el indice de pokemon

          ; Establecemos indices para unir el principio con el final de la
          ; tira de Pokemon seleccionables
	SI_ASIGNA indiceSeleccion, maxPokedex , indiceSeleccion, 0
        MOV BL, maxPokedex   	; limite de pokedex para la ruleta
	DEC BL
	SI_ASIGNA indiceSeleccion, -1, indiceSeleccion, BL
	MBW BX, indiceSeleccion
	MOVBV Pokemon1.indice, PokedexActual[BX]  ; Carga el indice

tecMnu3:CMP menuActual, 3       ; Estamos en menu 3 (elegir pokemon Jug2) ?
	JNE tecMnuC
        MOV incrementador, 0    ; Inicializa incrementador
        PULSA 1Ch, entrar, 1    ; Tecla Intro    -> Pasar al menu 3
        PULSA 4bh, incrementador,-1 ; Tecla (<-) -> decrementa el contador       
        PULSA 4dh, incrementador,1  ; Tecla (->) -> incrementa el contador
	MOV AL, incrementador
        ADD indiceSeleccion, AL ; Actualiza el indice de pokemon
	SI_ASIGNA indiceSeleccion, maxpokedex, indiceSeleccion, 0
        MOV Bl, maxPokedex	; limite de pokedex para la ruleta
        DEC Bl
	SI_ASIGNA indiceSeleccion, -1, indiceSeleccion, BL
	MBW BX, indiceSeleccion
	MOVBV Pokemon2.indice, PokedexActual[BX] ; carga el indice

tecMnuC:CMP menuActual, 4	; Estamos en menu de Creditos?
	JNE tecMnuL
        CMP teclaPulsada, 32h   ; Tecla M -> Activar Mew en menus 2 y 3
	JNE TecPkC
	STE 2,1
	MOV ampliacion, 4
	CALL AmpliaPokedex
TecPKC: CMP teclaPulsada, 1fh   ; Tecla S -> Activar Shadow en menus 2 y 3
	JNE TecPkC2
	MOV ampliacion, 5
	CALL AmpliaPokedex
TecPKC2:CMP teclaPulsada, 2eh   ; Tecla C -> Activar C-Fщ22 en menus 2 y 3
	JNE TecPkC3
	MOV ampliacion, 6
	CALL AmpliaPokedex
TecPKC3:CMP teclaPulsada, 30h   ; Tecla B -> Activar Pokemon Bug Missing No.
	JNE TecMnuL		; (Atencion, cheat sin garantias)
	MOV AX, Aleatorio
	MOV BL, 93
	DIV BL
	ADD AH, 6
	MOV ampliacion, AH
	CALL AmpliaPokedex

tecMnuL:CMP menuActual, 5	; Estamos en menu de Laberintos?
	JNE tecMnuO
        PULSA 02h, indiceLaberinto, 0 ; Teclas 1-4 -> Laberintos 1-4
	PULSA 03h, indiceLaberinto, 1
	PULSA 04h, indiceLaberinto, 2
	PULSA 05h, indiceLaberinto, 3

tecMnuO:CMP menuActual, 6       ; Estamos en menu de Opciones?
	JE tecMOp2
	JMP tecMnuT
tecMOp2:MOV incrementador, 0    ; Inicializa incrementador
        PULSA 50h, incrementador, 1  ; Tecla () -> incrementa contador
        PULSA 48h, incrementador, -1 ; Tecla () -> decrementa contador
	MOV AL, incrementador
        ADD cursor, AL          ; Actualiza posicion del cursor (de teclado)
        SI_ASIGNA cursor, 3, cursor, 4  ; Margenes del cursor
	SI_ASIGNA cursor, 8, cursor, 7
        MOV incrementador, 0    ; Inicializa incrementador
        PULSA 4Bh, incrementador, -1 ; Tecla (<-) -> incrementa contador
        PULSA 4Dh, incrementador, 1  ; Tecla (->) -> decrementa contador
	MOV AL, incrementador
	MBW BX, cursor
        STE 4, 1                ; Redibujado del cursor = 1
        STE 5, 0                ; Tipo de cursor = Flecha 
        CMP cursor, 6           
        JB curFlch              ; Si cursor es mayor o igual que 6:
        STE 5, 1                  ; Tipo de cursor = Texto en Amarillo
        PULSA 1Ch, entrar, BL     ; Tecla Intro -> valor de 'entrar' = cursor
	JMP tecMnuT
curFlch:ADD opciones[BX-4], AL  ; Si cursor es menor que 6:
        MOV incrementador, 0      ; Inicializa incrementador
        SI_ASIGNA opciones[BX-4], 0, opciones[BX-4], 1  ; Margenes de las 
        SI_ASIGNA opciones[BX-4], 10, opciones[BX-4], 9 ; Opciones numericas
	
tecMnuT:CMP menuActual, 7       ; Estamos en menu de seleccion de teclas?
	JE tecMTc2
	JMP tecMnuFin
tecMTc2:MOV incrementador, 0    ; Inicializa incrementador
        PULSA 50h, incrementador, 1  ; Tecla ()  -> incrementa contador 
        PULSA 48h, incrementador, -1 ; Tecla ()  -> decrementa contador
        PULSA 4Bh, incrementador, -1 ; Tecla (<-) -> decrementa contador
        PULSA 4Dh, incrementador, 1  ; Tecla (->) -> incrementa contador
	MOV AL, incrementador
        ADD cursor, AL          ; Actualiza cursor (de teclado)
        SI_ASIGNA cursor, -1, cursor, 0  ; Margenes del menu
	SI_ASIGNA cursor, 11, cursor, 10
        CMP AL, 1                        ; Si el cursor se mueve hacia abajo:
	JE avance
        SI_ASIGNA cursor, 4, cursor, 3   ; Actualizamos la posicion al pasar
        SI_ASIGNA cursor, 9, cursor, 8   ; por los huecos del menu
	JMP retroce
avance: SI_ASIGNA cursor, 4, cursor, 5   ; Si se mueve hacia arriba lo mismo.
	SI_ASIGNA cursor, 9, cursor, 10
retroce:STE 4, 1                ; Redibujado del cursor = 1
        STE 5, 0                ; Tipo de cursor = Flecha
        CMP cursor, 10  ; Si se encuentra en la posicion de la opcion Salir:
	JB curFlc2
        STE 5, 1                ; Tipo de cursor = Texto en Amarillo
        PULSA 1Ch, salir, 1     ; Tecla Intro -> Salir del menu = 1
	JMP tecMnuFin
curFlc2:CMP incrementador, 0    ; Si no, verifica si el cursor se ha movido
        JNE TecMnuFin           ; Si se ha movido sale de la rutina
        MOV BL, teclaPulsada    ; si no, verifica la tecla pulsada
        CMP BL, 59h             ; Codigo Qwerty > 58h?
        JNB tecMnuFin             ; Sale de la rutina
        CMP BL, 2Ah             ; Tecla shift o Flecha direccion (Win XP)?
        JE tecMnuFin              ; Sale de la rutina
        MBW BX, cursor       
        CMP cursor, 4        
        JB noModCr           ; Si cursor es mayor que 4 corrige el valor 
        DEC BX                 ; de cursor para establecer las teclas.
noModCr:MOV AX, BX
	MBW BX, teclaPulsada
        CMP gfxTeclas[BX-1], espacioLibre ; Verifica si la tecla es valida
        JE TecMnuFin                    ; no lo es -> fin de la rutina
	MOV BX, AX
        MOVBV teclas[BX], teclaPulsada  ; La establece como tecla de juego
	
tecMnuFin: MOV Al, 20h          ; Fin de la interrupcion (EOI)
        OUT 20h, Al
        POP BX AX               ; Restablecemos los registros
        POPF                    ; Restablecemos los flags
        IRET
mi_teclado_menus ENDP

mi_teclado_juego PROC FAR
;===========================================================================
;= INTERRUPCION DE TECLADO DURANTE LA PARTIDA                              =
;===========================================================================
;= Esta rutina se ejecuta cada vez que los jugadores pulsan una tecla      =
;= durante el juego. Verifica si dabemos salir del juego, y llama a un     =
; Procedimiento que establece variables para poder mover los pokemon.      =
;===========================================================================

        PUSHF			; Guardamos los flags en la pila
        PUSH AX SI DI BX CX DX  ; Guardamos los registros empleados en la pila
        IN AL,60h               ; Guardamos en al la tecla pulsada
	MOV TeclaPulsada, AL
       
       	PULSA 01h, salir, 1     ; Verificamos si se pulsa ESC si se
		  		; ha pulsado activamos la variable de
                                ; Salida del programa

        PUSH AX                 ; Guardamos el codigo de tecla en AX
        AND TeclaPulsada, 01111111b ; Descartamos el bit de PULSAR/SOLTAR
	
finTeclado: MOV AH, 11h         ; Hay teclas esperando en buffer?
        INT 16h
        JZ finVacB              ; si no, saltamos a finVacB
        MOV AH, 10h               ; si las hay, pedimos una tecla
        INT 16h                   ; hasta vaciar el Buffer.
        JMP finTeclado          

finVacB:MOV AL, 20h             ; Fin de la interrupcion (EOI)
        OUT 20h, AL
	POP AX
        CALL AutoMover          ; Llamamos al procedimiento que establece las
                                ; variables para el movimiento automatico de 
                                ; los pokemon mientras esten pulsadas las
                                ;teclas
        POP DX CX BX DI SI AX   ; Restablecemos los registros
        POPF  			; Restablecemos los flags
	IRET
mi_teclado_juego ENDP

;***************************************************************************
;*                           Programa Principal                            *
;***************************************************************************
POKEMON:

        MOV AX, @data           ; movemos el offset del segmento
        MOV DS, AX                ; de datos a ds
        MOV AX, pant            ; movemos el offset del segmento
        MOV ES, AX                ; de pantalla a es
    
        MOV AX, 1003h           ; Establece el modo de video:     
        XOR BL, BL             ; El bit 7 no indica destello, tenemos
        INT 10h   		; 16 colores de fondo

        CALL CargaJuego         ; Carga las opciones de juego de un archivo
	
SMenus: MOV nueva_int_rel, offset mi_reloj_menus
	CALL establecerReloj   ; Establece la interrupcion de reloj
	MOV nueva_int_tec, offset mi_teclado_menus
        CALL establecerTeclado  ; Establecemos la interrupcion de teclado
	CMP MenuActual, 10	; de los menus
	JE Smenus2     		; Saltamos a menu de victoria
	MOV MenuActual, 1    	
SMenus2:CALL iniciar_menus      ; Llama al inicio de menu	
SMenus3:CLI                     ; inhibe interrupciones
        MBW BX, MenuActual
	PUSH BX			; Guarda el menu actual en la pila
	CALL sistema_de_menus	; Llama al sistema de menus
	POP BX			; Rescata el menu previo de la pila
	CMP MenuActual, 9	; Si pasamos al menu 9 se inicia la partida
        JNE SMenus4
	CALL Partida_2_jugadores
	JMP SMenus		; Reinicia el sistema de menus
SMenus4:STI                     ; Breve Ventana para interrupciones
        CMP MenuActual, BL      ; Si el menu actual coincide con el previo:
	JE SMenus3  		  ; Volvemos al sistema de menus
	JMP SMenus2  		  ; Si no, debemos iniciar el nuevo menu

;***************************************************************************
;*                     Procedimientos Principales                          *
;***************************************************************************
    
iniciar_Menus PROC NEAR
;===========================================================================
;= Inicio de los menus							   =            
;===========================================================================
;= Esta rutina realiza las tareas iniciales tras cambiar de menu, tales    =
;= como el dibujado, configuracion del cursor e inicializacion de          =
;= variables.								   =
;===========================================================================
	MOV entrar, 0           ; Inicializa entrar
        MOV salir, 0            ; inicializa Salir
;*************************** Menu Principal ********************************
        CMP MenuActual, 1       
        JNE imMnu2              ; Salta al siguiente si no esta en menu 1
	MOV punteroMenu, offset MenuPrincipal
	CALL DibujarMenu	; Dibuja el menu
	MOV cursor, 5		; Inicializa el cursor
	STE 5, 1		; Establece Tipo de cursor = Flecha
	STE 4, 1
	RET
	
;**************** Menu Seleccionar Pokemon ( Ambos ) ***********************
imMnu2: CMP MenuActual, 2        
        JE imMnuS              ; Dibuja si esta en menu 2
	CMP MenuActual, 3
	JNE imMnuCr	       ; Salta si no esta en menu 3
imMnuS:	MOV punteroMenu, offset menuEligeV2
        CALL dibujarMenu	; Dibuja el menu de Seleccion
	RET

;************************** Menu de Creditos *******************************
imMnuCr:CMP MenuActual, 4 	
	JNE imMnuLb		; Salta si no esta en el menu de creditos
	MOV punteroMiniMenu, offset mnuCreditos
	CALL dibujarminiMenu	; Dibuja el miniMenu de creditos
	RET
	
;************************* Menu de Laberintos ******************************	
imMnuLb:CMP MenuActual, 5	
	JNE imMnuOp		; Salta si no esta en el menu de laberintos
	MOV punteroMenu, offset MenuPrincipal
	CALL DibujarMenu	; Dibuja el menu principal para regenerar
				; el entorno del menu de laberintos
	MOV indiceLaberinto, 4
	MOV punteroMiniMenu, offset mnuLaberintos
	CALL DibujarminiMenu	; Dibuja el miniMenu de laberintos
	RET

;************************** Menu de Opciones *******************************
imMnuOp:CMP MenuActual, 6	
	JNE imMnuTc		; Salta si no esta en el menu de Opciones
	MOV punterominiMenu, offset mnuOpciones
	Call DibujarminiMenu	; Dibuja el miniMenu de opciones
	MOV cursor, 4		; Inicializa el cursor
	STE 5, 0		; Establece Tipo de cursor = Flecha
	RET

;******************** Menu de Seleccion de Teclas **************************
imMnuTc:CMP MenuActual, 7
	JNE imMnuAy		;Salta si no esta en menu de Teclas
	MOV punterominiMenu, offset mnuTeclas
	Call DibujarminiMenu	; Dibuja el miniMenu de opciones de teclas
	MOV cursor, 0		; Inicializa el cursor
	STE 5, 0		; Establece Tipo de cursor = Flecha
	RET

;**************************** Menu de Ayuda ********************************
imMnuAy:CMP MenuActual, 8	
	JNE iniMnuVi		; Salta si no esta en menu de ayuda
	MOV punteroMenu, offset menuAyuda
	Call DibujarMenu	; Dibuja el menu de ayuda
	
;*************************** Menu Victoria ********************************
iniMnuVi:CMP MenuActual, 10       
        JNE retMnu              ; Salta si no esta en menu Victoria
	MOV punteroMenu, offset MenuVictoria
	CALL DibujarMenu	; Dibuja el menu
	CALL DibujarVictoria	; Rellena el menu de victoria
	RET
retMnu: RET
iniciar_menus ENDP

sistema_de_Menus PROC NEAR
;===========================================================================
;= Sistema de menus							   =            
;===========================================================================
;= Esta rutina se encarga de los cambios de menus en funcion de la variable=
;= entrar y subfunciones de estos como la de salir de la aplicacion o el   =
;= generador de numeros aleatorios.					   =
;===========================================================================
;*************************** Menu Principal ********************************
        CMP MenuActual, 1       
        JNE smMnu2              
	CALL Fin_del_programa                 ; 1 - Salida del Programa
        CALL GeneraAleatorio                  ; 2 - Generador de aleatorios
	CALL dibujarCursor     		      ; 3 - Dibuja el cursor (teclado)
        SI_ASIGNA entrar, 01h, MenuActual, 2  ; 4 - Inicio de la partida	
	SI_ASIGNA entrar, 02h, MenuActual, 2  ; 5 - Modo 1 Jugador
	SI_ASIGNA entrar, 03h, MenuActual, 4  ; 6 - Creditos
        SI_ASIGNA entrar, 04h, MenuActual, 6  ; 7 - Menu de Opciones
        SI_ASIGNA entrar, 05h, MenuActual, 8  ; 8 - Menu de Ayuda
	SI_ASIGNA entrar, 01h, IAon, 0        ; 9 - Desactiva IA
	SI_ASIGNA entrar, 02h, IAon, 1        ; 10 - Activa IA
	RET

;**************** Menu Seleccionar Pokemon (Jugador 1) *********************
smMnu2: CMP MenuActual, 2
	JNE smMnu3
	CALL Selecciona			   ; 1 - Actualiza la seleccion
	SI_ASIGNA entrar, 1, MenuActual, 3 ; 2 - Menu seleccion jugador 2
	CMP IAoN, 1 			   ; 3 - IA activada?
	JE SelectIA
	SI_ASIGNA salir, 1, MenuActual, 1  ; 3 - Volver a menu principal
	RET
SelectIA:SI_ASIGNA entrar, 1, MenuActual, 9
	CALL iniciarCaptura
	RET

;**************** Menu Seleccionar Pokemon (Jugador 2) *********************
smMnu3: CMP MenuActual, 3		
	JNE smMnuCr		
	CALL Selecciona   		   ; 1 - Actualiza la Seleccion
	SI_ASIGNA salir, 1, MenuActual, 1  ; 2 - Volver al principal	
	SI_ASIGNA entrar, 1, MenuActual, 5 ; 4 - Iniciar Juego
	RET

;******************** Menu de Creditos y Ayuda *****************************
smMnuCr:CMP MenuActual, 4   
	JE smSalir
	CMP MenuActual, 8
	JNE smMnuLb
smSalir:SI_ASIGNA salir, 1, MenuActual, 1    ; 1 - Volver al principal
	RET

;******************** Menu de Laberintos ***********************************
smMnuLb:CMP MenuActual, 5  
	JNE smMnuOp
	MOV menuActual, 9
	SI_ASIGNA indiceLaberinto, 4, MenuActual, 5    ; 1 - Empezar el juego
	RET

;************************ Menu de Opciones *********************************
smMnuOp:CMP MenuActual, 6
	JNE smMnuTc
	SI_ASIGNA salir, 1, MenuActual, 1    ; 1 - Volver al principal
	SI_ASIGNA entrar, 7, MenuActual, 1   ; 2 - Volver al principal
	SI_ASIGNA entrar, 6, MenuActual, 7   ; 3 - Menu de Teclas
	CALL dibujarCursor     		     ; 4 - Dibuja el cursor (teclado)
	CALL dibujarOpciones      	     ; 5 - Dibuja las opciones
	RET

;****************** Menu de Opciones de Teclas *****************************
smMnuTc:CMP MenuActual, 7
	JNE smMnuV	
	SI_ASIGNA salir, 1, MenuActual, 6    ; 1 - Volver al principal
	CALL dibujarCursor     		     ; 2 - Dibuja el cursor (teclado)
	CALL comprobarTeclas     	     ; 3 - Comprueba teclas duplicadas
	CALL dibujarTeclas     		     ; 4 - Redibuja las teclas

;****************** Menu de Victoria ***************************************
smMnuV:CMP MenuActual, 10
	JNE smMnuF	
	SI_ASIGNA salir, 1, MenuActual, 1    ; 1 - Volver al principal
	CMP salir, 1
	JNE smMnuF
	mov sonando, 0     		     ; 2 - Para la melodia 
	IN AL, 61h              
        AND AL, 11111100b		     ; 3 - desactiva altavoz
        OUT 61h, AL	
	
smMnuF: RET
sistema_de_menus ENDP

Partida_2_jugadores PROC NEAR
;===========================================================================
;= Partida de dos Jugadores						   =            
;===========================================================================
;= Este procedimiento se encarga de gestionar una partida de dos jugadores.=
;=  1 - Realiza los preparativos de la partida, interrupciones, dibujado,..=
;=  2 - Mantiene un bucle mientras esperamos eventos de reloj o teclado y  =
;=        redibuja la bola de evolucion y el reloj,  elementos no afectados=
;=        por los eventos de teclado.				           =
;===========================================================================
	CALL DibujarJuego	; Dibuja elementos del juego
        STI                     ; Permite interrupciones
	MOV nueva_int_rel, offset mi_reloj
        CALL establecerReloj    ; Establece interrupcion de reloj
        MOV nueva_int_tec, offset mi_teclado_juego
        CALL establecerTeclado	; Establece interrupcion de teclado
        CLI                     ; Inhibe interrupciones
        CALL inicioPartida      ; Configura variables
        STI                     ; permite interrupciones

Partida:CLI                     ; 1 - Inhibe interrupciones
        CALL dibujarreloj       ; 2 - Pinta el reloj
        CALL generaAleatorio    ; 3 - Generador de numeros aleatorios
        CALL PintarBola1        ; 4 - Pinta la bola de evolucion
        STI                     ; 5 - Breve ventana para interrupciones
        CMP Salir, 1            ; 6 - Sale al menu Principal?
        JNE Partida
        CLI                     ; inhibe interrupciones
	MOV Salir, 0   		; Desactivamos la variable de salida
	RET
Partida_2_Jugadores ENDP

fin_del_programa PROC NEAR
;===========================================================================
;= Fin del Programa     						   =            
;===========================================================================
;= Verifica el valor de Salir, y en caso necesario reestablece el vector   =
;= de interrupciones, guarda las opciones, limpia la pantalla y envia el   =
;= comando 4ch al DOS para finalizar el programa.                          =
;===========================================================================
	CMP Salir, 1		; Salir = 1?
	JNE fpFin
        CALL GuardaJuego	; Guarda las opciones en un archivo
	CALL restablecerReloj	; Reestablece la interrupcion de reloj
	CALL restablecerTeclado ; Reestable interrupcion de teclado
        CALL limpiarPantalla    ; limpia la pantalla
        MOV AH, 4CH             ; Sale al DOS
        INT 21h
fpFin:  RET
fin_del_programa ENDP

;***************************************************************************
;*                 Procedimientos del Sistema de Menus                     *
;***************************************************************************
    
dibujarMenu Proc Near
;===========================================================================
;= Dibujar Menu (25x80)    						   =            
;===========================================================================
;= Entrada: punteroMenu.                                                   =
;= Accion: Dibuja un menu de 80x25 caracteres (80x16 mas la cabecera de    =
;=         pokemon) en la pantalla.                                        =
;===========================================================================
	PUSH AX BX CX DI SI     ; Guarda los registros en la pila
        MOV BX, punteroMenu     ; Offset del mapa de dibujo
        XOR DI, DI               ; inicializa DI
        XOR SI, SI               ; inicializa SI
        MOV CX, 720             ; Caracteres enM titulo 80*9=720

Dbtit:  MOV AH, titulo[SI+720]  ; Color del caracter (en el mapa)
        SUB AH, 40h             ; Pasamos de ASCII a 16 colores
        PUSH CX
        MOV CL, 4
        SHL AH, CL               ; Reajusta ah
        POP CX
        ADD AH, titulo[SI+1440] ; Suma el color de frente en ASCII
        SUB AH, 40h             ; Pasa de ASCII a 16 colores
	MOV AL, titulo[SI]      ; Dise¤o del caracter (en el mapa)
        MOV ES:[DI],AX          ; mueve al buffer de pantalla
        ADD DI, 2               ; incrementa el contador de pantalla
        INC SI                  ; incrementa el contador de mapa
        LOOP DbTit
      
      	MOV CX, 1280		; Caracteres en menu 80*16=1280
        XOR SI, SI		; Inicializa SI
DbMen:  MOV AH, [BX][SI+1280]   ; Color del caracter (en el mapa)
        SUB AH, 40h             ; Pasa de ASCII a 16 colores
        PUSH CX
        MOV CL, 4
        SHL AH, CL               ; Reajusta ah
        POP CX
        ADD AH, [BX][SI+2560]   ; Suma el color de frente en ASCII
        SUB AH, 40h             ; Pasa de ASCII a 16 colores
	MOV AL, [BX][SI]        ; Dise¤o del caracter (en el mapa)
        MOV ES:[DI],AX          ; mueve al buffer de pantalla
        ADD DI, 2               ; incrementa el contador de pantalla
        INC SI                  ; incrementa el contador de mapa
      LOOP DbMen
      POP SI DI CX BX AX	; Restaura los registros de la pila
      RET
dibujarMenu EndP

dibujarminiMenu PROC NEAR
;===========================================================================
;= Dibujar miniMenu (11x28)    						   =            
;===========================================================================
;= Entrada: punteroMiniMenu.                                               =
;= Accion: Dibuja un menu de 11x28 caracteres en la pantalla.              =
;===========================================================================
	PUSH AX BX CX DI SI	; Guarda los registros en la pila
	MOV DI,	1974            ; Posicion del miniMenu
	MOV BX, punteroMiniMenu ; Offset del mapa del miniMenu
        XOR SI, SI              ; inicializa SI
        MOV CX, 11              ; Caracteres en la linea

linMenu:PUSH CX			; Guarda CX en la pila
	MOV CX, 28		; Escribe 28 caracteres
carMenu:MOV AH, TextoBlanco	; Mueve el color del texto a AH
        MOV AL, [BX][SI]        ; Mueve el caracter a AL
        MOV ES:[DI],AX          ; Dibuja el caracter por pantalla
        ADD DI, 2               ; incrementa el contador de pantalla
        INC SI                  ; incrementa el contador de menu
	LOOP carMenu
	POP CX			; Recupera CX de la pila
	ADD DI, 104		; Suma 104 a DI (160-28*2)
      	LOOP linMenu
	POP SI DI CX BX AX	; Restaura los registros de la pila
      	RET
dibujarminiMenu ENDP

Selecciona PROC NEAR
;===========================================================================
;= Redibujado del menu de Seleccion de pokemon                             =            
;===========================================================================
;= Este procedimiento actualiza la pantalla de seleccion de pokemon,       =
;= redibuja el nombre, el indice del jugador y las tres vistas de pokedex  =
;= de los pokemon, anterior y siguiente en negro sobre gris, y el actual   =
;= en el color que le corresponde en el juego.                             =
;===========================================================================
	PUSH AX BX CX DX DI SI	; Guarda los registros en la pila
	XOR SI, SI 		; Inicializa SI
	MOV AL, menuActual	; Mueve a AL el indice del menu actual
	SUB AL, 02h		; Le resta 2 para obtener el jugador actual 
	MOV CX, 6		; Campos de la estructura TPPOKEMON
	XOR BX, BX		; Inicializa BX
BclSel: ABW BX, AL		; BX*6=desplazamiento parcial del indice
	LOOP BclSel

	; Si no se ha modificado el indice del nombre -> SI=1
	SI_ASIGNA indiceNombre, Pokemon1.indice[BX], SI, 1
	; indice del nombre = indice del pokemon seleccionado
	MOVBV indiceNombre, Pokemon1.indice[BX]
	; mueve a punteroNombre el desplazamiento de nombrePokemon
	MOV punteroNombre, offset nombrePokemon
	CALL PosicionarNombre 	; Calcula la longitud del nombre
	MOV posnombre, 48	; Espacio disponible para el nombre (bytes)
	SUB posnombre, DX	; Resta la longitud del nombre (2 veces)
	SUB posnombre, DX
        PUSH CX
        MOV CL, 2
        SHR posnombre, CL        ; Divide por cuatro el espacio sobrante
        POP CX
	SHL posnombre, 1	; y lo multiplica por 2 (siempre par)
	ADD posnombre, 3736     ; Suma la posicion inicial del nombre
	CMP SI, 0		; Ha cambiado el nombre?
	JNE sinBorrado		; si no, no borra el anterior  
	XOR AH, AH		; Mueve a AH el color negro
	MOV AL, espacioLibre	; Mueve a AL un espacio
	MOV CX, 24		; Mueve a CX la longitud del nombre
	MOV DI, 3736		; Mueve a DI la posicion del nombre
BorraFondo: MOV ES:[DI], AX	; Escribe un espacio en la pantalla
	ADD DI, 2		; Incrementa el indice
	LOOP BorraFondo
	
sinBorrado:CALL dibujarNombres	; Escribe por pantalla el nombre del pokemon
	MOV AH, textoBlanco	; Mueve a AH el color blanco 
	MOV AL, MenuActual	; Mueve a AL el indice del menu actual
	ADD AL, 2fh		; Pasa el indice a ASCII (numero de jugador)
	MOV ES:[1676], AX	; Escribe el numero por pantalla

	MBW BX, IndiceSeleccion	; IndiceSeleccionado
	MOV AX, BX 		; Lo guarda en AX
	; Si el indice es 0, asigna el indice maximo (cierra ruleta)
	SI_ASIGNA BL, 0, BL, MaxPokedex
	DEC BX 			; Ajusta indice para dibujar anterior
	MOVBV indicePokedex, PokedexActual[BX] ; Indice de Pokedex
	
	MOV colorPokedex, 03h	; Pinta el pokemon previo en negro sobre gris
	MOV PosPokedex, 1928	; Posicion donde lo debe pintar
	CALL pintaPokedex	; Dibuja la vista de Pokedex del pokemon
	
	MBW BX, indicenombre	; Mueve a BX el indice del Pokemon
	MOVBV colorPokedex, pokemonColor[BX] ; Dibuja en el color del pokemon
	MOV PosPokedex, 2138	; Posicion donde lo dibuja
	MOV BX, AX
	
	MOVBV indicePokedex, PokedexActual[BX] ; Indice de Pokedex
	CALL pintaPokedex	; Dibuja la vista de Pokedex del pokemon

	INC BX       			       ; Ajusta para dibujar sig.
	; Si el indice es el maximo, dibuja el pokemon 0 (cierra ruleta)
	SI_ASIGNA MaxPokedex, BL , BL, 0
	MOVBV indicePokedex, PokedexActual[BX] ; Indice de Pokedex
 
	MOV colorPokedex, 03h	; pinta el pokemon siguiente negro sobre gris
	MOV PosPokedex, 2028	; Posicion donde lo dibuja
	CALL pintaPokedex	; Dibuja la vista de Pokedex del pokemon
	POP SI DI DX CX BX AX   ; Restaura los registros desde la pila
	RET
Selecciona ENDP

dibujarCursor PROC NEAR
;===========================================================================
;= Dibujar el cursor de teclado en el menu    			           =            
;===========================================================================
;= Entrada: Cursor, bits 4 y 5 de Estado.	                           =
;= Accion: Dibuja un cursor en el menu, coloreando el texto en amarillo si =
;=         se encuentra sobre un boton (accion al pulsar intro) o dibujando=
;=         una flecha en azul si se trata de una opcion (accion al pulsar  =
;=         flechas de direccion u otras teclas.                            =
;===========================================================================
	CMPE 4			; Ha cambiado el cursor?
	JE siDibcr		  ; si no, sale de la rutina
	RET
siDibcr:PUSH AX BX CX DI 	; Guarda los registros en la pila
	STE 4, 0		; Redibujado del cursor = 0
	CMP menuActual, 1
	JNE miniDib
	CALL DibujarMenu	; Redibuja el Menu para borrar el cursor
	JMP nomini
minidib:CALL DibujarMiniMenu	; Redibuja el miniMenu para borrar el cursor
noMini: MOV DI,	1974            ; Posicion 0 del cursor
	MOV BL, cursor		; Mueve a BL la posicion del cursor
	MOV AX, 160    		; Bytes por linea 160
	MUL BL			; Multiplica para saber la posicion del
	ADD DI, AX		  ; cursor y la suma a la posicion inicial
	
	CMPE 5			; Cursor de Texto Amarillo?
	JNE dibFlch
	MOV CX, 22		; Caracteres en la linea a partir del cursor 
BclCurA:MOV AX, ES:[DI]		; Mueve a AX un caracter de la pantalla
	MOV AH, 0eh		; Cambia el color a amarillo
	MOV ES:[DI], AX		; Mueve el caracter de AX a la pantalla
	ADD DI, 2		; Incrementa DI
	LOOP BclCurA
	POP DI CX BX AX		; Restaura los registros de la pila
	RET
	
dibFlch:MOV AL, gfxCursor	; Mueve a AL el grafico de cursor flecha
	MOV AH, 01h		; Mueve a AH el color Azul
	MOV ES:[DI], AX		; Dibuja el cursor
	POP DI CX BX AX		; Restaura los registros de la pila
	RET	
dibujarCursor ENDP
	
dibujarOpciones PROC NEAR
;===========================================================================
;= Dibujar las opciones numericas en el menu de opciones                   =            
;===========================================================================
	PUSH AX BX CX DI
	MOV DI,	2656            ; Posicion de la primera opcion
	MOV CX, 2		; hay dos opciones
	MOV AH, 0eh		; Mueve a AH el color amarillo
	XOR BX, BX		; Inicializa BX
BclDibO:MOV AL, opciones[BX]	; Mueve a AL la opcion de indice BX
	ADD AL, 30h		; Suma 30h para pasar de Hexadecimal a ASCII
	MOV ES:[DI], AX		; Dibuja el numero en la pantalla
	INC BX			; Incrementa el contador de opciones
	ADD DI, 160		; Incrementa el contador de posicion
	LOOP BclDibO
	POP DI CX BX AX
	RET	
dibujarOpciones ENDP

dibujarTeclas PROC NEAR
;===========================================================================
;= Dibujar las teclas de control en el menu de seleccion de teclas         =            
;===========================================================================
	PUSH AX BX CX DI	; Guarda los registros en la pila
        MOV DI, 2022            ; Posicion del menu
	MOV CX, 2		; Las teclas estan agrupadas por jugador
	MOV AH, 0eh		; Mueve a AH el color amarillo
	XOR BX, BX		; Inicializa BX
BclDibT:PUSH CX			; Guarda CX en la pila
	MOV CX, 4		; Hay 4 teclas por jugador
BclDbT2:MOV AL, teclas[BX]	; Mueve a AL una tecla
	PUSH BX			; Guarda BX en la pila 
	MBW BX, AL		; Mueve AL a BX
	MOV AL, gfxteclas[BX-1]	; Grafico de tecla correspondiente a AX
	MOV ES:[DI], AX		; Dibuja el caracter
	POP BX			; Restaura BX desde la pila
	INC BX			; Incrementa el contador de tecla
	ADD DI, 160		; Incrementa la posicion en pantalla
	LOOP BclDbT2
	POP CX			; Restaura CX desde la pila
	ADD DI, 160		; Actuliza Posicion para teclas Jugador 2
	LOOP BclDibT
	POP DI CX BX AX		; Restaura los registros desde la pila
	RET	
dibujarTeclas ENDP

ComprobarTeclas PROC NEAR
;===========================================================================
;= Comprobar los duplicados en las teclas de control en el menu de teclas  =            
;===========================================================================
;= Esta rutina verifica duplicados en las teclas de control y en caso de   =
;= encontrarlos cambia la tecla que sea igual a la que apunta el cursor por=
;= la tecla ESC, dejandola de este modo graficamente en blanco para que el =
;= usuario establezca un nuevo valor. Aunque el usuario no de un valor a la=
;= tecla, ESC no servira como tecla de control, ya que al pulsarlo termina =
;= la partida en empate.                                                   =
;===========================================================================
	PUSH AX BX CX
	MOV CX, 8		; Hay 8 teclas de control
	MOV AH, cursor		; Mueve a AH el indice del cursor
        CMP cursor, 10		; Si el cursor esta sobre 'Salir'
        JE finCtec		  ; salimos de la rutina
	CMP cursor, 4		; Si el cursor esta en las ultimas 4 teclas
	JB noIncCT
	DEC AH			; Corrige el valor del indice
noIncCt:MBW BX, AH		; Mueve AH a BX (el indice)
	MOV AL, teclas[BX]	; Mueve a AL la tecla actual
	XOR BX, BX		; Inicializa BX
BclCTc: CMP BL, AH              ; Si BL apunta a la tecla actual
	JE noComp		  ; no efectua la comparacion
	CMP teclas[BX], AL	; Si la tecla de indice BL es igual
	JNE noComp
	MOV teclas[BX], 01h	; La cambia por ESC (tecla en blanco)
noComp: INC BX			; incrementa contador
	LOOP BclCTc
finCtec:POP CX BX AX		; Restaura los registros de la pila
	RET	
ComprobarTeclas ENDP

DibujarVictoria PROC NEAR
;===========================================================================
;= Dibujar Menu de Victoria    						   =            
;===========================================================================
	PUSH AX BX CX DX DI SI
	MOV punteronombre, offset nombrepokemon ; nombres no evolucionados
	MOV  CX, 1
	CMPE 0			; Ha vencido el pokemon 2?
	JNE DbVic1
	MOV posPokedex, 1788	; Posicion del pokemon2
	MOV DX, 1848		; Posicion del pokemon1
	MOV PosNombre, 3562	; Posicion del nombre2
	MOV AX, 3616		; Posicion del nombre1	
	JMP IniDibV
DbVic1: MOV posPokedex, 1848	; Posicion del pokemon2
	MOV DX, 1788		; Posicion del pokemon1
	MOV PosNombre, 3616	; Posicion del nombre2
	MOV AX, 3562		; Posicion del nombre1
	CMP IAon, 1		; Esta activada la IA?
	JNE IniDibV
	MOVBV ampliacion, Pokemon2.indice ; Posible captura
	CALL AmpliaPokedex	; Trata de ampliar la pokedex con el vencido
	
IniDibV:MOVBV indicePokedex, Pokemon2.indice ; Variables de Dibujado
	MOV BL, indicePokedex
	XOR BH, BH
	MOVBV colorPokedex, Pokemoncolor[BX]
	CALL PintaPokedex     		     ; Pinta el Pokemon
	MOV indiceNombre, BL		     ; indice del nombre
	CALL dibujarNombres		     ; pinta el nombre del pokemon
	
	MOVBV indicePokedex, Pokemon1.indice ; Variables de Dibujado
	MOV BL, indicePokedex
	MOVBV colorPokedex, pokemonColor[BX]
	MOV PosPokedex, DX
	CALL PintaPokedex     		     ; Pinta el pokemon
	MOV Posnombre, AX		     ; posicion del nombre
	MOV indiceNombre, BL		     ; indice del nombre
	CALL dibujarNombres		     ; pinta el nombre del pokemon	
	
	CMPE 0				; jugador 2 Evolucionado?
	LAHF				; Carga los flags
        PUSH CX
        MOV CL, 14
        SHR AX, CL                      ; Ajusta para ZF
        POP CX
	AND AX, 00000001		; Aisla ZF
	ADD AL, 31h			; intervalo 0-1 -> 1-2 en ASCII
	MOV AH, textoBlanco		; pinta el indice en blanco
	MOV es:[3918], AX		; Indice del jugador ganador
	CMP IaOn, 1		; Ia activada?
	JNE finVict
	CMPE 0			; Jugador 2 gana?
	JE finVict
	XOR DI, DI  		; Inicializa DI
	XOR SI, SI		; Inicializa SI
	MOV CX, 80		; Hay 80 caracteres por linea
	MOV AH, 0eh
BclVict:MOV AL, capturLin[DI]   ; Cambia la ultima linea
	MOV ES:3840[SI], AX
	INC DI			; Incrementa contador de linea
	INC SI			; Incrementa contador de pantalla
	INC SI
	LOOP BclVict
	
finVict:mov offsetmelodia, offset melodiaVictoriaSon	; melodia de
	mov offsetduracion, offset melodiaVictoriaDur	; victoria
	CALL CargarMelodia
	mov notaActual, 0
	mov sonando, 1
	POP SI DI DX CX BX AX 
	RET
DibujarVictoria ENDP

IniciarCaptura PROC NEAR
;===========================================================================
;= Selecciones Aleatorias al inicio del modo captura			   =            
;===========================================================================
;= Elige aleatoriamente un laberinto y un rival, que puede ser un pokemon  =
;= comun o un pokemon raro, con un 20% de posibilidades de que sea uno raro=
;===========================================================================
	PUSH AX BX 		; Guarda los registros en la pila
	MOV AX, Aleatorio	; Valor aleatorio en AX
        PUSH CX
        MOV CL, 3
        SHR AX, CL               ; Evita desbordamiento por division
        POP CX
	MOV BL, 4		; Genera un valor de 0 a 3
	DIV BL
	MOV indiceLaberinto, AH	; Carga el indice del laberinto
	MOV AX, Aleatorio	; Valor aleatorio en AX
        PUSH CX
        MOV CL,3
        SHR AX,CL                ; Evita desbordamiento por division
        POP CX
	MOV BL,5		; Genera un valor de 0 a 4
	DIV BL
	CMP AH, 4
	JNE CapNormal		; Unicamente no saltara con un 4 (20% posib.)
	MOV AX, Aleatorio	; Valor Aleatorio en AX
        PUSH CX
        MOV CL, 3
        SHR AX,CL                ; Evita desbordamiento por division
        POP CX
	MOV BL, 3		; Genera un valor de 0 a 2
	DIV BL
	ADD AH, 7		; Ajustamos el valor ( 7-9)
	MOV Pokemon2.indice, AH	; Carga el pokemon raro
	POP BX AX		; Restaura los registros de la pila y sale
	RET
CapNormal:MOV AX, Aleatorio	; Valor aleatorio en AX
        PUSH CX
        MOV CL, 3
        SHR AX,CL                ; Evita desbordamiento por division
        POP CX
	MOV BL, 4		; Genera un valor de 0 a 3
	DIV BL
	MOV Pokemon2.indice, AH	; Carga el pokemon comun
	POP BX AX		; Restaura los registros y sale
	RET	
IniciarCaptura ENDP

;***************************************************************************
;*        Procedimientos de la partida de Dos Jugadores (graficos)         *
;***************************************************************************

DibujarJuego PROC NEAR
;===========================================================================
;= Dibujar Juego        						   =            
;===========================================================================
;= Entrada: indiceLaberinto.                                               =
;= Accion: Dibuja los elementos iniciales del juego, tales como el         =
;=         marcador, el laberinto y los nombres de los pokemon.            =
;===========================================================================
	PUSH AX BX CX DI SI	; Guarda los registros en la pila
	XOR DI, DI		; Inicializa DI
	XOR BX, BX		; Inicializa BX
	
	MOV CX, 400		; caracteres del marcador 80*5=400
	MOV AH, TextoBlanco	; Mueve a AH el color blanco
DbMarc: MOV AL, Marcador[BX]	; Mueve a AL un caracter del marcador
	MOV ES:[DI], AX       	; Dibuja el caracter en la pantalla
	ADD DI, 2		; Incrementa el contador de pantalla
	INC BX			; Incrementa el contador de caracter
	LOOP DbMarc

	CALL DibujaNombreJuego	; Dibuja los nombres de los pokemon
	MBW BX, indiceLaberinto	; Mueve A BX el indice del laberinto
	MOV AX, 1600		; caracteres del laberinto 80*20=1600
	MUL BX			; multiplica por indice del laberinto 
	MOV BX, AX		; el resultado es el desplazamiento parcial
	MOV CX, 1600		; caracteres del laberinto 80*20=1600
	MOV AH, TextoBlanco	; Mueve a AX el color Blanco
DbLaberinto: MOV AL, laberintos[BX] ; Mueve a AL un caracter del laberinto
	MOV ES:[DI], AX		; Dibuja el caracter en la pantalla
	ADD DI,2		; Incrementa el contador de pantalla
	INC BX			; Incrementa el contador de caracter
	LOOP DbLaberinto
	MOV DI, 800		; Inicializa DI
	MOV CX, 2		; Hay 2 bordes horizontales
DbMarc1:PUSH CX			; Guarda CX en la pila
	MOV CX, 80		; Hay 80 caracteres por linea
DbMarco:MOV ES:[DI], 0f020h	; Pinta espacios con fondo blanco
	INC DI			  ; Para corregir el conflicto margen-pared
	INC DI			; Incrementa contador
	LOOP DbMarco
	POP CX			; Restaura CX de la pila
	ADD DI, 2880		; Actualiza DI
	LOOP DbMarc1
	MOV DI, 960		; Inicializa DI
	MOV CX, 2		; Hay 2 bordes verticales
DbMarc3:PUSH CX			; Guarda CX en la pila
	MOV CX, 18		; Hay 18 caracteres por linea
DbMarc2:MOV ES:[DI], 0f020h	; Pinta espacios con fondo blanco
	ADD DI, 160	        ; Para corregir el conflicto margen-pared
	LOOP DbMarc2
	POP CX			; Restaura CX de la pila
	MOV DI, 1118		; Actualiza DI
	LOOP DbMarc3
	POP SI DI CX BX AX	; Restaura los registros de la pila
	RET
dibujarJuego ENDP

DibujaNombreJuego PROC NEAR
;===========================================================================
;= Dibujar nombres de los pokemon durante el juego                         =            
;===========================================================================
;= Entrada: Pokemon1, Pokemon2.                                            =
;= Accion: Se encarga del dibujado de los nombres de los pokemon en el     =
;= marcador de juego.						           =
;===========================================================================
	; Establece el puntero que indica la variable de la que tomar el
	; nombre del pokemon 1 en funcion de si este esta evolucionado
	MOV punteroNombre, offset nombrePokemon 
	CMPE 1,1				
	JNE nombrN1
	MOV punteroNombre, offset nombreEvolucion 
nombrN1:MOV posnombre, 160      	    ; Posicion 160 (segunda linea)
        MOVBV indiceNombre, Pokemon1.indice ; Indice del pokemon 1
        CALL dibujarNombres         	    ; Dibuja el nombre
	
	; Establece el puntero que indica la variable de la que tomar el
	; nombre del pokemon 2 en funcion de si este esta evolucionado	
        MOV punteroNombre, offset nombrePokemon
	CMPE 0,1
	JNE nombrN2
	MOV punteroNombre, offset nombreEvolucion
nombrN2:MOVBV indiceNombre, Pokemon2.indice ; Indice del pokemon 2    
        CALL PosicionarNombre   	    ; Halla la posicion del nombre 
        CALL dibujarNombres    		    ; Dibuja el nombre
	RET
DibujaNombreJuego ENDP

LimpiaNombreJuego PROC NEAR
;===========================================================================
;= Limpiar el nombre del pokemon 2 antes de redibujar                      =            
;===========================================================================
	PUSH AX CX DI		; Guarda los registros en la pila
	MOV DI, 298		; Posicion minima inicial del nombre
	XOR AX, AX		; Inicializa AX
	MOV AL, espacioLibre	; mueve a AL un espacio
	MOV CX, 11		; numero de caracteres maximo del nombre
vaciar: MOV ES:[DI], AX		; dibuja un espacio en la pantalla
	ADD DI, 2		; Incrementa el contador de pantalla
	LOOP vaciar
	POP DI CX AX		; Restaura los registros de la pila
        RET	
LimpiaNombreJuego ENDP

dibujarreloj Proc Near
;===========================================================================
;= Dibujar el Reloj y los contadores de evolucion                          =            
;===========================================================================              
        PUSH AX BX DI 		; Guarda los registros en la pila
	MOV DI, 564             ; Posicion del reloj
        MOV AH, 00h             ; Rellena AX
        MOV AL, minutos         ; Divide los minutos para 10, 
        MOV BL, 10                ; el cociente seran las decenas
        DIV BL                    ; y el resto las unidades
        XCHG AX, BX             ; mueve el resultado a bx
        MOV AL, BL              ; mueve las decenas a al 
        ADD AL, 30h             ; pasa las decenas a ASCII
        MOV AH, textoBlanco     ; mueve el color del reloj a ah
        MOV ES:[DI], AX         ; Escribe las decenas

        MOV AL, BH              ; mueve las unidades a al
        ADD AL, 30h             ; pasa las unidades a ASCII
        ADD DI, 2               ; Actualiza di con la posicion de unidades
        MOV ES:[DI], AX         ; Escribe las unidades

        MOV AL, ':'             ; mueve a al el separador
        ADD DI, 2               ; Actualiza di
        MOV ES:[DI], AX         ; Escribe el separador

        MOV AH, 00h             ; Rellena ax
        MOV AL, segundos        ; mueve a al los segundos
        MOV BL, 10              ; divide por 10, el cociente seran
        DIV BL                    ; las decenas y el resto las unidades
        XCHG AX, BX             ; mueve el resultado a bx
        MOV AL, BL              ; pasa las decenas a al
        ADD AL, 30h             ; pasa las decenas a ASCII
        MOV AH, textoBlanco     ; mueve a ah el color del reloj
        ADD DI, 2               ; Actualiza di
        MOV ES:[DI], AX         ; Escribe las decenas

        MOV AL, BH              ; mueve a al las unidades
        ADD AL, 30h             ; pasa las unidades a ASCII
        ADD DI, 2               ; actualiza di
        MOV ES:[DI], AX         ; Escribe las unidades

	MOV AH, textoAmarillo   ; Color del contador
        CMPE 1    		; Pokemon 1 evolucionado?
        JE Cont1Act
	MOV AH, 00h		; Contador en negro
Cont1Act:MOV AL, contadorEvolucion1; dise¤o del contador
        ADD AL, 30h             ; contador a ASCII
        MOV ES:[DI-72], AX      ; Pinta el contador
	MOV AH, textoAmarillo	; Color del contador
	CMPE 0			; Pokemon 2 evolucionado?
	JE Cont2Act
	MOV AH, 00h		; Contador en negro
Cont2Act:MOV AL, contadorEvolucion2; dise¤o del contador
        ADD AL, 30h             ; contador a ASCII
        MOV ES:[DI+44], AX      ; Pinta el contador
	POP DI BX AX		; Restaura los registros desde la pila
	RET   
dibujarreloj EndP

dibujarPokemon Proc Near
;===========================================================================
;= Dibujar un pokemon en el juego                                          =            
;===========================================================================        
        PUSH AX BX CX DX DI SI	; Guarda los registros en la pila
	CALL PokeCoordenadas  	; Calcula la posicion del pokemon
	
	XOR BH, BH    		; Rellena BX             
        MOV AH, pokemonColor[BX]; Color del pokemon
        AND AH, DL             	; multiplica color por mascara de estado
	SHL BX, 1		; Ajusta para indice del dise¤o
        MOV AL, pokemonDiseno[BX]; Dise¤o superior del pokemon

        MOV ES:[DI], AX         ; Pinta la parte superior
        MOV ES:2[DI], AX
        MOV AL, pokemonDiseno[BX+1]; Dise¤o inferior del pokemon
        MOV ES:160[DI], AX      ; Pinta la parte inferior
        MOV ES:162[DI], AX
	POP SI DI DX CX BX AX	; Restaura los registros des de la pila
        RET
DibujarPokemon EndP

borrarPokemon Proc Near
;===========================================================================
;= Borrar un pokemon en el juego                                           =            
;===========================================================================        
        PUSH AX BX CX DX DI SI	; Guarda los registros en la pila
	CALL CoordenadasBorrado	; Intercambia las coordenadas por las viejas
	CMP IAon, 1
	JNE BorNIA		; Si es necesario desactiva la IA
	MOV IAon, 0  		; para calcular las coordenadas de borrado
	CALL PokeCoordenadas	
	MOV Iaon, 1
	JMP BorSIA
BorNIA: CALL PokeCoordenadas	; Calcula la antigua posicion
BorSIA: CALL CoordenadasBorrado	; Deshace el cambio de coordenadas
	XOR AH, AH              ; Mueve a AH el color negro 
        MOV AL, espacioLibre    ; Mueve a AL un espacio

        MOV ES:[DI], AX   	; Pinta sobre los 4 caracteres de las 
        MOV ES:2[DI], AX	; anteriores coordenadas
        MOV ES:160[DI], AX
        MOV ES:162[DI], AX
	POP SI DI DX CX BX AX	; Restaura los registros de la pila
        RET
borrarPokemon EndP

ValidaCoordenadas PROC NEAR
;===========================================================================
;= Bloquear un pokemon si sus coordenadas superan el margen del laberinto  =
;===========================================================================
	CMP Pokemon1.NcoordX, 0	; Corrige las coordenadas no validas
	JE ValCorr
	CMP Pokemon1.NCoordX, 78
	JE ValCorr
	CMP Pokemon1.NCoordY, 5
	JE ValCorr
	CMP Pokemon1.NCoordY, 23
	JE ValCorr
	CMP Pokemon2.NcoordX, 0	
	JE ValCorr
	CMP Pokemon2.NCoordX, 78
	JE ValCorr
	CMP Pokemon2.NCoordY, 5
	JE ValCorr
	CMP Pokemon2.NCoordY, 23
	JE ValCorr
	RET
	
	; Restablece las coordenadas anteriores
ValCorr:MOVBV Pokemon1.NCoordX, Pokemon1.CoordX  
        MOVBV Pokemon1.NCoordY, Pokemon1.CoordY 
    	MOVBV Pokemon2.NCoordX, Pokemon2.CoordX
	MOVBV Pokemon2.NCoordY, Pokemon2.CoordY
	RET	
ValidaCoordenadas ENDP


bloqueo Proc Near
;===========================================================================
;= Bloquear un pokemon si se topa con un objeto                            =            
;===========================================================================
;= Este procedimiento evalua si un pokemon se ha movido sobre un objeto    =
;= determinado por la variable zonaBloqueo y restablece las anteriores     =
;= coordenadas en caso afirmativo.                                         =
;===========================================================================
	PUSH AX BX CX DX DI SI  ; Guarda los registros en la pila
     	CALL PokeCoordenadas	; Calcula la nueva posicion del pokemon
	
	MOV BL, BH       	; Bit de evolucion, para discriminar pokemon
	XOR BH, BH		; inicializa BH
	XOR DX, DX		; Inicializa DX

	MOV AX, ES:[DI] ; Cuadro primero de la nueva posicion
        CMP AL, zonaBloqueo      ; es zona de Bloqueo?
        JNE BlqPru2
	INC DX			; Incrementa contador de paredes
BlqPru2:MOV AX, ES:2[DI]        ; Cuadro segundo de la nueva posicion
        CMP AL, zonaBloqueo      ; es zona de Bloqueo?
        JNE BlqPru3
	INC DX			; Incrementa contador de paredes
BlqPru3:MOV AX, ES:160[DI]      ; Cuadro tercero de la nueva posicion
        CMP AL, zonaBloqueo      ; es zona de Bloqueo?
        JNE BlqPru4
	INC DX			; Incrementa contador de paredes
BlqPru4:MOV AX, ES:162[DI]      ; Cuadro cuarto de la nueva posicion
        CMP AL, zonaBloqueo      ; es zona de Bloqueo?
        JNE BlqPru5
	INC DX			; Incrementa contador de paredes
BlqPru5:CMP zonaBloqueo, zonaSolida ; es una pared lo q rompemos?
	JNE BlqnoP
	CMP DL, ContadorRoto[bx]; Podemos romper las paredes que abarca?
	JG BlqCorrige		; si no, corrige coordenadas
	SUB ContadorRoto[BX], DL
	POP SI DI DX CX BX AX
	RET
BlqnoP: CMP DX, 0   		; Cualquier otro objeto no se puede romper
	JNE BlqCorrige
	POP SI DI DX CX BX AX
	RET
	
	; Restablece las coordenadas anteriores
BlqCorrige: MOVBV Pokemon1.NCoordX, Pokemon1.CoordX  
        MOVBV Pokemon1.NCoordY, Pokemon1.CoordY 
    	MOVBV Pokemon2.NCoordX, Pokemon2.CoordX
	MOVBV Pokemon2.NCoordY, Pokemon2.CoordY
	POP SI DI DX CX BX AX
        RET
bloqueo EndP

bloqueoPared PROC NEAR
;===========================================================================
;= Bloquear un pokemon si se topa con una pared                            =            
;===========================================================================
	MOVBV zonaBloqueo, zonaSolida 	; Establece como bloqueo la pared
	CALL bloqueo			; LLama	al procedimiento de bloqueo
	RET
bloqueoPared ENDP

bloqueoPokemon PROC NEAR
;===========================================================================
;= Bloquear un pokemon si se topa con el otro pokemon                      =            
;===========================================================================
	PUSH BX				; Guarda BX en la pila
	MBW BX, pokemon2.indice		; Mueve a BX el indice del pokemon 2
	CMPE 3 				; Se mueve el pokemon 2?
	JNE BlqP11			
	MBW BX, pokemon1.indice		; Mueve a BX el indice del pokemon 1
BlqP11: SHL BX, 1			; Multiplica el indice por 2
	MOVBV zonaBloqueo, pokemonDiseno[BX]   ; bloqueo pokemon rival (sup)      			
	CALL bloqueo       		       ; procedimiento de bloqueo
	MOVBV zonaBloqueo, pokemonDiseno[BX+1] ; bloqueo pokemon rival (inf)
	CALL bloqueo       		       ; procedimiento de bloqueo	
	POP BX 				; Restaura BX de la pila
	RET
bloqueoPokemon ENDP

Evolucion Proc Near
;===========================================================================
;= El Pokemon evoluciona al encontrar una bola de evolucion                =            
;===========================================================================
;= Verifica si la nueva posicion del pokemon contiene una bola de evolucion=
;= y en caso afirmativo establece las variables oportunas.                 =
;===========================================================================
	PUSH AX BX CX DX DI SI	; Guarda los registros en la pila
	CALL PokeCoordenadas 	; Calcula la posicion del pokemon
	CMPE BH			; Comprueba si el pokemon esta evolucionado 
	JNE inicioEvolucion	; Si no lo esta, verifica si evoluciona
	POP SI DI DX CX BX AX	; Restaura los registros de la pila 
	RET
	
inicioEvolucion:MOV AX, ES:[DI] ; Cuadro primero de la nueva posicion
        CMP AL, BolaEvolucion   ; es una bola de evolucion?
        JE Evoluciona
        MOV AX, ES:2[DI]        ; Cuadro segundo de la nueva posicion
        CMP AL, BolaEvolucion   ; es una bola de evolucion?
        JE Evoluciona
        MOV AX, ES:160[DI]      ; Cuadro tercero de la nueva posicion
        CMP AL, BolaEvolucion   ; es una bola de evolucion?      
        JE Evoluciona
        MOV AX, ES:162[DI]      ; Cuadro cuarto de la nueva posicion
        CMP AL, BolaEvolucion   ; es una bola de evolucion?
        JE Evoluciona
	POP SI DI DX CX BX AX	; Restaura los registros de la pila
	RET
	
Evoluciona: STE 7, 0  		; Desactiva la bola de evolucion
	STE BH, 1		; Establece el bit de evolucionado
	MOV contadorSonar, 2	; Establece el contador de sonido a 2 int
        MOV nota, notaSI    	; Establece la nota a sonar FA
        JPK1 Evoluc1                         ; Evolucion del pokemon 2? 
        MOVBV contadorEvolucion2, opciones+1 ; inicializa el contador 2
	MOV Contadorroto, 2
        MOV Pokemon2.velocidad, 1     	     ; modifca la velocidad
	CALL LimpiaNombreJuego     	     ; limpia el nombre
	POP SI DI DX CX BX AX	; Restaura los registros de la pila
	RET
Evoluc1:MOVBV contadorEvolucion1, opciones+1 ; inicializa el contador 1
	MOV contadorRoto+1, 2
        MOV Pokemon1.velocidad, 1     	     ; modifica la velocidad
	POP SI DI DX CX BX AX	; Restaura los registros de la pila
	RET
Evolucion ENDP

Caza PROC NEAR
;===========================================================================
;= El Pokemon gana la partida si se topa con el rival estando evolucionado =            
;===========================================================================
;= Verifica si alguna de las casillas circundantes a la nueva posicion     =
;= contiene al pokemon rival, y si es asi, segun esten evolucionados el    =
;= juego termina.							   =
;===========================================================================
	PUSH AX BX CX DX DI SI	; Guarda los registros en la pila
	CALL PokeCoordenadas 	; Calcula la posicion del pokemon
	MBW BX, Pokemon2.indice ; Mueve a BX el indice del pokemon 2
	CMPE 3			; El pokemon 2 esta evolucionado?
	JNE Caz1
	MBW BX, Pokemon1.indice	; Mueve a BX el indice del pokemon 1
Caz1:	MOV AX, ES:[DI-160] 	; Cuadro sup izq del pokemon 
        CMP AH, PokemonColor[BX]; es el enemigo?
        JE Cazado
       	MOV AX, ES:[DI-158] 	; Cuadro sup Dcho del pokemon
        CMP AH, PokemonColor[BX]; es el enemigo? 
        JE Cazado
	MOV AX, ES:[DI-2] 	; Cuadro Izquierdo superior del pokemon
        CMP AH, PokemonColor[BX]; es el enemigo?
        JE Cazado
	MOV AX, ES:[DI+4]	; Cuadro Derecho superior del pokemon
        CMP AH, PokemonColor[BX]; es el enemigo?
        JE Cazado
	MOV AX, ES:[DI+158] 	; Cuadro izquierdo inferior del pokemon
        CMP AH, PokemonColor[BX]; es el enemigo?
        JE Cazado
	MOV AX, ES:[DI+164]  	; Cuadro derecho inferior del pokemon
        CMP AH, PokemonColor[BX]; es el enemigo?
        JE Cazado
	MOV AX, ES:[DI+320]	; Cuadro inferior izquierdo del pokemon
        CMP AH, PokemonColor[BX]; es el enemigo?
        JE Cazado
	MOV AX, ES:[DI+322] 	; Cuadro inferior derecho del pokemon
        CMP AH, PokemonColor[BX]; es el enemigo?
        JE Cazado
	POP SI DI DX CX BX AX	; Restaura los registros de la pila
	RET
	
Cazado: CMPE 1			; Pokemon 1 evolucionado?
	LAHF			; carga los flags en AH
	AND AH, 01000000b	; Aisla el ZF
	CMPE 0			; Pokemon 2 evolucionado?
	MOV AL,AH		; Mueve el ZF a AL
	LAHF			; Carga los flags en AH
	XOR AH,AL		; el bit 6=0 si ambos evolucionados o no
	AND AH, 01000000b	; Aisla el bit 6
	CMP AH, 01000000b	; Esta a 1 -> solo 1 evolucionado?
	JNE finCaza		  ; si no, vuelve al procedimiento principal
	MOV salir,1  		  ; afirmativo -> fin de partida
	MOV menuActual, 10	; Menu de Victoria
finCaza:POP SI DI DX CX BX AX	; Restaura los registros de la pila
	RET
Caza ENDP

PintarBola1 Proc Near
;===========================================================================
;= Pintar la bola de evolucion 1                                           =            
;===========================================================================        
        CMPE 7           	; Si no hay bola de evolucion vuelve
        JE inicioBola           ; a la ejecucion normal del juego
        RET
	
inicioBola:PUSH AX DX DI        ; Guarda los registros en la pila
	CMP ofsetBola1, 2000    ; Se ha generado ya la bola?
        JNE finBola
        MOV AX, Aleatorio       ; Mueve el valor aleatorio a ax y 
        ADD AX, 480             ; lo ajusta antes de establecerlo
        ADD AX, AX
        MOV DI, AX              ; di= (aleatorio+480)*2
recalcular: MOV AX, ES:[DI]	; Casilla en la que se dibujara la bola
        MOV ofsetBola1, DI      ; nuevo desplazamiento de la bola 1
        CMP AL , espacioLibre   ; es un hueco vacio?
        JNE BolanoL
	CMP AX, 0f020h		; Es el marco del laberinto?
	JNE finBola
BolanoL:ADD DI, 2		; incrementa la posicion en 1 (2 bytes)
        JMP recalcular          ; Recalcula la posicion
	
finBola:MOV DI, ofsetBola1      ; Desplazamiento de la bola
        MOV AH, textoBlanco     ; Color de bola
        MOV AL, BolaEvolucion   ; Dise¤o de la bola
        MOV DL, estadoBolas     ; mascara de estado de la bola
        AND AH, DL              
        MOV ES:[DI], AX         ; Pinta la bola
	POP DI DX AX		; Restaura los registros de la pila
        RET
PintarBola1 EndP

;***************************************************************************
;*        Procedimientos de la partida de Dos Jugadores (Calculos)         *
;***************************************************************************

inicioPartida Proc Near
;===========================================================================
;= Establece la variables para el inicio de la partida                     =            
;===========================================================================
	PUSH AX BX CX DI SI		; Guarda los registros en la pila
	CALL LimpiaNombreJuego          ; limpia el nombre
        MOV salir, 0         		; Salida a 0  
        STE 7, 1                  	; Bola de evolucion activa
        MOV OfsetBola1, 2000		; Crear nueva posicion de bola
	MOV ContadorBola1, 0		; contador para la sig. bola a 0
        MOV Pokemon1.CoordX, iniX1	; Coordenadas nuevas y antiguas
        MOV Pokemon2.CoordX, iniX2  	  ; de los pokemon -> coordenadas
        MOV Pokemon1.CoordY, iniY1 	  ; iniciales
        MOV Pokemon2.CoordY, iniY2
        MOV Pokemon1.NCoordX, iniX1
        MOV Pokemon2.NCoordX, iniX2
        MOV Pokemon1.NCoordY, iniY1
        MOV Pokemon2.NCoordY, iniY2
        MOV pokemon1.velocidad,  2	; Velocidad de los pokemon = lenta
        MOV pokemon2.velocidad,  2
        MOV segundos, 0			; variables del reloj a 0
        MOV interrupciones, 0
        MOV minutos, 0
        STE 1, 0			; Evolucion de los pokemon a 0
        STE 0, 0
        MOV estado1, 0ffh		; Visibilidad de ambos activa
        MOV estado2, 0ffh		
        MOV estadoBolas, 0h		; Visibilidad de la bola a 0
	MOV word ptr Automov,0h		; movimiento automatico a 0
	mov word ptr contadorRoto, 0	; contador de paredes por romper 0
	mov trazada, 0
	mov cx, 100			; llena buffer de IA con un valor
	XOR DI, DI			; aleatorio
	XOR SI, SI
	mov ax, aleatorio
        PUSH CX
        MOV CL, 3
        SHR AX, CL               ; Evita desbordamiento por division
        POP CX
	MOV BL, 4
	DIV BL
Lbuff:  mov IAbuffer[DI], AH
	mov word ptr Iabuffer2[SI], 0
	INC DI
	INC SI
	INC SI
	Loop Lbuff
	mov sonando, 0			; no suena la melodia
	IN AL, 61h              
        AND AL, 11111100b		;desactiva altavoz
        OUT 61h, AL	
	POP SI DI CX BX AX
        RET
inicioPartida EndP

CoordenadasBorrado PROC NEAR
;===========================================================================
;= Intercambia las coordenadas nuevas por las anteriores para el borrado   =            
;===========================================================================
;= Al borrar el pokemon en el proceso de redibujado, debe hacerlo sobre la =
;= anterior posicion del pokemon, como el calculo de la posicion se efectua=
;= con las coordenadas nuevas, este procedimiento intercambia las          =
;= coordenadas para poder efectuar el calculo.				   =
;===========================================================================
        XCHGBV Pokemon1.NCoordX, Pokemon1.CoordX   
	XCHGBV Pokemon2.NCoordX, Pokemon2.CoordX     
        XCHGBV Pokemon2.NCoordY, Pokemon2.CoordY   
	XCHGBV Pokemon1.NCoordY, Pokemon1.CoordY
	RET
CoordenadasBorrado ENDP

ActualizarCoordenadas PROC NEAR
;===========================================================================
;= Sobreescribe las antiguas coordenadas con las nuevas                    =            
;===========================================================================        
        MOVBV Pokemon1.CoordX, Pokemon1.NCoordX    
	MOVBV Pokemon2.CoordX, Pokemon2.NCoordX   
        MOVBV Pokemon2.CoordY, Pokemon2.NCoordY     
	MOVBV Pokemon1.CoordY, Pokemon1.NCoordY
	RET
ActualizarCoordenadas ENDP

PokeCoordenadas PROC NEAR
;===========================================================================
;= Calcula la posicion del pokemon y otros datos 			   =            
;===========================================================================
;= Entrada: bit 3 de estado, pokemon1, pokemon2, estado1, estado2.         =
;= Salida: DI: Posicion del pokemon en la pantalla			   =
;=         DH: Velocidad del pokemon (interrupciones de reloj para moverse)=
;=         DL: Mascara de estado del pokemon (visibilidad)                 =
;=         BH: Bit del registro de estados que indica la evolucion del pkmn=
;=         BL: Indice del pokemon (usado para color, graficos, nombre..)   =
;===========================================================================
	PUSH CX			; Guarda CX en la pila
	XOR DI, DI		; Inicializa DI
        CMPE 3			; Se mueve el pokemon 1?
	JNE PkCordY           

	CMP IAoN, 1 		; Se mueve con IA?
	JNE CoordNIA
	CMP trazada, 1		; Calculo de coordenadas de la IA
	JNE CoordNIA
	PUSH SI			; Guarda SI
	mov SI, puntoruta	; Puntero del buffer de ruta
	SHL SI, 1
	MOV DI, IABuffer2[SI]	; Mueve a DI una posicion del buffer
	PUSH DI AX		; Guarda los registros en la pila
	MOV AX, DI		
	MOV BL, 160
	DIV BL			; Divide la posicion para 160 para 
	SHR AH, 1		; Hallar las coordenadas
	MOV Pokemon2.NCoordX, AH
	MOV Pokemon2.NCoordY, AL
	POP AX DI SI CX		; restaura los registros de la pila y sigue
	JMP restoIA

CoordNIA:MBW CX, Pokemon2.NCoordY  ;  Toma la Y del Pokemon 2
        JMP BucleY

PkCordY:MBW CX, Pokemon1.NCoordY  ; Toma la Y del Pokemon 1

BucleY: ADD DI, 160            	; Suma la coordenada Y*80*2
        LOOP BucleY
	pop CX			; Restaura CX de la pila
	
        CMPE 3			; Se mueve el pokemon 2?
	JNE PkCordX               ; si no:     
        ABW DI, Pokemon2.NCoordX  ; Suma la coordenada X*2, ahora tenemos 
        ABW DI, Pokemon2.NCoordX  ; su posicion en la pantalla en DI
restoIA:MOV DH, pokemon2.velocidad; Guarda en DH su velocidad
	MOV DL, estado2  	  ; Guarda en DL la mascara de estado
	MOV BH, 0  		  ; Guarda en BH el bit de evolucion (pk2->0)
	MOV BL, Pokemon2.indice   ; Guarda en BL el indice del pokemon
        RET
PkCordX:ABW DI, Pokemon1.NCoordX  ; Sumamos la coordenada X*2, ahora tenemos
	ABW DI, Pokemon1.NCoordX  ; su posicion en la pantalla en DI
        MOV DH, pokemon1.velocidad; Guarda en DH la velocidad
	MOV DL, estado1  	  ; Guarda en DL la mascara de estado
	MOV BH, 1  		  ; Guarda en BH el bit de evolucion (pk1->1)
	MOV BL, Pokemon1.indice   ; Guarda en BL el indice del pokemon 
	RET
PokeCoordenadas ENDP

;***************************************************************************
;*                 Procedimientos Generales de Dibujado                    *
;***************************************************************************

pintaPokedex PROC NEAR
;===========================================================================
;= Pinta la vista de Pokedex de un Pokemon                                 =            
;===========================================================================
;= Entrada: indicePokedex, colorPokedex, PosPokedex.			   =
;= Accion: Dibuja la vista de pokedex (imagen 22x9) del pokemon de indice  =
;=         indicePokedex en la posicion de pantalla PosPokedex y en el     =
;=         color colorPokedex.                                             =
;===========================================================================
	PUSH AX BX CX DI	; guarda los registros en la pila	
	XOR BX, BX		; Inicializa BX
	MBW CX, indicePokedex	; Mueve a CX el indice del pokemon
BclPKdx:ADD BX, 198		; Caracteres de la vista de pokedex 22*9=198
	LOOP BclPkdx
	MOV AH, colorPokedex	; Color del pokemon
	MOV DI, PosPokedex	; Posicion donde dibujarlo
	MOV CX, 9		; Numero de lineas a dibujar
pPkdexY:PUSH CX			; Guarda CX en la pila
	MOV CX, 22		; Numero de columnas a dibujar
pPkdexX:MOV AL, pokedex[BX]	; Mueve a AL un caracter
	MOV ES:[DI], AX		; Lo dibuja por pantalla
	ADD DI, 2		; Incrementa el indice de pantalla
	INC BX			; Incrementa el indice de caracter
	LOOP pPkdexX
	ADD DI, 116		; Linea siguiente (160-22*2)
	POP CX			; Restaura CX desde la pila
	LOOP pPkdexY
	POP DI CX BX AX		;Restaura los registros de la pila
	RET
pintaPokedex ENDP

dibujarNombres Proc Near
;===========================================================================
;= Pinta el nombre de un Pokemon                                           =            
;===========================================================================
	PUSH AX BX CX DI SI     ; Guarda los registros en la pila
        XOR DI, DI              ; Inicializa DI
        XOR SI, SI              ; Inicializa SI
        XOR BX, BX		; Inicializa BX		
        XOR AX, AX		; Inicializa AX
        
        MOV BL, indiceNombre    ; Indice del pokemon 
        MOV AL, 11		; Longitud del nombre
        MUL BL			; Halla despazamiento parcial del nombre
        MOV SI, AX              ; Lo mueve a SI
        MOV AL, PokemonColor[BX]; Color del pokemon
	MOV CL, 4 	        ; mueve el color 4 posiciones a la izq
        SHL AX, CL		; para ponerlo en AH como color frente
        MOV BX, punteronombre   ; Offset de nombre de pokemon
        MOV CX, 11		; caracteres del nombre
        MOV DI, PosNombre       ; Posicion del nombre en pantalla
pintNom:MOV AL, [BX][SI]        ; caracter del nombre
        MOV ES:[DI], AX         ; Pinta el caracter
        ADD DI, 2		; incrementa el contador de pantalla
        INC SI			; incrementa el contador de caracter
        LOOP pintNom
	POP SI DI CX BX AX      ; Restaura los registros de la pila
        RET
DibujarNombres EndP

        
limpiarPantalla Proc Near
;===========================================================================
;= limpia la pantalla con espacios, color fondo negro y frente gris        =            
;===========================================================================
        XOR DI, DI		; Inicializa DI
        MOV CX, 2000            ; caracteres en la pantalla 80*25=2000 
        MOV AH, 07h             ; color de caracter en AH
        MOV AL, espacioLibre	; espacio en blanco en AL

limpia: MOV ES:[DI], AX         ; Pinta una posicion de la pantalla
        ADD DI, 2		; Incrementa DI
        LOOP limpia
        RET
limpiarPantalla EndP

;***************************************************************************
;*                 Procedimientos Generales de Calculo                     *
;***************************************************************************

PosicionarNombre Proc Near
;===========================================================================
;= Justifica el nombre de un pokemon a la derecha                          =
;===========================================================================    
;= Entrada: indicenombre, punteroNombre.				   =
;= Accion: Calcula la posicion de un nombre de pokemon para que quede      =
;=         justificado a la derecha, tambien devuelve la longitud.         =
;= Salida: Posnombre = posicion justificada, DX = longitud del nombre      =
;===========================================================================
	PUSH AX BX  		; Guarda los registros en la pila
	MOV AL, indiceNombre    ; Indice del pokemon 
        XOR AH, Ah		; Inicializa AH
        MOV BL, 11		; caracteres del nombre
        MUL BL			; calcula el desplazamiento del primer
        MOV BX, AX              ; caracter del nombre        
        XOR DX, DX              ; inicializa dx
	ADD BX, punteroNombre	; Suma el despazamiento de la variable
CntCar: MOV AL,[BX]		; Caracter del nombre
        INC DX			; incrementa DX
        INC BX			; incrementa BX
        CMP AL, espacioLibre    ; si no es un espacio
        JNE CntCar                ; miramos el siguiente caracter

        MOV AX, 322             ; posicion  tras ultimo caracter del nombre
        SUB AX, DX		; restamos la longitud del nombre*2
        SUB AX, DX
        MOV posnombre, AX	; posicion justificada a AX
	POP BX AX		; Restaura los registros de la pila
        RET
PosicionarNombre EndP

GeneraAleatorio Proc Near
;===========================================================================
;= Generador de numeros aleatorios					   =
;===========================================================================
        PUSH AX DX		; Guarda los registros en la pila
        INC cuentaBucle         ; Incrementa el contador de bucles
        CMP cuentaBucle, 0ffffh ; Verifica no haber llegado al maximo
        JNE noReset
        MOV cuentaBucle, 0      ; En ese caso lo ponemos a 0
        
noReset:MOV AX, cuentaBucle     ; Guarda cuentabucle en AX
        XOR DX, DX		; Inicializa DX
        DIV maxAleatorio  	; Divide por el maximo aleatorio permitido
        MOV Aleatorio, DX	; el numero generado es el resto de la div.
        POP DX AX		; Restaura los registros de la pila
        RET
GeneraAleatorio EndP

CargarMelodia PROC NEAR
;===========================================================================
;= Carga la melodia en el buffer					   =
;===========================================================================
	PUSH AX BX SI		; Guarda los registros en la pila
	XOR SI, SI
	mov BX, offsetMelodia	; Desplazamiento de la melodia
masNotas:MOV AX, [BX][SI]	; Carga la nota en el buffer
	MOV bufferSonidos[SI], AX
	INC SI
	INC SI
	CMP word ptr [BX][SI], 0; nota 0? -> no hay mas notas 
	JNE masNotas
	XOR SI, SI
	mov BX, offsetDuracion
masDur: MOV AX, [BX][SI]
	MOV bufferduraciones[SI], AX ; Carga la duracion en el buffer
	INC SI
	INC SI
	CMP word ptr [BX][SI], 0     ; duracion 0 -> no hay mas duraciones
	JNE masDur

	POP SI BX AX  		; restaura los registros
	RET
CargarMelodia ENDP

AmpliaPokedex PROC NEAR
;===========================================================================
;= Carga un pokemon en la Pokedex si no estaba				   =
;===========================================================================
	PUSH AX CX DI  		; Guarda los registros en la pila
	XOR DI, DI		; Inicializa DI
	MBW CX, maxPokedex	; itera tantas veces como pokemon tenga
	MOV AL, Ampliacion	; Pokemon a a¤adir
AmPk:   INC DI
	CMP PokedexActual[DI], AL ; esta en la pokedex?
	JE AmPkfin 		; salta al final
	LOOP AmPk
	XOR DI, DI		; Inicializa DI
	INC MaxPokedex		; Amplia la pokedex
AmPk3:  INC DI
	CMP PokedexActual[DI], 20 ; Carga el pokemon en el ultimo hueco libre
	JNE AmPk3
	MOVBV PokedexActual[DI], Ampliacion
AmPkfin:POP DI CX AX		; Restaura los registros de la pila y sale
	RET
AmpliaPokedex ENDP

;***************************************************************************
;*            Procedimientos de la interrupcion de teclado                 *
;***************************************************************************

AutoMover PROC NEAR
;===========================================================================
;= Pulsacion automatica de teclas al mantenerlas			   =
;===========================================================================
	PUSH AX	BX CX DX DI	; Guarda los registros en la pila
	MOV DL, 01111111b	; Mascara qu elimina el bit PULSAR/SOLTAR 
	AND DL, AL		; Guarda en DL la tecla sin el bit
	AND AL, 10000000b	; Guarda en AL unicamente el bit
	CMP AL, 0		; Se ha pulsado la tecla?
	JE PulsaMov
	
	;Se ha soltado una tecla
	MOV CX, 2		; Ejecuta la secuencia para 2 pokemon
	XOR DI, DI		; Inicializa DI
	XOR BX, BX		; Inicializa BX
ParaGen:PUSH CX			; Guarda CX en la pila
	MOV CX, 4		; Cada pokemon usa 4 teclas para moverse
ParaAut:SI_ASIGNA teclas[BX], DL, Automov[DI], 0 ; si la tecla soltada
	INC BX 			; es nuestra tecla establece movimiento a 0
	LOOP ParaAut
	POP CX			; restaura CX de la pila
	INC DI			; Incrementa el contador de pokemon
	LOOP ParaGen
	POP DI DX CX BX AX  	; Restaura los registros de la pila
	RET
	
	;Se ha pulsado una tecla 
PulsaMov:MOV CX, 2 		; Ejecuta la secuencia para 2 pokemon
	XOR DI, DI		; Inicializa DI
	XOR BX, BX		; Inicializa BX
SgueGen:PUSH CX			; Guarda CX en la pila
	MOV CX, 4		; Cada pokemon usa 4 teclas
	MOV DH, 1		; Inicializa DH
SgueAut:SI_ASIGNA teclas[BX], DL, Automov[DI], DH ; Si la tecla pulsada es
	INC BX			; nuestra tecla establece el movimiento a DH
	INC DH			; Incrementa contador de direccion
	LOOP SgueAut
	POP CX			; restaura CX de la pila
	INC DI			; incrementa el contador de pokemon
	LOOP SgueGen
	POP DI DX CX BX AX  	; Restaura los registros de la pila
	RET
AutoMover ENDP

;***************************************************************************
;*              Procedimientos de la Interrupcion de Reloj                 *
;***************************************************************************

AutoMoverReloj PROC NEAR
;===========================================================================
;= Movimiento del pokemon en funcion del reloj   			   =
;===========================================================================
	PUSH AX BX CX DX DI SI		; Guarda los registros en la pila
	SI_ASIGNA contadorMov, 0FFh, contadorMov, 0 ; limite del contador 
	XOR AX, AX    			; Inicializa AX
	MOV AL, contadorMov		; contador en AL
	MOV BL, Pokemon1.velocidad[SI]	; velocidad del pokemon a BL
	DIV BL				; divide el contador por la velocidad
	MOV AL, AH			; mueve el resto al byte bajo de AX
	XOR AH, AH			; Inicializa el byte alto de AX
	CMP AX, 0			; Si el resto no es cero termina 
	JE Autosigue 	         	; la rutina
	POP SI DI DX CX BX AX		; Restaura los registros de la pila
	RET
	
AutoSigue: CMP DI, 1
	JNE AutoNorm
	CMP IAoN, 1			; Si esta activada la IA salta
	JE Automfin 
	
Autonorm:MOVBV mover, autoMov[DI]	; Actualiza la variable mover
	MOV CX, 2			; Dos ejes de movimiento
	XOR BX, BX			; inicializa BX
	MOV DL, 1			; inicializa DL
AutoC12:PUSH CX				; Guarda CX en la pila
	MOV AX, 1			; inicializa AX
	MOV CX, 2			; Dos direcciones en cada eje
AutoC11:CMP mover, DL			; movemos en la direccion DL?
	JNE finAC1
	PUSH AX				; Guarda AX en la pila
	DEC AX				; intervalo de AX 1,2 ->  0,1
	SHL AX, 1			; intervalo de AX 0,1 ->  0,2
	DEC AX				; intervalo de AX 0,2 -> -1,1
	ADD Pokemon1.NCoordY[BX][SI], AL; Suma a la coordenada el desplazam.
	POP AX				; restaura AX desde la pila
finAC1: INC AX				; incrementa el contador de sentido
	INC DL				; incrementa el contador de direcc.
	LOOP AutoC11
	POP CX				; Restaura CX desde la pila
	INC BX				; incrementa el contador de eje
	LOOP AutoC12
	MOV AX, 1
		
AutoMfin:PUSH DI
	CALL bloqueoPared               ; 1 - Choque con paredes 
        CALL borrarPokemon        	; 2 - Borrado del rastro
	CALL ValidaCoordenadas		; 3 - Corrige las coordenadas
	CALL bloqueoPokemon		; 4 - Choque con el rival
	CALL Evolucion	                ; 5 - Evolucion del pokemon
	CALL Caza			; 6 - Caza del rival
      	CALL ActualizarCoordenadas	; 7 - Actualiza las Coordenadas
	CALL DibujarPokemon		; 8 - Dibuja el pokemon
	CALL DibujaNombreJuego		; 9 - Dibuja el nombre del pokemon
	
	POP DI				; restaura DI
	CMP AX, 0			; Debe mover?
	JNE finNorm
	CMP DI, 1 			; Pokemon 2?
	JNE finNorm
	CMP IAoN, 1			; esta activada la IA?
	JNE finNorm
	mov IAon, 0
	CALL PokeCoordenadas		; Calcula las coordenadas
	mov IAon, 1
	mov SI, puntoRuta		; indice de ruta de la IA
	SHL SI, 1
	CMP DI, IAbuffer2[SI]	; Posicion es la posicion en el buffer?
	JNE finNorm		
	MOV AX, puntoRuta
	CMP AX, longruta	; Fin de ruta?
	JGE  AutoNR
	INC puntoRuta		; incrementa contador de ruta
	JMP finNorm
AutoNR: mov trazada, 0		; trazada a 0 para trazar nueva ruta
finNorm:POP SI DI DX CX BX AX		; Restaura los registros de la pila
	RET				
AutoMoverReloj ENDP

SuenaMelodia PROC NEAR
;===========================================================================
;= Reproduce una nota de la melodia cargada en el buffer 		   =
;===========================================================================
	PUSH AX CX DI		; Guarda los registros en la pila
	
	CMP sonando, 1		; Debe sonar una nota?
	JNE relfin
	
	XOR DI, DI    		; Inicializa DI
	MOV AL, notaActual	; Indice de la nota a sonar
	XOR AH, AH		; Inicializa AH
	MOV DI, AX		; Carga el indice en AX
	CMP bufferSonidos[DI], 0; Buffer vacio? 
	JNE nosale
	mov sonando, 0		; Finaliza la melodia
	IN AL, 61h              
        AND AL, 11111100b	;desactiva altavoz
        OUT 61h, AL
	JMP relfin
noSale: DEC bufferduraciones[DI] 	; Decrementa el contador de la nota
	CMP bufferduraciones[DI], 0	; Ha llegado a 0?
	JNE nosaltar
	INC notaActual			; Siguiente nota
	INC notaActual
nosaltar:CMP bufferSonidos[DI], notaSIL	; la nota es un silencio?
	JNE noapagar
	IN AL, 61h              
        AND AL, 11111100b		;desactiva altavoz
        OUT 61h, AL
	JMP relfin
noapagar:MOV CX, bufferSonidos[DI]	; Carga la nota del buffer
        MOV AL, CL
        OUT 42h, AL		; Envia byte bajo de la nota
        MOV AL, CH
        OUT 42h, AL		; Envia byte alto
        IN AL, 61h
        OR AL, 00000011b        ;activa el altavoz
        OUT 61h, AL
		
relfin:	POP DI CX AX   		; restaura los registros
	RET
suenamelodia ENDP

;***************************************************************************
;*              Procedimientos de gestion de ficheros			   *
;***************************************************************************
GuardaJuego PROC NEAR
;===========================================================================
;= Guarda los datos del juego en un archivo				   =
;===========================================================================
	PUSH AX BX CX DX		; Guarda los registros en la pila
	MOV CX, 2				; Hay dos opciones numericas
	XOR BX, BX				; Inicializa BX
OpcionG:MOVBV DatosAescribir[BX], Opciones[BX]	; Mueve opciones al buffer
	INC BX					; Incrementa contador
	LOOP OpcionG
	MOV CX, 8				; hay 8 teclas de juego
teclasG:MOVBV DatosAescribir[BX], teclas[BX-2]	; mueve las teclas al buffer
	INC BX					; incrementa contador
	LOOP teclasG

	MOV DX, offset NombreFichero	; Nombre de fichero a DX
	XOR CX, CX			; tipo de archivo a CX (0=normal)
        MOV AH, 3ch			; codigo de crear fichero en AH				
	INT 21h				; Interrupcion de DOS -> crea archivo
	JNC noErrG1			; Si no hay carry no hay error
	JMP noErrG3			; En caso de error aborta la creacion  
noErrG1:MOV handle, ax			; Guarda el handle en AX
	MOV CX, 10			; Mueve a CX numero de Bytes 2+8=10
	MOV AH, 40h			; codigo de escribir en fichero a AH
	MOV BX, handle	                ; handle en BX
	MOV DX, offset DatosAescribir	; mueve a DX el offset del buffer
	INT 21h       			; Interrupcion de DOS -> escribe
	JNC noErrG2			; Si no hay carry no hay error
	nop  				; En caso de error lo cerrara igual
noErrG2:MOV BX, handle			; Mueve a BX el handle
	MOV AH, 3EH			; codigo de cerrar fichero
	INT 21h				; interrupcion de DOS -> lo cierra 
	JNC noErrG3			; Si hay error saldra de la rutina
	NOP 
noErrG3:POP DX CX BX AX		; Restaura los registros desde la pila
	RET	
GuardaJuego ENDP

CargaJuego PROC NEAR
;===========================================================================
;= Carga los datos del juego desde un archivo				   =
;===========================================================================
        MOV DX, offset NombreFichero    ; Mueve a DX el nombre del fichero
        XOR AL, AL                      ; Mueve a AL el tipo de archivo 
        MOV AH, 3Dh                     ; codigo de abrir archivo
        INT 21h                         ; interrupcion de Dos -> abrir
        JNC noErrC1                     ; Si no hay carry no hay error
        JMP noErrC3                     ; error -> no carga datos
noErrC1:MOV handle, ax                  ; Guarda el handle desde AX
        MOV CX, 10                      ; numero de datos 10=8+2
        MOV AH, 3Fh                     ; codigo de leer fichero
        MOV BX, handle                  ; Handle en BX
        MOV DX, offset DatosAescribir   ; offset del buffer en DX
        INT 21h                         ; interrupcion de DOS -> leer datos
        JNC noErrC2                     ; Si no hay carry no hay error
        JMP noErrC3                     ; error -> no carga datos
noErrC2:MOV CX, 2                       ; numero de datos de opcion=2
        XOR BX, BX                      ; inicializa BX 
OpcionC:MOVBV Opciones[BX], DatosAescribir[BX] ; carga opciones del buffer
        INC BX                          ; incrementa contador 
	LOOP OpcionC
        MOV CX, 8                       ; numero de teclas=8
teclasC:MOVBV Teclas[BX-2], DatosAescribir[BX] ; carga teclas del buffer
        INC BX                          ; incrementa contador
	LOOP teclasC
        MOV BX, handle                  ; Carga el handle en BX
        MOV AH, 3EH                     ; codigo de cerrar fichero
        INT 21h                         ; interrupcion de DOS -> cerrar
        JNC noErrC3                     ; si no hay carry no hay error
        nop                             ; en caso de error no cierra fichero
noErrC3:mov offsetmelodia, offset melodiaPrincipalSon
	mov offsetduracion, offset melodiaPrincipalDur
	CALL CargarMelodia
	mov sonando, 1
	RET	
CargaJuego ENDP

;***************************************************************************
;*      Procedimientos de modificacion del vector de interrupciones        *
;***************************************************************************

EstablecerReloj Proc Near
;===========================================================================
;= Establece la interrupcion de reloj del juego                            =
;===========================================================================
        PUSH AX ES              ; Guarda los registros
        MOV AX, 0               ; Segmento 0 (interrupciones) en ES
        MOV ES, AX              

        CMP modificado_rel, 0   ; Se ha modificado la int de reloj?
        JNE finEstRel
        MOV AX, ES:[8*4]                ; Guarda la interrupcion
        MOV word ptr int_reloj, AX
        MOV AX, ES:2[8*4]
        MOV word ptr int_reloj+2, AX
        MOV modificado_rel, 1   ; interrupcion de reloj modificada a 1

finEstRel:CLI                           ; Inhibe las interrupciones
	MOV AX, nueva_int_rel
        MOV word ptr ES:[8*4], AX	; Offset del procedimiento
        MOV ES:2[8*4], CS               ; segmento en el que se encuentra
        STI                             ; Permite las interrupciones
        POP ES AX               ; Restaura los registros de la pila
        RET
establecerReloj EndP

EstablecerTeclado Proc Near
;===========================================================================
;= Establece la interrupcion de teclado                                    =
;===========================================================================
        PUSH AX ES              ; Guarda los registros en la pila
        MOV AX, 0               ; Segmento 0 (interrupciones) en ES
        MOV ES, AX
        
        CMP modificado_tec, 0   ; Interrupcion ya modificada? 
        JNE finEstTec           
        MOV AX, ES:[9*4]        ; Guarda la interrupcion
        MOV word ptr int_tec, AX
        MOV AX, ES:2[9*4]
        MOV word ptr int_tec+2, AX
        MOV modificado_tec, 1   ; interrupcion modificada=1

finEStTec:CLI                   ; Inhibe las interrupciones
        MOV AX, nueva_int_tec
        MOV word ptr ES:[9*4],AX; Offset de nuestra interrupcion
        MOV ES:2[9*4], CS       ; Segmento en el que se encuentra
        STI                     ; Permite las interrupciones
        POP ES AX               ; Restaura los registros desde la pila
    	RET
establecerTeclado EndP

restablecerReloj Proc Near
;===========================================================================
;= Restablece la interrupcion de reloj del sistema                         =
;===========================================================================
        PUSH AX ES              ; Guarda los registros en la pila
        MOV AX, 0               ; Segmento 0 (interrupciones) en ES
        MOV ES, AX              

        CMP modificado_rel, 1   ; Interrupcion de reloj modificada?
        JE resRelj                ; en caso contrario:
        POP ES AX                 ; Restaura los registros desde la pila
        RET                       ; sale de la rutina

resRelj:MOV AX, word ptr int_reloj      
        CLI                             ; Inhibe interrupciones                       
        MOV ES:[8*4], AX                ; Interrupcion original
        MOV AX, word ptr int_reloj+2
        MOV ES:2[8*4], AX               ; segmento de la interrupcion original
        STI                             ; Permite interrupciones
        POP ES AX                       ; restaura los registros de la pila
    	RET
restablecerReloj EndP

restablecerTeclado Proc Near
;===========================================================================
;= Restablece la interrupcion de teclado del sistema                       =
;===========================================================================
        PUSH AX ES              ; Guarda los registros en la pila
        MOV AX, 0               ; Segmento 0 (interrupciones) en ES
        MOV ES, AX

        MOV AX, word ptr int_tec        
        CLI                             ; Inhibe interrupciones
        MOV ES:[9*4], AX                ; Offset de la interrupcion original
        MOV AX, word ptr int_tec+2      
        MOV ES:2[9*4], AX               ; segmento de la interrupcion orig.
        STI                             ; Permite interrupciones
        POP ES AX                       ; restaura los registros de la pila
    	RET
restablecerTeclado EndP

;***************************************************************************
;*      Procedimientos de Gestion de IA (todavia inestable)                *
;***************************************************************************

TrazaRuta PROC NEAR
;===========================================================================
;= Traza una ruta hacia la pokeball.                                       =
;===========================================================================
;= Este pokemon trazara una ruta hasta la pokeball si la encuentra antes de=
;= procesar 60000 posiciones distintas, corregir 40131 meandros (curvas    =
;= innecesarias de la ruta o hallar una ruta de longitud 1000 libre. En    =
;= cualquiera de los anteriores casos el pokemon seguira la ruta trazada   =
;= y elaborara un nuevo calculo al alcanzar el final de esta. El pokemon   =
;= seguira una trayectoria que rodee los obstaculos que encuentre a su paso=
;= como lo haria un ser humano en un laberinto real, pero al margen de la  =
;= bola de evolucion, prioritaria en caso de ser encontrada, no hay ningun =
;= otro factor que permita al pokemon discriminar una ruta u otra, y,      =
;= puesto que el buffer de rutas esta sujeto a continua modificacion,      =
;= existe la posibilidad de que el pokemon siga diferentes rutas partiendo =
;= de un mismo punto.    						   =
;= Debido al tiempo de proceso de esta rutina ( de incluso 10 segundos) se =
;= muestra un marcador de proceso mientras se esta ejecutando como se¤al de=
;= que se esta procesando la informacion y no se ha producido un fallo  del=
;= programa.								   =
;===========================================================================

	PUSH AX BX CX DX DI SI	; Guarda los registros en la pila
	mov pasos,0		; Inicializa contador de pasos

	STE 3, 1		; Emplea el pokemon 2

	mov IAon, 0		; Desactiva momentaneamente la IA para
 	CALL PokeCoordenadas	; Calcular las coordenadas iniciales
	mov IAon, 1

	MOV IABuffer2, DI 	; Guarda la posicion inicial en el buffer

	MOV AH, textoBlanco	; Borra el pokemon (estorba para el calculo)
	MOV AL, espaciolibre
	MOV ES:[DI], AX
	MOV ES:2[DI], AX
	MOV ES:162[DI], AX
	MOV ES:160[DI], AX

	XOR DI, DI      	; Inicializa DI SI y DX
	XOR SI, SI
	XOR DX, DX

TRpbuff:MOV AX, IABuffer2[SI]	; Posicion actual de ruta en AX
	MOV IABuffer2[SI+2], AX	; la copia a la siguiente posicion de ruta
	MOV AL, IABuffer[DI]	; Movimiento a efectuar en AL
	CMP AL, 0		; Mueve a la izquierda?
	JNE TRB1
		INC IABuffer2[SI+2]
		INC IABuffer2[SI+2]
TRB1:	CMP AL, 1		; Mueve hacia arriba?
	JNE TRB2
		ADD IABuffer2[SI+2], -160
TRB2:	CMP AL, 2		; Mueve a la izquierda?
	JNE TRB3
		DEC IABuffer2[SI+2]
		DEC IABuffer2[SI+2]
TRB3:	CMP AL, 3		; Mueve hacia abajo?
	JNE TRB4
		ADD IABuffer2[SI+2], 160

TRB4:   MOV BX, SI		; contador de buffer 2 en BX
	MOV SI, IAbuffer2[SI+2]	; Posicion calculada de ruta en DI
	MOV AX, ES:[SI] 	; Primer punto de la posicion
	CMP AL, zonaSolida	; es pared?
	JFE TRnRut
	CMP AH, 0f0h		; es margen?
	JFE TRnRut
	MOV AX, ES:2[SI]	; Segundo punto de la posicion
	CMP AL, zonaSolida	; es pared?
	JFE TRnRut
	CMP AH, 0f0h		; es margen?
	JFE TRnRut
	MOV AX, ES:160[SI]	; tercer punto de la posicion
	CMP AL, zonaSolida	; es pared?
	JFE TRnRut
	CMP AH, 0f0h		; es margen?
	JFE TRnRut
	MOV AX, ES:162[SI]	; cuarto punto de la posicion
	CMP AL, zonaSolida	; es pared?
	JFE TRnRut
	CMP AH, 0f0h		; es margen?
	JFE TRnRut
	
	MOV SI, BX		; Restaura el contador de Buffer2 desde BX
	MOV AX, IAbuffer2[SI+2]	; Posicion calculada en AX
	MOV CX, SI		; posiciones calculadas en CX
	INC CX
TRhrut: CMP AX, IAbuffer2[SI]	;Compara la posicion con la ruta 
	JFE TrnRut		; Duplicados? corrige
	DEC SI			; decrementa contador
	DEC SI
	LOOP trhrut
	CMP IAbuffer[DI], 0	; Mueve Izquierda o Derecha?
	JE Ajustes2
	CMP IAbuffer[DI], 2
	JE Ajustes2
	
	DEC AX			; Sino, corrige meandros laterales
	DEC AX			; Meandro derecha:
	MOV SI, BX
	MOV CX, BX
	INC CX
TRhrut2:CMP AX, IAbuffer2[SI]	; Compara posiciones de ruta con corregida
	JNE TRincSi
	INC AX			; corrige de nuevo
	INC AX
	MOV IAbuffer2[SI+2], AX	; Acorta el camino
	MOV DI, SI
	SHR DI, 1
	INC DX
	JMP TRrecM		; salta a finalizar correccion
TRincSi:DEC SI
	DEC SI
	LOOP trhrut2

	INC AX			; Lo mismo para meandros a la izquierda
	INC AX
	INC AX
	INC AX
	MOV SI, BX
	MOV CX, BX
	INC CX
TRhrut3:CMP AX, IAbuffer2[SI]
	JNE TRincS2
	DEC AX
	DEC AX
	MOV IAbuffer2[SI+2], AX
	MOV DI, SI
	SHR DI, 1
	INC DX
	JMP TRrecM
TRincS2:DEC SI
	DEC SI
	LOOP trhrut3
	JMP finAjust
	
	
Ajustes2:ADD AX, -160    	; Corrige los meandros horizontales
	MOV SI, BX		; Arriba:
	MOV CX, BX
	INC CX
TRhrut4:CMP AX, IAbuffer2[SI]
	JNE TRincS3
	ADD AX, 160
	MOV IAbuffer2[SI+2], AX
	MOV DI, SI
	SHR DI, 1
	INC DX
	JMP TRrecM
TRincS3:DEC SI
	DEC SI
	LOOP trhrut4
	
	ADD AX, 320		; Corrige meandro debajo
	MOV SI, BX
	MOV CX, BX
	INC CX
TRhrut5:CMP AX, IAbuffer2[SI]
	JNE TRincS4
	ADD AX, -160
	MOV IAbuffer2[SI+2], AX
	MOV DI, SI
	SHR DI, 1
	INC DX
	JMP TRrecM
TRincS4:DEC SI
	DEC SI
	LOOP trhrut5
finAjust:MOV SI, BX
	
TrRecM: MOV BX, SI
	MOV SI, IAbuffer2[SI+2]	; Ha encontrado una bola de evolucion?
	MOV AX, ES:[SI]
	CMP AL, bolaEvolucion
	JE finRuta		; termina el trazado
	MOV SI, BX
	
	INC SI			; Incrementa contadores
	INC SI
	INC DI
	CMP DX, 40131		; Ha corregido 40131 meandros?
	JE finRuta
	CMP DI, 1000		; Ruta de longitud 1000
	JE finRuta
	JMP TRpbuff

TRnRut: MOV SI, BX  		;Muestra el marcador de carga 
	MOV CX, 13
	MOV AH, 0eh
	PUSH DI	SI
	XOR DI, DI
	XOR SI, SI
muestrP:MOV AL, IAcarga[DI]
	MOV ES:10[SI], AX
	INC DI
	INC SI
	INC SI
	LOOP muestrP
	POP SI DI
	
	INC pasos
	CMP pasos, 60000	; Ha probado 60000 posiciones?
	JE finruta
	INC IAbuffer[DI]        ; Corrige ruta para nuevo intento.
	CMP IAbuffer[DI], 4
	JNE TRpL
	MOV IAbuffer[DI],0
	CMP DI, 0
	JE finRuta
	DEC DI
	DEC SI
	DEC SI
TrPl:   JMP TRpbuff

finRuta:MOV LongRuta, DI	; Guarda longitud de ruta
finTraz:POP SI DI DX CX BX AX	; Restaura los registros de la pila
	RET
Trazaruta ENDP

IAsimple PROC NEAR
;===========================================================================
;= Gestion general de la IA	                                           =
;===========================================================================
	PUSH AX BX CX DX DI SI	; Guarda los registros en la pila
	CMP trazada, 1       	; Se ha trazado ya una ruta?
	JE notrace
	CALL TrazaRuta		; Traza la ruta
	MOV puntoRuta, 0	; Inicializa contador de ruta
	mov trazada, 1		; Establece ruta trazada
	MOV CX, 13		; Oculta el marcador de proceso de ruta
	MOV AH, 0fh
	XOR DI, DI
ocultaP:MOV AL, espaciolibre 
	MOV ES:10[DI], AX
	INC DI
	INC DI
	LOOP ocultaP
notrace:POP SI DI DX CX BX AX  	; Restaura los registros y sale
	RET
IASimple ENDP

; ******* Fin del codigo - Autores: Joaquin Perez y Eduard Porta ******** ;
End pokemon
