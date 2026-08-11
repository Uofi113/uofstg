<div align="center">

# 📞 UofsTg
**The ultimate skeuomorphic Telegram client for iOS 6**

[![Platform](https://img.shields.io/badge/Platform-iOS%206.0+-blue?style=for-the-badge&logo=apple)](#)
[![Design](https://img.shields.io/badge/Design-Skeuomorphic-orange?style=for-the-badge)](#)
[![Build](https://img.shields.io/badge/Build-GitHub%20Actions-brightgreen?style=for-the-badge&logo=githubactions)](#)
[![License](https://img.shields.io/badge/License-GPL_v2.0-lightgrey?style=for-the-badge)](#)

</div>

---

**UofsTg** is an unofficial Telegram client built specifically for legacy devices running iOS 6. It is a fork of the [Twelve](https://github.com/theanazerka/twelve-project) project, which in turn is based on the official Telegram for iOS source code. 

We completely stripped away the modern, sterile "flat" design and forced an **ultimate, glossy, textured skeuomorphic aesthetic** throughout the entire application. It looks and feels exactly how an app should have looked in 2012.

---

## ⚠️ Compatibility Warning

> **Note:** UofsTg is a work in progress.
> Because this client relies on a legacy codebase and runs on a 2012 operating system, some modern Telegram features (like reactions, specific media formats, or new chat types) may be unavailable, unstable, or render incorrectly.

---

## 🛠 Compiling UofsTg

To compile the project from source, you need a macOS/Linux environment equipped with the [Theos](https://github.com/theos/theos) toolchain and an **iOS 6.0 SDK**.

### 💻 Local Build (macOS / Linux)

**1. Clone the repository with all submodules:**
```bash
git clone --recursive https://github.com/Uofi113/uofstg.git
cd uofstg
```

**2. Build the package:**
```bash
cd theos/Twelvium
make package
```
*The compiled `.deb` file will be generated in the `theos/Twelvium/packages` directory.*

### ☁️ Automated Build (GitHub Actions)

Don't want to compile it locally? This repository is configured to automatically build the latest `.deb` package via **GitHub Actions** upon every push to the `master` or `main` branch.

*   Navigate to the **[Actions](../../actions)** tab in this repository.
*   Select the latest successful workflow run.
*   Download your ready-to-install `.deb` artifact.

---

## 📦 Installation

Installing on a jailbroken iOS 6 device is straightforward. You can install the `.deb` package using any file manager or terminal:

*   **iFile / Filza:** Transfer the `.deb` file to your device, tap on it, and select **Install**.
*   **SSH:** Transfer the file and run `dpkg -i name_of_package.deb` via terminal.

---

## 📜 License & Credits

**UofsTg** is distributed under the [GNU General Public License v2.0 or later](LICENSE), consistently with the original Telegram for iOS source code.

*   **Copyright © 2026 Uofist** — *UofsTg specific UI modifications and skeuomorphic refactoring.*
*   **Based on [Twelve](https://github.com/theanazerka/twelve-project)** by theanazerka.

<div align="center">
<i>Make iOS 6 Great Again 📱</i>
</div>
