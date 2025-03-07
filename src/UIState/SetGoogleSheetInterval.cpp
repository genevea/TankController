/**
 * SetGoogleSheetInterval.cpp
 */

#include "SetGoogleSheetInterval.h"

#include "Devices/EEPROM_TC.h"
#include "Devices/LiquidCrystal_TC.h"

void SetGoogleSheetInterval::setValue(double value) {
  EEPROM_TC::instance()->setGoogleSheetInterval((int)value);

  char output[17];
  snprintf(output, sizeof(output), "New interval=%i", (int)value);
  LiquidCrystal_TC::instance()->writeLine(output, 1);
  returnToMainMenu(1000);  // after 1-second delay
}
