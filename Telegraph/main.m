#import <UIKit/UIKit.h>

#import "TGAppDelegate.h"
#import "TGApplication.h"

#import "TGDatabase.h"

int main(int argc, char *argv[])
{
    mainLaunchTimestamp = CFAbsoluteTimeGetCurrent();
    applicationStartupTimestamp = mainLaunchTimestamp;
    
    @autoreleasepool
    {
        [TGDatabase setDatabaseName:@"tgdata"];
     
        return UIApplicationMain(argc, argv, @"TGApplication", @"TGAppDelegate");
    }
    
}

#import <CoreText/CoreText.h>
CTFontRef TGIos6CreateCTFontFromUIFont(UIFont *font) { return CTFontCreateWithName((__bridge CFStringRef)font.fontName, font.pointSize, NULL); }

