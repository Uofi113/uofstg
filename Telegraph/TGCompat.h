#ifdef __OBJC__
#import <Foundation/Foundation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#include <inttypes.h>

@class TGAppDelegate;
extern TGAppDelegate *TGAppDelegateInstance;

#import "TGMediaStoreContext.h"

@interface NSObject (TGOptionalSystemSelectorDeclarations)
- (id)defaultReadingList;
- (BOOL)addReadingListItemWithURL:(NSURL *)url title:(NSString *)title previewText:(NSString *)previewText error:(NSError **)error;
- (void)setEffect:(id)effect;
- (id)effectWithStyle:(NSInteger)style;
- (id)summaryItemWithLabel:(NSString *)label amount:(NSDecimalNumber *)amount;
- (NSDecimalNumber *)amount;
- (BOOL)canMakePaymentsUsingNetworks:(NSArray *)supportedNetworks;
@end
#endif
