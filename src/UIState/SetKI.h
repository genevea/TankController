/**
 * SetKI.h
 *
 * Set the KI for the PID
 */
#pragma once
#include "NumberCollectorState.h"

class SetKI : public NumCollectorState {
public:
  SetKI(TankControllerLib* tc) : NumCollectorState(tc) {
  }
  const char* name() {
    return "SetKI";
  }
  float getCurrentValue() {
    return 0.0;
  }
  int getCurrentValuePrecision() {
    return 1;
  }
  const char* prompt() {
    return "Set KI          ";
  };
  void setValue(double value);
};
