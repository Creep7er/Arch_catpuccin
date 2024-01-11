#! /bin/sh

rofi_cmd() {
	rofi -dmenu \
		-theme ~/.config/catppuccin/rofi/powermenu.rasi
}

chosen=$(printf "⏻ poweroff\n󰜉 reboot\n󰗼 exit" | rofi_cmd)

case "$chosen" in

# Для systemd
	"⏻ poweroff") poweroff ;;
	"󰜉 reboot") reboot ;;
	"󰗼 exit") bspc quit ;;

# Для runit
#	"⏻ poweroff") sudo shutdown -h now ;;
#	"󰜉 reboot") sudo shutdown -r now ;;
#	"󰗼 exit") bspc quit ;;
#	*) exit 1 ;;

esac
