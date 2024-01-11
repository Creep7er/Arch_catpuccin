#! /bin/sh

rofi_cmd() {
	rofi -dmenu \
		-theme ~/.config/catppuccin/rofi/powermenu_fullscreen.rasi
}

chosen=$(printf "⏻\n󰜉\n󰗼" | rofi_cmd)

case "$chosen" in

# Для systemd
	"⏻") poweroff ;;
	"󰜉") reboot ;;
	"󰗼") exec i3-msg exit ;;

# Для runit
#	"⏻") sudo shutdown -h now ;;
#	"󰜉") sudo shutdown -r now ;;
#	"󰗼") bspc quit ;;
#	*) exit 1 ;;

esac
