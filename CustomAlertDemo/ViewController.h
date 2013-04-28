//
//  ViewController.h
//  CustomAlertDemo
//
//  Created by Mayank Agarwal on 28/01/13.
//  Copyright (c) 2013 Mayank Agarwal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomAlert.h"

@interface ViewController : UIViewController<CustomAlertDelegate>
@property (nonatomic, strong) IBOutlet UIButton *btn1;
@property (nonatomic, strong) IBOutlet UIButton *btn2;
@property (nonatomic, strong) IBOutlet UIButton *btn3;
@property (nonatomic, strong) IBOutlet UIButton *btn4;
@property (nonatomic, strong) IBOutlet UIButton *btn5;
@property (nonatomic, strong) IBOutlet UIButton *btn6;



-(IBAction)btn1Click:(id)sender;
-(IBAction)btn2Click:(id)sender;
-(IBAction)btn3Click:(id)sender;
-(IBAction)btn4Click:(id)sender;
-(IBAction)btn5Click:(id)sender;
-(IBAction)btn6Click:(id)sender;


@end
