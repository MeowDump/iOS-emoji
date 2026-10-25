# Apple Emoji Module

A Magisk / KernelSU / APatch module that replaces Android's default emoji font with Apple's emojis.

> **Note:** Some apps use their own emoji fonts, so the changes may not apply everywhere.

## Requirements & Installation

**Mountify is required.** Without it, this module will not work.

1. Install the [iOS Emoji module](https://github.com/MeowDump/iOS-emoji/releases).
2. If Mountify is not installed, install it from [here](https://github.com/backslashxx/mountify/releases).
3. **Reboot your device immediately** after installation.

### Notes

- **Temporary lag:** Your ROM may feel laggy during installation. This should return to normal after reboot.
- **Reboot required:** Only install this module when you're ready to reboot immediately. If you're the kind of person who flashes a module and scrolls Reels for hours, only to remember the reboot while charging your phone, **don't install this module until you're ready to restart.**
- **System partition space:** Ensure your system partition has at least **100 MB of free space** before installation. Insufficient space may cause a bootloop because the module needs room to copy its files. If your ROM doesn't provide enough space, blame your ROM maintainer.
- This module changes emojis only; it does not turn Android into iOS.


## Preview
<p align="center">
  <a href="https://github.com/MeowDump/iOS-emoji/stargazers">
    <img src="https://m3-markdown-badges.vercel.app/stars/7/1/MeowDump/iOS-emoji" alt="GitHub Stars" />
  </a>
  <br />
  <a href="https://github.com/MeowDump/iOS-emoji/releases">
    <img src="https://img.shields.io/github/downloads/MeowDump/iOS-emoji/total?label=Downloads%20%28excluding%20telegram%20release%29&color=%23ff1493&style=flat" alt="Downloads" />
  </a>
</p>

<div align="center">
  <img src="https://github.com/MeowDump/iOS-emoji/blob/main/assets/Screenshot.png" width="500" alt="Emoji Preview" />
</div>

<div align="center">
  <a href="https://github.com/MeowDump/iOS-emoji/releases" target="_blank">
    <img src="https://raw.githubusercontent.com/MeowDump/Integrity-Box/main/assets/new/BUTTON-Download.png" alt="Download" width="400" />
  </a>
</div>

## Disclaimer

_This module is provided **as-is**, without guarantees of compatibility with every device or Android version. System modifications can cause unexpected issues, including bootloops. Disabling mountify will automatically revert all changes._


#### Credits
> Credit goes to the respective projects and their contributors.
- Emoji font ported from [Project Infinity-X](https://github.com/projectinfinity-x).
- Implementation references from [Magisk-iOS-Emoji](https://github.com/Keinta15/Magisk-iOS-Emoji).
