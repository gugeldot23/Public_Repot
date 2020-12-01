#include "DigiKeyboard.h"
#include <avr/pgmspace.h>
#define GetPsz( x ) (strcpy_P(buffer, (char*)x))
char buffer[76]; //as long as longest string + 1 for null


int rest_time_betw_actions = 1000; //Set here the time you want between all commands

//DONE for WINDOWS
//LIST OF IMPORTANT STRINGS
//used to save long strings on Flash memmory instead of SRAM
//this is becuause of the large space strings occupie ,they are stored in flash memory instead on SRAM for preventing it from crahsing
//HERE YOU PUT THE STRINGS OF THE COMMANDS YOU WANT TO RUN
const char line1[] PROGMEM = "Set/WinUserLanguageList /LanguageList en/US /Force"; 
const char line2[] PROGMEM = "Set-WinUserLanguageList -LanguageList es-ES -Force";
const char line3[] PROGMEM = "Clear/History";
const char line4[] PROGMEM = "exit";
const char line5[] PROGMEM = "Copy-Item -Path './";
const char line6[] PROGMEM = "' -Recurse -Destination 'E:/Copy/' -Container";
const char line8[] PROGMEM = "Start-Process -WindowStyle hidden -FilePath python E:/python_PROGRAM "; //Start any program hidden, replace PROGRAM with your file 


//MODULES -------------------
//LAYOUT
void Layout_Change_ES_to_US_BEGINING () {
  printText_WITH_ENTER( GetPsz (line1) );                                                                   // STRING1 ENTER
  DigiKeyboard.delay(rest_time_betw_actions);
}
void Layout_Change_ES_to_US_END () {
  printText_WITH_ENTER( GetPsz (line2) );                                                                   // STRING2 ENTER
  DigiKeyboard.delay(rest_time_betw_actions);
}
//------------------------

//CLEANING
void Clear_History() {       //AFTER CHANGING LAGUAGE WATCH OUT WITH SYMBOLS
  printText_WITH_ENTER( GetPsz (line3) );                                                                   // STRING3 ENTER
}
void Clean() { //Close powershell or cmd window
  DigiKeyboard.sendKeyStroke(KEY_L, MOD_CONTROL_LEFT);
  printText_WITH_ENTER( GetPsz (line4) );                                                                   // STRING4 ENTER
}
//------------------------

//    STRING ADDRESSING MODULES --- UNMODIFIABLE
void digiReset() {
  DigiKeyboard.sendKeyStroke(0, 0);
  DigiKeyboard.delay(50);
}
void printText_WITH_ENTER( char * txt ) {
  int l = strlen(txt);
  for (int i = 0; i < l; i++) {
    DigiKeyboard.print( txt[i] );
  }
  DigiKeyboard.sendKeyStroke( KEY_ENTER);
}                                                  
void printText_NO_ENTER( char * txt ) {
  int l = strlen(txt);
  for (int i = 0; i < l; i++) {
    DigiKeyboard.print( txt[i] );
  }}
//------------------------

//ADDITIONAL MODULES
void CopyDirectories(String directory) {
  printText_NO_ENTER( GetPsz (line5) );                                      // STRING5 NOENTER
  DigiKeyboard.print(directory);
  printText_WITH_ENTER( GetPsz (line6) );                                    // STRING6 ENTER
  DigiKeyboard.delay(rest_time_betw_actions);
   //CopyDirectories("Desktop"); FOR EXAMPLE
}

//EXCUTING PROGRAMS-----------------
void adminpermissions(String program) { // USING RIGHTCTRL+RIGHTSHIFT+ENTER CAN EXECUTE ON ADMIN MODE SOMETHING
  DigiKeyboard.sendKeyStroke(0, MOD_GUI_LEFT); //HAS TO PUT 0 IN ORDER TO USE WINDOWS KEY AND NOT PRESSING ANYTHING ELSE
  DigiKeyboard.delay( 100 );
  DigiKeyboard.print(program);               
  DigiKeyboard.delay( rest_time_betw_actions );
  DigiKeyboard.sendKeyStroke( KEY_ENTER, MOD_CONTROL_RIGHT | MOD_SHIFT_RIGHT );
  DigiKeyboard.delay(rest_time_betw_actions);
  DigiKeyboard.delay( rest_time_betw_actions );
  DigiKeyboard.sendKeyStroke( KEY_ARROW_LEFT );
  DigiKeyboard.delay( rest_time_betw_actions );
  DigiKeyboard.sendKeyStroke( KEY_ENTER );
  DigiKeyboard.delay( rest_time_betw_actions );
}

void Call_WIN_Execute(String command) { 
  // DigiKeyboard.sendKeyStroke(KEY_D, MOD_GUI_LEFT); //clear the screen for avoiding problems OPTIONAL
  // DigiKeyboard.delay(rest_time_betw_actions);      //OPTIONAL
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  DigiKeyboard.delay(rest_time_betw_actions);
  DigiKeyboard.println(command);
  DigiKeyboard.delay(rest_time_betw_actions);
  //Call_WIN_Execute ("Powershell"); //for example execute program normally 
}

//------------------------


void setup() {
  digiReset();
}
void loop() {
  //TIP : first key, then hotkey
  DigiKeyboard.delay(3000); // Some free time to avoid errors, RECOMMENDED NOT TO DELETE //DELAY in milisec
  
  adminpermissions("Powershell"); //execute program in admin mode
  Layout_Change_ES_to_US_BEGINING ();

  //GUTS
 
  Layout_Change_ES_to_US_END (); //RECONFIGURE TO ES LAYOUT
  Clear_History();
  Clean();
  DigiKeyboard.delay(999999); // END
}
