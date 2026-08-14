## Apple Emoji Module

A `Magisk` / `KernelSU` / `Apatch` module that replaces the default Android/OEM emoji font with Apple's emoji set, giving your Android device an Apple-style emoji experience across supported apps.

> **Note:** Emoji rendering can vary between apps, Android versions, and keyboards. Some applications may use their own emoji assets and may not be affected by this module.

### Requirements & Installation Instructions

**Mountify is required for this module to work.** The **iOS Emoji** module will not work without meta-module (Mountify) installed on your device.

* **If Mountify is already installed:** Simply install the **[iOS Emoji module,](https://github.com/MeowDump/iOS-emoji/releases)** then reboot your device.

* **If Mountify is not installed:** First, install the **[iOS Emoji module.](https://github.com/MeowDump/iOS-emoji/releases)** Then, install **Mountify** and reboot your device.

**Mountify:** [Download Mountify](https://github.com/backslashxx/mountify/releases?utm_source=chatgpt.com)

___


### Compatibility & Notes

* Not every application uses the system emoji font.
* Apps that bundle their own emoji assets may continue displaying their original emojis.
* Emoji appearance may differ slightly depending on Android's font-rendering system.
* This module does **not** turn Android into iOS; it only changes the emoji font/rendering where supported.

### Preview

<p align="center">
  <a href="https://github.com/MeowDump/iOS-emoji/stargazers">
    <img 
      src="https://m3-markdown-badges.vercel.app/stars/7/1/MeowDump/iOS-emoji" 
      alt="GitHub Stars" 
    />
  </a>
  <br />
  <a href="https://github.com/MeowDump/iOS-emoji/releases">
    <img 
      src="https://img.shields.io/github/downloads/MeowDump/iOS-emoji/total?label=Downloads%20%28excluding%20telegram%20release%29&color=%23ff1493&style=flat" 
      alt="GitHub Releases" 
    />
  </a>
</p>

<div align="center">
  <img src="https://github.com/MeowDump/iOS-emoji/blob/main/assets/Screenshot.png" width="500" />
</div>


<div align="center">
  <a href="https://github.com/MeowDump/iOS-emoji/releases" target="_blank">
    <img src="https://github.com/MeowDump/MeowDump/blob/main/Assets/download.png" alt="Download Button" width="400">
  </a>
</div>

___


### Credits & Acknowledgements

* The emoji font was ported from [Project Infinity-X](https://github.com/projectinfinity-x).
* Some references from [Magisk-iOS-Emoji](https://github.com/Keinta15/Magisk-iOS-Emoji) were used to resolve implementation issues encountered during development.

Full credit goes to the respective projects and their contributors for their work and resources.

___

### Disclaimer

This module is provided **as-is**, without any guarantee that it will work on every device or Android version.

Modifying system fonts can cause unexpected behavior on some devices. Make sure you have a way to recover your device before installing any system-level modification.
