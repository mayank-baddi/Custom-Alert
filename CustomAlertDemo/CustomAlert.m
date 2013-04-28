//
//  CustomAlert.m
//  FacialRecognition
//
//  Created by Mayank Agarwal on 28/01/13.
//  Copyright (c) 2013 Mayank Agarwal. All rights reserved.
//

#import "CustomAlert.h"
#import <QuartzCore/QuartzCore.h>

@implementation CustomAlert
@synthesize delegate;
@synthesize backgroundImageFileName;
@synthesize buttonImageFileName;
@synthesize alertText;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
    }
    return self;
}

-(id) initWithTitle:(NSString *)alertTitle text:(NSString *)alertMessage delegate:(id)alertDelegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    if(([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft)||([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight))
    {
        screenSize.width = [[UIScreen mainScreen] bounds].size.height - (![UIApplication sharedApplication].statusBarHidden)*20;
        screenSize.height = [[UIScreen mainScreen] bounds].size.width;
    }
    else
    {
        screenSize.width = [[UIScreen mainScreen] bounds].size.width;
        screenSize.height = [[UIScreen mainScreen] bounds].size.height - (![UIApplication sharedApplication].statusBarHidden)*20;
    }
    
    
    self = [super initWithFrame:CGRectMake(0, 0,screenSize.width,screenSize.height)];
    self.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth ;

    self.backgroundColor = [UIColor colorWithWhite:0.4 alpha:0.5];
    btnLabelArray = [[NSMutableArray alloc] init];
    text = alertMessage;
    title = alertTitle;
    self.delegate = alertDelegate;
    if(otherButtonTitles)
    {
        va_list args;
        va_start(args, otherButtonTitles);
        for (NSString *arg = otherButtonTitles; arg != nil; arg = va_arg(args, NSString*))
        {
            [btnLabelArray addObject:arg];
        }
        va_end(args);
    }
    [btnLabelArray addObject:cancelButtonTitle];    //cancel button title should always be the last object of btnLabelArray as the cancel btn is always last button of an alert
    
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    if (!window)
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    [[[window subviews] objectAtIndex:0] addSubview:self];
    // To handle orientation changes
    return self;
}

-(void) show
{
    background = [UIImage imageNamed:backgroundImageFileName];

    backgroundView = [[UIImageView alloc] initWithImage:background];
    backgroundView.contentMode = UIViewContentModeScaleToFill;
    
    // To add rounded rect effect to the alertbox
    backgroundView.layer.cornerRadius = 8;
    backgroundView.layer.masksToBounds = YES;
    
    // To handle rotation/orientation change
    backgroundView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin;
    backgroundView.userInteractionEnabled = YES;
    [self addSubview:backgroundView];
    
    buttonImage = [UIImage imageNamed:buttonImageFileName];
    
    alertText = [[UITextView alloc] init] ;
    if(title!= nil)
    {
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPadding, kPadding, kAlertTextWidth, kTitleHeight)];
        titleLabel.text = title;
        titleLabel.font = [UIFont fontWithName:@"System" size:17];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor cyanColor];
        
        [backgroundView addSubview:titleLabel];
    }
    
    
    // Check whether the size of text is smaller than the default alert text size, if yes then reduce the size of alertbox.
    CGSize sizeOfText = [text sizeWithFont:[alertText.font fontWithSize:14] constrainedToSize:CGSizeMake(kAlertTextWidth-16,kAlertTextMaxHeight)];
    
    float maxHeightOfAlertText;
    if(btnLabelArray.count < 3)
    {
        maxHeightOfAlertText = kAlertTextMaxHeight;
    }
    else
    {
        maxHeightOfAlertText = kAlertTextMaxHeightForThreeButtonAlert;
    }
    
    if(sizeOfText.height+7.0 < maxHeightOfAlertText)
    {
        alertText.frame = CGRectMake(kPadding, kPadding+titleLabel.bounds.size.height, kAlertTextWidth,sizeOfText.height+7.0f);
        [alertText setUserInteractionEnabled:NO];
        [alertText setScrollEnabled:NO];
    }
    else
    {
        alertText.frame = CGRectMake(kPadding, kPadding+titleLabel.bounds.size.height, kAlertTextWidth,maxHeightOfAlertText);
        [alertText setUserInteractionEnabled:YES];
        [alertText setScrollEnabled:YES];
    }
    alertText.text = text;
    alertText.textAlignment = NSTextAlignmentCenter;
    [alertText setEditable: NO];
    alertText.backgroundColor = [UIColor clearColor];
    alertText.font = [alertText.font fontWithSize:14];
    [alertText setBackgroundColor:[UIColor clearColor]];
    [alertText setTextColor:[UIColor cyanColor]];
    [backgroundView addSubview:alertText];
    
    for (int i = 0; i<btnLabelArray.count; i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setBackgroundImage:buttonImage forState:UIControlStateNormal];
        [btn setTitle:[btnLabelArray objectAtIndex:i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;    // This will be used for callback actions on tapping buttons
        
        // To add rounded rect effect to the button
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        if(btnLabelArray.count == 1)
        {
            btn.frame = CGRectMake(4*kPadding,(titleLabel.bounds.size.height+alertText.bounds.size.height+3*kPadding),kAlertTextWidth - 6*kPadding,kButtonHeight);
            [backgroundView addSubview:btn];
        }
        else if(btnLabelArray.count == 2)
        {
            btn.frame = CGRectMake(1.5*kPadding + (1.5*kPadding+((kAlertTextWidth-3*kPadding)/2))*i, (titleLabel.bounds.size.height+alertText.bounds.size.height+3*kPadding),(kAlertTextWidth-3*kPadding)/2 ,kButtonHeight);
            [backgroundView addSubview:btn];
        }
        else
        {
            btn.frame = CGRectMake(2*kPadding, (titleLabel.bounds.size.height+alertText.bounds.size.height+3*kPadding+(kPadding+kButtonHeight)*i), (kAlertTextWidth-2*kPadding),kButtonHeight);
            [backgroundView addSubview:btn];
        }
    }
    
    float alertWidth = (2*kPadding + kAlertTextWidth);
    float alertHeight;
    if(btnLabelArray.count == 1)
    {
        alertHeight = 4*kPadding + titleLabel.bounds.size.height + alertText.bounds.size.height+kButtonHeight;
    }
    else if(btnLabelArray.count == 2)
    {
        alertHeight = 4*kPadding + titleLabel.bounds.size.height + alertText.bounds.size.height+kButtonHeight;
    }
    else if(btnLabelArray.count == 3)
    {
        alertHeight = 6*kPadding + titleLabel.bounds.size.height + alertText.bounds.size.height+kButtonHeight*3;
    }
    backgroundView.frame = CGRectMake((self.bounds.size.width-alertWidth)/2, (self.bounds.size.height-alertHeight)/2, alertWidth, alertHeight);
    
    backgroundView = nil;
}

-(void) destroy
{
    delegate = nil;
    alertText = nil;
    [self removeFromSuperview];
}

-(void) btnPressed:(UIButton*) sender
{
    [delegate btnPressedAtIndex:sender.tag];
    [self destroy];
}


@end
