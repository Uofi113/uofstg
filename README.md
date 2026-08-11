<div align="center">

# 📞 UofsTg
**The uncompromising, hyper-skeuomorphic Telegram client for iOS 6.**

[![Platform](https://img.shields.io/badge/Platform-iOS%206.0+-2A2A2A?style=for-the-badge&logo=apple&logoColor=white)](#)
[![Design](https://img.shields.io/badge/Design-Skeuomorphic-FF9900?style=for-the-badge)](#)
[![Build](https://img.shields.io/badge/Build-GitHub%20Actions-238636?style=for-the-badge&logo=githubactions&logoColor=white)](#)
[![License](https://img.shields.io/badge/License-GPL_v2.0-lightgrey?style=for-the-badge)](#)

<br>
<i>"We took one look at the sterile, lifeless flat design of modern apps and violently ripped it out."</i>
</div>

<br>

## 💎 The Manifesto

**UofsTg** isn't just another unofficial client. It's a time machine for your legacy device. Built on the bones of [Twelve](https://github.com/theanazerka/twelve-project), we forced an **unapologetic, heavy-gloss, texture-rich skeuomorphic aesthetic** straight into the codebase. 

Deep shadows, glass reflections, and realistic physical buttons — exactly how apps were always supposed to look before UI design went to shit in 2013. 

Pure 2012 vibes. Perfected by Uofist.

---

## ⚠️ Reality Check

<details open>
<summary><b>Listen up before you install (Click to collapse)</b></summary>
<br>

> **UofsTg is a miracle of software necromancy running on a 2012 operating system.**

Because it relies on a legacy codebase, some modern Telegram bloatware (like premium animated reactions, obscure media formats, or new chat gimmicks) might be unstable, render weirdly, or just straight up not exist.

**We are here for the ultimate skeuomorphic aesthetic and core messaging, not for flying emojis. You've been warned.**
</details>

---

## 🛠 Compiling the Beast

To compile the project from source, you need a macOS/Linux environment equipped with the [Theos](https://github.com/theos/theos) toolchain and an **iOS 6.0 SDK**.

### 💻 Local Build

> **Step 1:** Clone the repository with all submodules.
```bash
git clone --recursive https://github.com/Uofi113/uofstg.git
cd uofstg
```

> **Step 2:** Build the package.
```bash
cd theos/Twelvium
make package
```
*Boom. Your `.deb` artifact is waiting in `theos/Twelvium/packages`.*

### ☁️ Automated Build (GitHub Actions)

Don't want to get your hands dirty in the terminal? The CI/CD pipeline does the heavy lifting for you.

1. Go to the <kbd>[Actions](../../actions)</kbd> tab.
2. Click the latest successful workflow run.
3. Grab your pre-compiled `.deb` artifact.

---

## 📦 Installation

Installing on a jailbroken iOS 6 device is straightforward. Choose your weapon:

| Method | Instructions |
| :--- | :--- |
| 📱 **iFile / Filza** | Transfer the `.deb` file to your device, tap it, hit **Install**. Respring and enjoy. |
| 💻 **SSH** | Run `dpkg -i name_of_package.deb` via terminal on your device. |

---

## 📜 License & Credits

Distributed under the **[GNU General Public License v2.0 or later](LICENSE)**.

| Role | Contributor |
| :--- | :--- |
| 👑 **UI/UX & Skeuomorphism** | **Copyright © 2026 Uofist** |
| 🏗 **Base Project (Twelve)** | Based on code by **theanazerka** |

<br>
<div align="center">
  <b>Make iOS 6 Great Again 📱</b>
  <br><br>
  <img src="https://img.shields.io/github/stars/Uofi113/uofstg?style=social" alt="Stars">
</div>
