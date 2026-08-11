export THEOS ?= /Users/anazerka/theos

# This is a rootful iOS 6 application package, not a MobileSubstrate tweak.
ARCHS = armv7
TARGET = iphone:clang:latest:6.0

UofsTg_BUNDLE_NAME = UofsTg
UofsTg_INSTALL_PATH = /Applications
UofsTg_RESOURCE_DIRS = ../../Telegraph/Resources ../../Telegraph/en.lproj ../../Telegraph/ru.lproj ../../Telegraph/de.lproj ../../Telegraph/es.lproj ../../Telegraph/it.lproj ../../Telegraph/ko.lproj ../../Telegraph/nl.lproj ../../Telegraph/pt.lproj ../../Telegraph/ar.lproj
UofsTg_BUNDLE_RESOURCES = ../../Telegraph/Telegraph-Info.plist
UofsTg_CFLAGS = -fobjc-arc -w -Wno-error -Wno-deprecated-declarations -Wno-unknown-warning-option -Wno-conversion -Wno-protocol -DSQLITE_TEMP_STORE=2 -DSQLITE_HAS_CODEC=1 -DSQLCIPHER_CRYPTO_CC=1 -DSQLITE_ENABLE_FTS3 -DTGVOIP_USE_CUSTOM_CRYPTO -DTGVOIP_USE_AUDIO_SESSION -DTG_PUBLIC_BUILD=1 -D__STDC_FORMAT_MACROS=1
UofsTg_CCFLAGS = -std=gnu++0x -D__STDC_FORMAT_MACROS=1
UofsTg_OBJCFLAGS = -include ../../submodules/LegacyComponents/LegacyComponents/LegacyComponentsIos6Compat.h
UofsTg_CFLAGS += -I../../ -I../../Telegraph -I../../Telegraph/AdHoc -I../../Telegraph/API -I../../submodules/MtProtoKit -I../../submodules/LegacyComponents -I../../Telegraph/thirdparty/ogg -I../../thirdparty/libphonenumber.framework/Headers -I../../legacy/TelegraphKit -I../../legacy/TL -I../../legacy/TL/TL -I../../thirdparty/pop -I../../thirdparty/libbpg -I../../thirdparty/SSignalKit -I../../submodules/libtgvoip -I../../thirdparty/Lottie/lottie-ios/Classes/PublicHeaders -I../../thirdparty/Stripe -I../../Telegraph/thirdparty/opus/include -I../../Telegraph/thirdparty/opus/include/opus -I../../Telegraph/thirdparty/opusfile -I../../Telegraph/thirdparty/opusenc -I../../thirdparty/TgVoipWebrtcIOS6/include -I../../thirdparty/RMIntro/platform/ios -I../../thirdparty/RMIntro/platform/common -I../../thirdparty/RMIntro/core -I../../thirdparty/RMIntro/3rdparty/linmath -I../../Watch -I../../Watch/Bridge -I../../Watch/Extension -I../../Share -I../../LegacyDatabase -I../../legacy -I../../thirdparty -I../../thirdparty/lz4 -I../../thirdparty/CoubPlayer -I../../thirdparty/VideoEncoder -I../../Widget -include ../../Telegraph/TGCompat.h
UofsTg_FRAMEWORKS = UIKit Foundation CoreGraphics QuartzCore CoreFoundation CFNetwork SystemConfiguration Security MobileCoreServices AssetsLibrary AVFoundation AudioToolbox CoreMedia CoreVideo ImageIO MapKit AddressBook EventKit MessageUI MediaPlayer OpenGLES GLKit CoreMotion QuickLook Accelerate PassKit VideoToolbox
UofsTg_LIBRARIES = c++ z sqlite3 icucore crypto TgVoipWebrtcIOS6Core uofs1 uofs2 uofs3 uofs4 uofs5
UofsTg_LDFLAGS = -ObjC -L../../thirdparty/TgVoipWebrtcIOS6/lib -L../../submodules/MtProtoKit/openssl/iOS -L$(THEOS_OBJ_DIR)

LIBRARY_NAME = libuofs1 libuofs2 libuofs3 libuofs4 libuofs5
-include Sources1.mk
-include Sources2.mk
-include Sources3.mk
-include Sources4.mk
-include Sources5.mk

libuofs1_CFLAGS = $(UofsTg_CFLAGS)
libuofs1_CCFLAGS = $(UofsTg_CCFLAGS)
libuofs1_OBJCFLAGS = $(UofsTg_OBJCFLAGS)
libuofs2_CFLAGS = $(UofsTg_CFLAGS)
libuofs2_CCFLAGS = $(UofsTg_CCFLAGS)
libuofs2_OBJCFLAGS = $(UofsTg_OBJCFLAGS)
libuofs3_CFLAGS = $(UofsTg_CFLAGS)
libuofs3_CCFLAGS = $(UofsTg_CCFLAGS)
libuofs3_OBJCFLAGS = $(UofsTg_OBJCFLAGS)
libuofs4_CFLAGS = $(UofsTg_CFLAGS)
libuofs4_CCFLAGS = $(UofsTg_CCFLAGS)
libuofs4_OBJCFLAGS = $(UofsTg_OBJCFLAGS)
libuofs5_CFLAGS = $(UofsTg_CFLAGS)
libuofs5_CCFLAGS = $(UofsTg_CCFLAGS)
libuofs5_OBJCFLAGS = $(UofsTg_OBJCFLAGS)

APPLICATION_NAME = UofsTg
UofsTg_FILES = ../../Telegraph/main.m

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/library.mk
include $(THEOS_MAKE_PATH)/application.mk

.PHONY: manifest verify-layout

manifest:
	@ruby generate_manifest.rb

verify-layout:
	@test -f ../../config.h || (echo "Missing ../../config.h; copy config.h.example first."; exit 1)
	@test -f ../../thirdparty/TgVoipWebrtcIOS6/lib/libTgVoipWebrtcIOS6Core.a || (echo "Missing rebuilt TgVoipWebrtcIOS6 armv7 archive."; exit 1)
	@if [ -f "$$THEOS/sdks/iPhoneOS16.5.sdk/usr/include/simd/math.h" ]; then \
		sed -i 's/::__sincospif/::__sincosf/g' "$$THEOS/sdks/iPhoneOS16.5.sdk/usr/include/simd/math.h" || true; \
		sed -i 's/::__sincospi/::__sincos/g' "$$THEOS/sdks/iPhoneOS16.5.sdk/usr/include/simd/math.h" || true; \
	fi
	@if [ -f "$$THEOS/sdks/iPhoneOS16.5.sdk/System/Library/Frameworks/PassKit.framework/Headers/PKContact.h" ]; then \
		sed -i '1s/^/@class CNPostalAddress;\n/' "$$THEOS/sdks/iPhoneOS16.5.sdk/System/Library/Frameworks/PassKit.framework/Headers/PKContact.h" || true; \
	fi
	@if [ -d "$$THEOS/sdks/iPhoneOS16.5.sdk/System/Library/Frameworks/ContactsUI.framework/Headers" ]; then \
		for f in "$$THEOS/sdks/iPhoneOS16.5.sdk/System/Library/Frameworks/ContactsUI.framework/Headers/"*.h; do \
			sed -i '1s/^/@class CNContact, CNContactProperty, CNContactStore, CNGroup, CNContainer;\n@protocol CNKeyDescriptor;\n/' "$$f" || true; \
		done; \
	fi

before-all:: verify-layout


$(THEOS_OBJ_DIR)/UofsTg.app/UofsTg: $(THEOS_OBJ_DIR)/libuofs1.a $(THEOS_OBJ_DIR)/libuofs2.a $(THEOS_OBJ_DIR)/libuofs3.a $(THEOS_OBJ_DIR)/libuofs4.a $(THEOS_OBJ_DIR)/libuofs5.a
