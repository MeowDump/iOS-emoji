# Apple Emoji Module

A `Magisk` / `KernelSU` / `Apatch` module that replaces the default Android/OEM emoji font with Apple's emoji set, giving your Android device an Apple-style emoji experience across supported apps.

> **Note:** Emoji rendering can vary between apps, Android versions, and keyboards. Some applications may use their own emoji assets and may not be affected by this module.

## Requirements & Installation instructions

- If you already have installed [Mountify](https://github.com/backslashxx/mountify/releases) then simply install the iOS-emoji module and reboot your device
- If you have not installed [Mountify](https://github.com/backslashxx/mountify/releases) yet, then install the iOS-emoji module first, after that, install [Mountify](https://github.com/backslashxx/mountify/releases) and reboot your device

## Compatibility & Notes

* Not every application uses the system emoji font.
* Apps that bundle their own emoji assets may continue displaying their original emojis.
* Emoji appearance may differ slightly depending on Android's font-rendering system.
* This module does **not** turn Android into iOS; it only changes the emoji font/rendering where supported.

## Credits & Acknowledgements

* The emoji font was ported from [Project Infinity-X](https://github.com/projectinfinity-x).
* Some references from [Magisk-iOS-Emoji](https://github.com/Keinta15/Magisk-iOS-Emoji) were used to resolve implementation issues encountered during development.

Full credit goes to the respective projects and their contributors for their work and resources.

## Disclaimer

This module is provided **as-is**, without any guarantee that it will work on every device or Android version.

Modifying system fonts can cause unexpected behavior on some devices. Make sure you have a way to recover your device before installing any system-level modification.
