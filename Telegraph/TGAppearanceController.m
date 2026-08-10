#import "TGAppearanceController.h"

#import <stdlib.h>

#import "TGLegacyComponentsContext.h"

#import "TGHeaderCollectionItem.h"
#import "TGDisclosureActionCollectionItem.h"
#import "TGFontSizeCollectionItem.h"
#import "TGCheckCollectionItem.h"
#import "TGSwitchCollectionItem.h"
#import "TGAppearancePreviewCollectionItem.h"
#import "TGAppearanceColorCollectionItem.h"

#import "TGAppearanceColorPickerItemView.h"
#import "TGCustomAlertView.h"

#import "TGPresentation.h"
#import "TGDefaultPresentationPallete.h"

#import "TGWallpaperManager.h"
#import "../submodules/LegacyComponents/LegacyComponents/TGColorWallpaperInfo.h"
#import "TGMessageViewModel.h"

#import "TGWallpaperListController.h"
#import "TGAppearanceAutoNightController.h"

@interface TGAppearanceController () <ASWatcher>
{
    TGFontSizeCollectionItem *_sizeItem;
    
    TGCollectionMenuSection *_previewSection;
    TGAppearancePreviewCollectionItem *_previewItem;
}

@property (nonatomic, strong) ASHandle *actionHandle;

@end

@implementation TGAppearanceController

- (instancetype)init
{
    self = [super init];
    if (self != nil)
    {
        _actionHandle = [[ASHandle alloc] initWithDelegate:self releaseOnMainThread:true];
        
        self.title = TGLocalized(@"Appearance.Title");
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:TGLocalized(@"Common.Back") style:UIBarButtonItemStylePlain target:nil action:nil];
        
        TGCollectionMenuSection *fontSection = [[TGCollectionMenuSection alloc] initWithItems:@
        [
         [[TGHeaderCollectionItem alloc] initWithTitle:TGLocalized(@"Appearance.TextSize")],
         _sizeItem = [[TGFontSizeCollectionItem alloc] init]
        ]];
        
        __weak TGAppearanceController *weakSelf = self;
        _sizeItem.valueChanged = ^(int32_t value)
        {
            __strong TGAppearanceController *strongSelf = weakSelf;
            if (strongSelf != nil) {
                CGFloat size = [strongSelf fontSizeForPosition:value];
                [TGPresentation setFontSize:size];
                TGUpdateMessageViewModelLayoutConstants(size);
                [strongSelf->_previewItem refreshMetrics];
            }
        };
        
        [[[TGPresentation fontSizeSignal] take:1] startWithNext:^(NSNumber *next)
        {
            __strong TGAppearanceController *strongSelf = weakSelf;
            if (strongSelf != nil) {
                int32_t position = [strongSelf positionForFontSize:next.floatValue];
                [strongSelf->_sizeItem setValue:position];
                
                TGUpdateMessageViewModelLayoutConstants(next.floatValue);
            }
        }];
        
        UIEdgeInsets topSectionInsets = fontSection.insets;
        topSectionInsets.top = 32.0f;
        fontSection.insets = topSectionInsets;
        [self.menuSections addSection:fontSection];
        
        _previewItem = [[TGAppearancePreviewCollectionItem alloc] init],
        _previewItem.heightChanged = ^ {
            __strong TGAppearanceController *strongSelf = weakSelf;
            if (strongSelf != nil) {
                [strongSelf.collectionLayout invalidateLayout];
                [strongSelf.collectionView layoutSubviews];
            }
        };
        _previewItem.messages = [self messages];
        
        TGDisclosureActionCollectionItem *backgroundItem = [[TGDisclosureActionCollectionItem alloc] initWithTitle:TGLocalized(@"Settings.ChatBackground") action:@selector(wallpapersPressed)];
        backgroundItem.ignoreSeparatorInset = true;
        _previewSection = [[TGCollectionMenuSection alloc] initWithItems:@
        [
         [[TGHeaderCollectionItem alloc] initWithTitle:TGLocalized(@"Appearance.Preview")],
         _previewItem,
         backgroundItem
        ]];
        [self.menuSections addSection:_previewSection];
        
        [ActionStageInstance() watchForPaths:@[@"/tg/assets/currentWallpaperInfo"] watcher:self];
    }
    return self;
}

- (void)dealloc
{
    [_actionHandle reset];
    [ActionStageInstance() removeWatcher:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (iosMajorVersion() < 8)
    {
        [_previewItem refreshMetrics];
        [self.collectionLayout invalidateLayout];
        [self.collectionView layoutSubviews];
    }
}

- (void)wallpapersPressed
{
    TGWallpaperListController *controller = [[TGWallpaperListController alloc] init];
    controller.presentation = self.presentation;
    [self.navigationController pushViewController:controller animated:true];
}

- (void)actionStageActionRequested:(NSString *)action options:(id)options
{
}

- (NSArray *)messages
{
    TGUser *replyAuthor = [[TGUser alloc] init];
    replyAuthor.firstName = TGLocalized(@"Appearance.PreviewReplyAuthor");
    replyAuthor.uid = 2;
    
    TGMessage *replyMessage = [[TGMessage alloc] init];
    replyMessage.mid = 1;
    replyMessage.fromUid = 2;
    replyMessage.text = TGLocalized(@"Appearance.PreviewReplyText");
    replyMessage.date = 60 * (60 * 18 + 19);
    
    TGReplyMessageMediaAttachment *replyMessageAttachment = [[TGReplyMessageMediaAttachment alloc] init];
    replyMessageAttachment.replyMessageId = replyMessage.mid;
    replyMessageAttachment.replyMessage = replyMessage;
    
    TGMessage *firstMessage = [[TGMessage alloc] init];
    firstMessage.mid = 2;
    firstMessage.fromUid = 1;
    firstMessage.text = TGLocalized(@"Appearance.PreviewIncomingText");
    firstMessage.date = 60 * (60 * 18 + 20);
    firstMessage.mediaAttachments = @[replyMessageAttachment];
    
    TGMessage *secondMessage = [[TGMessage alloc] init];
    secondMessage.mid = 3;
    secondMessage.fromUid = 2;
    secondMessage.outgoing = true;
    secondMessage.text = TGLocalized(@"Appearance.PreviewOutgoingText");
    secondMessage.date = 60 * (60 * 18 + 20);
    
    return @[ secondMessage, firstMessage ];
}

- (void)actionStageResourceDispatched:(NSString *)path resource:(id)__unused resource arguments:(id)__unused arguments
{
    if ([path isEqualToString:@"/tg/assets/currentWallpaperInfo"])
    {
        TGDispatchOnMainThread(^
        {
            [_previewItem updateWallpaper];
        });
    }
}

+ (NSArray *)fontSizes
{
    return @[ @14.0f, @15.0f, @16.0f, @17.0f, @19.0f, @23.0f, @26.0f ];
}

- (CGFloat)fontSizeForPosition:(int32_t)position
{
    if (position < 0 || position > (int32_t)[TGAppearanceController fontSizes].count)
        return 17.0f;
    
    return [[TGAppearanceController fontSizes][position] floatValue];
}

- (int32_t)positionForFontSize:(CGFloat)fontSize
{
    int32_t bestIndex = 3;
    CGFloat bestDelta = FLT_MAX;
    
    NSArray *fontSizes = [TGAppearanceController fontSizes];
    for (int32_t i = 0; i < (int32_t)fontSizes.count; i++)
    {
        CGFloat size = [fontSizes[i] floatValue];
        CGFloat delta = (CGFloat)fabs(size - fontSize);
        if (delta < bestDelta)
        {
            bestDelta = delta;
            bestIndex = i;
        }
    }
    
    return bestIndex;
}

@end
