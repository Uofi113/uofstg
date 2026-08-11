#import "TGFileUtils.h"

#import <MobileCoreServices/MobileCoreServices.h>

extern CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI);
extern CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass);

NSString *TGMimeTypeForFileExtension(NSString *fileExtension)
{
    return TGMimeTypeForFileUTI((__bridge_transfer NSString *)UTTypeCreatePreferredIdentifierForTag((__bridge CFStringRef)@"public.filename-extension", (__bridge CFStringRef)fileExtension, NULL));
}

NSString *TGMimeTypeForFileUTI(NSString *fileUTI)
{
    NSString *mimeType = (__bridge_transfer NSString *)UTTypeCopyPreferredTagWithClass((__bridge CFStringRef)fileUTI, (__bridge CFStringRef)@"public.mime-type");
    if (mimeType == nil)
        mimeType = @"application/octet-stream";
    return mimeType;
}

NSString *TGTemporaryFileName(NSString *fileExtension)
{
    if (fileExtension == nil)
        fileExtension = @"bin";
    
    int64_t randomId = 0;
    arc4random_buf(&randomId, sizeof(randomId));
    
    return [NSTemporaryDirectory() stringByAppendingPathComponent:[[NSString alloc] initWithFormat:@"%" PRIx64 ".%@", randomId, fileExtension]];
}
