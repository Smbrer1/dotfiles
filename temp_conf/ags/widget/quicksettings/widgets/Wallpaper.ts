import { SimpleToggleButton } from "../ToggleButton"
import icons from "lib/icons"
import wallpaper from "service/wallpaper"

export const RandomWallpaper = () => SimpleToggleButton({
    icon: icons.wallpaper.random,
    label: "Wallpapers",
    toggle: () => wallpaper.random(),
    connection: [Object(), () => 1 == 1?true:false ],
})
