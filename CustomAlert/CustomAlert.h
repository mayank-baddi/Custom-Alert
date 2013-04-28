//
//  CustomAlert.h
//  FacialRecognition
//
//  Created by Gazal Kochar on 25/01/13.
//  Copyright (c) 2013 Gazal Kochar. All rights reserved.
//

#import <UIKit/UIKit.h>

//Constants
#define kButtonHeight 34.0f
#define kPadding 12.0f
#define kTitleHeight 25.0f
#define kAlertTextMaxHeight 150.0f
#define kAlertTextMaxHeightForThreeButtonAlert 80.0f
#define kAlertTextWidth 250.0f


@protocol CustomAlertDelegate <NSObject>

@required
-(void) btnPressedAtIndex:(int)index;
@end

@interface CustomAlert : UIView
{
    UIImageView *backgroundView;    // It is the alert box
    UIImage *background;            // It is the background image of alertbox
    UIImage *buttonImage;           // It is the background image of buttons
    NSMutableArray *btnLabelArray;  // contains titles of all btns, cancel button title is always at the last index of this array
    NSString *text;                 // Text that has to be displayed in the alert
    NSString *title;                 // Text that has to be displayed as alert title
    float yOffsetForBtns;           // Used for positioning alerts in case alert's height is less than max height
    CGSize screenSize;              // size of screen
    UILabel *titleLabel;
}
@property (nonatomic,strong) id<CustomAlertDelegate> delegate;
@property (nonatomic,strong) NSString *backgroundImageFileName;
@property (nonatomic,strong) NSString *buttonImageFileName;
@property (nonatomic,strong) UITextView *alertText;

-(id) initWithTitle:(NSString*)alertTitle text:(NSString*)alertMessage  delegate:(id /*<CustomAlertDelegate>*/)alertDelegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;
-(void) show;
-(void) destroy;
@end
