#include <Arduino.h>
#include <ArduinoUnitTests.h>

#include "Devices/LiquidCrystal_TC.h"
#include "EEPROM_TC.h"
#include "Keypad_TC.h"
#include "SetKP.h"
#include "TankControllerLib.h"

unittest(test) {
  TankControllerLib* tc = TankControllerLib::instance();
  SetKP* test = new SetKP(tc);
  tc->setNextState(test, true);
  // setValue
  test->setValue(12345.5);
  assertEqual(12345.5, EEPROM_TC::instance()->getKP());
  // during the delay we showed the new value
  std::vector<String> lines = LiquidCrystal_TC::instance()->getLines();
  assertEqual("New KP=12345.5  ", lines[1]);
  assertEqual("SetKP", tc->stateName());
  // Return to mainMenu
  Keypad_TC::instance()->_getPuppet()->push_back('D');
  tc->loop();
  assertEqual("MainMenu", tc->stateName());
}

unittest_main()
