#!/bin/sh
set -e

ROOT="$(cd "$(dirname "$0")" && pwd)"
SRC="$ROOT/src"
OUT="${1:-/tmp/tgcalls_ios6_core_build}"

mkdir -p "$OUT"

ARCH="${ARCH:-i386}"
SDK="${SDK:-iphonesimulator}"
if [ "$SDK" = "iphoneos" ]; then
  MIN_VERSION="-miphoneos-version-min=6.0"
else
  MIN_VERSION="-mios-simulator-version-min=6.0"
fi
CXXFLAGS="-arch $ARCH -std=c++11 -stdlib=libc++ $MIN_VERSION -DTGCALLS_IOS6_AUDIO_ONLY=1"
INCLUDES="-I$ROOT/include -I$SRC -I$SRC/tgcalls -I$ROOT/../../Telegraph/thirdparty/opus/include/opus -I$ROOT/../../submodules/libtgvoip -include $ROOT/compat_force_include.h"

SOURCES="
tgcalls/third-party/json11.cpp
tgcalls/CryptoHelper.cpp
tgcalls/EncryptedConnection.cpp
tgcalls/FieldTrialsConfig.cpp
tgcalls/Instance.cpp
tgcalls/InstanceImpl.cpp
tgcalls/LogSinkImpl.cpp
tgcalls/Manager.cpp
tgcalls/Message.cpp
tgcalls/NetworkManager.cpp
tgcalls/StaticThreads.cpp
tgcalls/v2/ExternalSignalingConnection.cpp
tgcalls/v2/Signaling.cpp
"

if [ -n "$THEOS" ] && [ -d "$THEOS/toolchain/linux/iphone/bin" ]; then
  CLANG="$THEOS/toolchain/linux/iphone/bin/clang++"
  AR="$THEOS/toolchain/linux/iphone/bin/ar"
  SYSROOT=$(ls -d $THEOS/sdks/iPhoneOS*.sdk | head -n 1)
  CXXFLAGS="$CXXFLAGS -isysroot $SYSROOT -target armv7-apple-ios"
else
  CLANG="xcrun --sdk $SDK clang++"
  AR="xcrun libtool -static -o"
fi

for source in $SOURCES; do
  object="$OUT/$(echo "$source" | tr '/' '_').o"
  echo "CXX $source"
  $CLANG $CXXFLAGS $INCLUDES -c "$SRC/$source" -o "$object"
done

echo "AR libTgVoipWebrtcIOS6Core.a"
if [ "$AR" = "xcrun libtool -static -o" ]; then
  $AR "$OUT/libTgVoipWebrtcIOS6Core.a" "$OUT"/*.o
else
  $AR rcs "$OUT/libTgVoipWebrtcIOS6Core.a" "$OUT"/*.o
fi
echo "$OUT/libTgVoipWebrtcIOS6Core.a"
