#!/bin/bash
if zenity --question --default-cancel --title="$1" --icon-name="edit-delete-symbolic" --window-icon="/usr/share/icons/Faba/16x16/actions/edit-delete.svg"; then
	(for path in "$@"
    do
        bleachbit --shred "$path";
	done) | zenity --progress --pulsate --auto-close
else
	exit 0;
fi
