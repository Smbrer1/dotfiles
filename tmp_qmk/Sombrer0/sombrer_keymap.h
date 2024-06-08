#pragma once

#include QMK_KEYBOARD_H

bool colemak_layot_on = true;

enum layer_number {
  _COLEMAK = 0,
  _QWERTY,
  _SYM,
  _NAV,
  _MOUSE,
  _GAMING,
};

//CUSTOM KEYS
#define TG_GMG TG(_GAMING)



// qwerty
// Left-hand home row mods
#define LGUIA LGUI_T(KC_A)
#define LALTS LALT_T(KC_S)
#define LCTLD LCTL_T(KC_D)
#define LSFTF LSFT_T(KC_F)

// Right-hand home row mods
#define RGUICLN RGUI_T(KC_SCLN)
#define RALTL LALT_T(KC_L)
#define RCTLK RCTL_T(KC_K)
#define RSFTJ RSFT_T(KC_J)


// colemak
// Left-hand home row mods
#define HOME_A LGUI_T(KC_A)
#define HOME_R LALT_T(KC_R)
#define HOME_S LCTL_T(KC_S)
#define HOME_T LSFT_T(KC_T)

// Right-hand home row mods
#define HOME_O RGUI_T(KC_O)
#define HOME_I LALT_T(KC_I)
#define HOME_E RCTL_T(KC_E)
#define HOME_N RSFT_T(KC_N)

// layers
#define SYM_ENT LT(_SYM, KC_ENT)
#define NAV_TAB LT(_NAV, KC_TAB)

