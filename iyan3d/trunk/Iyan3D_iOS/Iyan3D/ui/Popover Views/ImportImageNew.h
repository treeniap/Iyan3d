//
//  ImportImageNew.h
//  Iyan3D
//
//  Created by Sankar on 20/12/15.
//  Copyright © 2015 Smackall Games. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImageImportNewDelgate
-(void)pickedImageWithInfo:(NSDictionary*)info;
-(void)loadingViewStatus:(BOOL)status;
- (void) showOrHideLeftView:(BOOL)showView withView:(UIView*)subViewToAdd;
@end

@interface ImportImageNew : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate>{
    NSDictionary* imageInfo;
}
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIView *imagesView;
@property (weak, nonatomic) id <ImageImportNewDelgate> delegate;

- (IBAction)addBtnAction:(id)sender;
- (IBAction)cancelBtnAction:(id)sender;

@end