LTO_ENABLE = yes            # Link Time Optimization enabled
EXTRAKEY_ENABLE = yes        # Audio control and System control
MOUSEKEY_ENABLE = yes
OLED_ENABLE = no           # OLED display

KEY_OVERRIDE_ENABLE = yes
CAPS_WORD_ENABLE = yes
SRC += features/select_word.c
SRC += oled/lily_logo.c
SRC += oled/custom_logo.c
