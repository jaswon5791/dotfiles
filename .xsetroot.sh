INTERFACE="wlp1s0"
SSID=$(iw dev "$INTERFACE" link | grep SSID | sed 's/.*: //')
TIME=$(date +"(%a) %b %e, %Y %I:%M %p")
BATT_PERC=$(acpi | sed 's/.*, \([0-9]\+\)%.*/\1/')
BATT_STATE=$(acpi | sed 's/.*: \([a-zA-Z]\+\).*/\1/')
WIFI=$(awk '/'$INTERFACE'/ {printf("%2.0f", $3 / 70 * 100);}' /proc/net/wireless)
VOLUME=$(amixer sget Master | grep % | sed 's/%.*//;s/.*\[//')
MUTED=$(amixer sget Master | grep % | sed 's/.*\[//;s/\]//' | grep on)

if [ $WIFI -gt 66 ]; then
  WIFI_SYM=$'\U00e21a'
elif [ $WIFI -gt 33 ]; then
  WIFI_SYM=$'\U00e219'
else
  WIFI_SYM=$'\U00e218'
fi

if [ $BATT_STATE == 'Full' ]; then
  BATT_SYM=$'\U00e200'
elif [ $BATT_STATE == 'Discharging' ]; then
  if [ $BATT_PERC -gt 50 ]; then
    BATT_SYM=$'\U00e1ff'
  else
    BATT_SYM=$'\U00e1fe'
  fi
elif [ $BATT_STATE == 'Charging' ]; then
  BATT_SYM=$'\U00e201'
else
  BATT_SYM=$'\U00e211'
fi

if $MUTED; then
  VOL_SYM=$'\U00e202'
else
  VOL_SYM=$'\U00e203'
fi

xsetroot -name " [ $WIFI_SYM $SSID ] [ $VOL_SYM $VOLUME ] [ $BATT_SYM $BATT_PERC ] [ $TIME ]"
