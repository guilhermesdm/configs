current=$(brightnessctl --device="tpacpi::kbd_backlight" get);
max=$(brightnessctl --device="tpacpi::kbd_backlight" max);
next=$(( (current + 1) % (max + 1) ));
brightnessctl --device="tpacpi::kbd_backlight" set $next
