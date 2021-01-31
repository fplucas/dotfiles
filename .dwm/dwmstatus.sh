dbox() {
  echo -e "$(dropbox-cli status)"
}

disk() {
  available="$(df -h /home | awk 'NR==2 {print $4}')"
  echo -e "$available free"
}

battery(){
  BATT=$( acpi -b | sed 's/.*[charging|unknown], \([0-9]*\)%.*/\1/gi' )
  STATUS=$( acpi -a | awk '{print $3}' )
  echo -e "$BATT% $STATUS"
}

volume(){
  VOLUM=$(amixer sget Master | awk 'NR==5 {print $4}')
  STAT=$(amixer sget Master | awk 'NR==5 {print $6}')
  echo -e "$VOLUM $STAT"
}

dte() {
  echo -e "$(date +%a\ %d\ %b\ %Y\ %H:%M)"
}

while true; do
  xsetroot -name "$(dbox) | $(disk) | vol $(volume) | $(battery) | $(dte)"
  sleep 1s
done &

