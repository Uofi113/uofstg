#!/bin/sh
set -e

ROOT="$(cd "$(dirname "$0")" && pwd)"
SIM_OUT="${1:-/private/tmp/tgcalls_ios6_core_i386}"
ARMV7_OUT="${2:-/private/tmp/tgcalls_ios6_core_armv7}"
ARM64_OUT="${3:-/private/tmp/tgcalls_ios6_core_arm64}"
FAT_OUT="${4:-$ROOT/lib/libTgVoipWebrtcIOS6Core.a}"

ARCH=armv7 SDK=iphoneos "$ROOT/build_core_ios6.sh" "$ARMV7_OUT"

cp "$ARMV7_OUT/libTgVoipWebrtcIOS6Core.a" "$FAT_OUT"

# Legacy Xcode turns the framework build-file reference into -lTgVoipWebrtcIOS6Core.
# Its existing search path already includes libtgvoip/external, so expose the
# freshly-built archive there as well.
ln -sf "$FAT_OUT" "$ROOT/../../submodules/libtgvoip/external/libTgVoipWebrtcIOS6Core.a"
