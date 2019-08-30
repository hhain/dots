#!/bin/bash
# standard state is disabled!
# enabled and disconnect is used synonymously
bt_state=" "
bt_disabled=" "
bt_enabled=" "
bt_connected=" "




cat /proc/acpi/ibm/bluetooth | awk '{ print $2 }' | rg -q enabled
if [ $? -eq 0 ]; then
  bt_state=$bt_enabled

  bluetoothctl devices | awk '{ print $2 }' | xargs -L1 bluetoothctl info | rg Connected | rg -q yes
  if [ $? -eq 0 ]; then
    bt_state=$bt_connected
  fi
else
  bt_state=$bt_disabled
fi

echo -e $bt_state
