//
//  SettingsViewController.m
//  Iyan3D
//
//  Created by Sankar on 06/01/16.
//  Copyright © 2016 Smackall Games. All rights reserved.
//

#import "SettingsViewController.h"
#import "Utility.h"
#import <AppHelper.h>
@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupImageTap];
    self.doneBtn.layer.cornerRadius=8.0f;
    int framesIndicatorValue= (int)[[[AppHelper getAppHelper] userDefaultsForKey:@"indicationType"]longValue];
    float cameraPreviewSize= [[[AppHelper getAppHelper]userDefaultsForKey:@"cameraPreviewSize"]floatValue];
    if ([[AppHelper getAppHelper] userDefaultsForKey:@"indicationType"]){
        if(framesIndicatorValue==2)
        {
            [self.frameCountDisplay setSelectedSegmentIndex:1];
        }
        else
        {
            
        }
        
    }
    if ([[AppHelper getAppHelper] userDefaultsForKey:@"indicationType"]){
        if(cameraPreviewSize==2.0){
            [self.renderPreviewSize setSelectedSegmentIndex:1];
        }
        else{
            
        }
    }
    NSLog(@"Toolpar : %ld",(long)[[[AppHelper getAppHelper]userDefaultsForKey:@"toolbarPosition"]integerValue]);
    if([[[AppHelper getAppHelper]userDefaultsForKey:@"toolbarPosition"]integerValue]==1)
    {
        [self.toolbarPosition setSelectedSegmentIndex:1];
    }
    else
    {
        [self.toolbarPosition setSelectedSegmentIndex:0];
    }
    if([[[AppHelper getAppHelper]userDefaultsForKey:@"cameraPreviewPosition"]integerValue]==1)
    {
        [self.renderPreviewPosition setSelectedSegmentIndex:1];
    }
    else if([[[AppHelper getAppHelper]userDefaultsForKey:@"cameraPreviewPosition"]integerValue]==2)
    {
        [self.renderPreviewPosition setSelectedSegmentIndex:2];
    }
    else if([[[AppHelper getAppHelper]userDefaultsForKey:@"cameraPreviewPosition"]integerValue]==3)
    {
        [self.renderPreviewPosition setSelectedSegmentIndex:3];
    }
    else
    {
        [self.renderPreviewPosition setSelectedSegmentIndex:0];
    }

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupImageTap{
    self.toolbarLeft.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapToolBarLeft = [[UITapGestureRecognizer alloc]
                                              initWithTarget:self action:@selector(toolbarLeftTap:)];
    self.toolbarRight.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapToolBarRight = [[UITapGestureRecognizer alloc]
                                               initWithTarget:self action:@selector(toolbarRightTap:)];
    self.renderPreviewSizeSmall.userInteractionEnabled = YES;
    UITapGestureRecognizer *taprenderPreviewSizeSmall = [[UITapGestureRecognizer alloc]
                                                         initWithTarget:self action:@selector(renderPreviewSizeSmallTap:)];
    self.renderPreviewSizeLarge.userInteractionEnabled = YES;
    UITapGestureRecognizer *taprenderPreviewSizeLarge = [[UITapGestureRecognizer alloc]
                                                         initWithTarget:self action:@selector(renderPreviewSizeLargeTap:)];
    self.framesDisplayCount.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapframesDisplayCount = [[UITapGestureRecognizer alloc]
                                                         initWithTarget:self action:@selector(framesDisplayCountTap:)];
    self.framesDisplayDuration.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapframesDisplayDuration = [[UITapGestureRecognizer alloc]
                                                         initWithTarget:self action:@selector(framesDisplayDurationTap:)];
    
    self.previewPositionRightBottom.userInteractionEnabled = YES;
    UITapGestureRecognizer *tappreviewPositionRightBottom = [[UITapGestureRecognizer alloc]
                                                        initWithTarget:self action:@selector(previewPositionRightBottomTap:)];
    self.previewPositionRightTop.userInteractionEnabled = YES;
    UITapGestureRecognizer *tappreviewPositionRightTop = [[UITapGestureRecognizer alloc]
                                                             initWithTarget:self action:@selector(previewPositionRightTopTap:)];
    self.previewPositionLeftBottom.userInteractionEnabled = YES;
    UITapGestureRecognizer *tappreviewPositionLeftBottom = [[UITapGestureRecognizer alloc]
                                                          initWithTarget:self action:@selector(previewPositionLeftBottomTap:)];
    self.previewPositionLeftTop.userInteractionEnabled = YES;
    UITapGestureRecognizer *tappreviewPositionLeftTop = [[UITapGestureRecognizer alloc]
                                                          initWithTarget:self action:@selector(previewPositionLeftTopTap:)];
    
    tapToolBarLeft.delegate = self;
    tapToolBarRight.delegate = self;
    taprenderPreviewSizeSmall.delegate=self;
    taprenderPreviewSizeLarge.delegate=self;
    tapframesDisplayCount.delegate=self;
    tapframesDisplayDuration.delegate=self;
    tappreviewPositionRightBottom.delegate=self;
    tappreviewPositionRightTop.delegate=self;
    tappreviewPositionLeftBottom.delegate=self;
    tappreviewPositionLeftTop.delegate=self;
    
    
    [self.toolbarLeft addGestureRecognizer:tapToolBarLeft];
    [self.toolbarRight addGestureRecognizer:tapToolBarRight];
    [self.renderPreviewSizeSmall addGestureRecognizer:taprenderPreviewSizeSmall];
    [self.renderPreviewSizeLarge addGestureRecognizer:taprenderPreviewSizeLarge];
    [self.framesDisplayCount addGestureRecognizer:tapframesDisplayCount];
    [self.framesDisplayDuration addGestureRecognizer:tapframesDisplayDuration];
    [self.previewPositionRightBottom addGestureRecognizer:tappreviewPositionRightBottom];
    [self.previewPositionRightTop addGestureRecognizer:tappreviewPositionRightTop];
    [self.previewPositionLeftBottom addGestureRecognizer:tappreviewPositionLeftBottom];
    [self.previewPositionLeftTop addGestureRecognizer:tappreviewPositionLeftTop];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)toolBarPositionChanged:(id)sender {
    NSLog(@"Tool Bar position Changed");
    [self.delegate toolbarPosition:(int)self.toolbarPosition.selectedSegmentIndex];
}

- (IBAction)renderPreviewSizeChanged:(id)sender {
    NSLog(@"Render preview size Changed");
    [self.delegate cameraPreviewSize:(int)self.renderPreviewSize.selectedSegmentIndex];
}

- (IBAction)frameCountDisplayType:(id)sender {
    NSLog(@"frame display type Changed");
    [self.delegate frameCountDisplayMode:(int)self.frameCountDisplay.selectedSegmentIndex];
}

- (IBAction)previewpositionChanged:(id)sender {
    NSLog(@"Preview position Changed");
    [self.delegate cameraPreviewPosition:(int)self.renderPreviewPosition.selectedSegmentIndex];
}

- (IBAction)doneBtnAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)toolbarLeftTap:(UITapGestureRecognizer *)pinchGestureRecognizer{
    if(self.toolbarPosition.selectedSegmentIndex==0){
        self.toolbarPosition.selectedSegmentIndex=1;
        [self.delegate toolbarPosition:(int)self.toolbarPosition.selectedSegmentIndex];
    }
    else{
        
    }
    
}
- (void)toolbarRightTap:(UITapGestureRecognizer *)pinchGestureRecognizer{
    if(self.toolbarPosition.selectedSegmentIndex==0){
        
    }
    else{
        self.toolbarPosition.selectedSegmentIndex=0;
        [self.delegate toolbarPosition:(int)self.toolbarPosition.selectedSegmentIndex];
    }
    
}
- (void)renderPreviewSizeSmallTap:(UITapGestureRecognizer *)pinchGestureRecognizer{
    if(self.renderPreviewSize.selectedSegmentIndex==0){
        
    }
    else{
        self.renderPreviewSize.selectedSegmentIndex=0;
        [self.delegate cameraPreviewSize:(int)self.renderPreviewSize.selectedSegmentIndex];
    }
    
}
- (void)renderPreviewSizeLargeTap:(UITapGestureRecognizer *)pinchGestureRecognizer{
    if(self.renderPreviewSize.selectedSegmentIndex==0){
        self.renderPreviewSize.selectedSegmentIndex=1;
        [self.delegate cameraPreviewSize:(int)self.renderPreviewSize.selectedSegmentIndex];
    }
    else{
        
    }
    
}
- (void)framesDisplayDurationTap:(UITapGestureRecognizer *)pinchGestureRecognizer{
    if(self.frameCountDisplay.selectedSegmentIndex==0){
        self.frameCountDisplay.selectedSegmentIndex=1;
        [self.delegate frameCountDisplayMode:(int)self.frameCountDisplay.selectedSegmentIndex];
    }
    else{
        
    }
    
}
- (void)framesDisplayCountTap:(UITapGestureRecognizer *)pinchGestureRecognizer{
    if(self.frameCountDisplay.selectedSegmentIndex==0){
        
    }
    else{
        self.frameCountDisplay.selectedSegmentIndex=0;
        [self.delegate frameCountDisplayMode:(int)self.frameCountDisplay.selectedSegmentIndex];
    }
    
}
- (void)previewPositionRightBottomTap:(UITapGestureRecognizer *)pinchGestureRecognizer{
    if(self.renderPreviewPosition.selectedSegmentIndex!=0){
         self.renderPreviewPosition.selectedSegmentIndex=0;
        [self.delegate cameraPreviewPosition:(int)self.renderPreviewPosition.selectedSegmentIndex];
    }
    else{
       
    }
    
}
- (void)previewPositionRightTopTap:(UITapGestureRecognizer *)pinchGestureRecognizer{
    if(self.renderPreviewPosition.selectedSegmentIndex!=1){
        self.renderPreviewPosition.selectedSegmentIndex=1;
        [self.delegate cameraPreviewPosition:(int)self.renderPreviewPosition.selectedSegmentIndex];
    }
    else{
        
    }
    
}
- (void)previewPositionLeftBottomTap:(UITapGestureRecognizer *)pinchGestureRecognizer{
    if(self.renderPreviewPosition.selectedSegmentIndex!=2){
        self.renderPreviewPosition.selectedSegmentIndex=2;
        [self.delegate cameraPreviewPosition:(int)self.renderPreviewPosition.selectedSegmentIndex];
    }
    else{
        
    }
    
}
- (void)previewPositionLeftTopTap:(UITapGestureRecognizer *)pinchGestureRecognizer{
    if(self.renderPreviewPosition.selectedSegmentIndex!=3){
        self.renderPreviewPosition.selectedSegmentIndex=3;
        [self.delegate cameraPreviewPosition:(int)self.renderPreviewPosition.selectedSegmentIndex];
    }
    else{
        
    }
    
}


@end