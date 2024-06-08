import Hyprland from 'resource:///com/github/Aylur/ags/service/hyprland.js';

import { Label } from 'resource:///com/github/Aylur/ags/widget.js';
import { exec } from 'resource:///com/github/Aylur/ags/utils.js';
import PanelButton from '../PanelButton';

const getLayout = () => {
    const devices = JSON.parse(exec('hyprctl -j devices'));
    var keyboard = devices.keyboards.find(k => k.name === 'logitech-logig-mkeyboard');
    if (keyboard === undefined)
        keyboard = devices.keyboards.find(k => k.name === 'at-translated-set-2-keyboard');
    const activeKeymap = keyboard.active_keymap;
    const layout = activeKeymap.slice(0, 2).toLowerCase();
    return layout;
};

export default () => PanelButton({
    class_name: 'keyboardlayout',
    connections: [[Hyprland, label => label.label = getLayout()]],
  });

