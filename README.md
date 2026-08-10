# UofsTg

UofsTg is an unofficial Telegram client for iOS 6. It is a fork of [Twelve](https://github.com/theanazerka/twelve-project), which in turn is based on the official Telegram for iOS source code. 

UofsTg brings a heavily refactored user interface that completely removes any modern "flat" design elements and forces an ultimate skeuomorphic iOS 6 style throughout the entire application.

## ⚠️ Compatibility Warning

UofsTg is a work in progress. Some modern Telegram features may be unavailable or unstable because the client is based on a legacy codebase and runs on an operating system released in 2012.

## Compiling UofsTg

To compile the project, you need an environment with the [Theos](https://github.com/theos/theos) toolchain and an iOS 6.0 SDK. 

### Local Compilation (macOS/Linux)
1. Clone this repository with submodules:
   ```bash
   git clone --recursive https://github.com/Uofi113/uofstg.git
   cd uofstg
   ```
2. Build the `.deb` package:
   ```bash
   cd theos/Twelvium
   make package
   ```
3. The compiled `.deb` will be in `theos/Twelvium/packages`.

### Automated GitHub Actions Build
This repository is configured to automatically build UofsTg using GitHub Actions upon pushing to the `master` or `main` branch. Check the **Actions** tab on your GitHub repository to download the resulting `.deb` artifact.

## Installation

You can install the `.deb` package on a jailbroken iOS 6 device using **iFile**, **Filza**, or via SSH.

## License

UofsTg is distributed under the [GNU General Public License v2.0 or later](LICENSE), consistently with the original Telegram for iOS code.

Copyright © 2026 Uofist (@uofist) for UofsTg specific modifications.
> Based on Twelve by theanazerka — https://github.com/theanazerka/twelve-project
