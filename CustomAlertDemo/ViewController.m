//
//  ViewController.m
//  CustomAlertDemo
//
//  Created by Mayank Agarwal on 28/01/13.
//  Copyright (c) 2013 Mayank Agarwal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)btn1Click:(id)sender
{
    CustomAlert *alert = [[CustomAlert alloc] initWithTitle:@"Title" text:@"It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
    alert.backgroundImageFileName = @"DialogBox.png";
    alert.buttonImageFileName = @"DialogBoxBtn.png";
    [alert show];
}

-(void) btn2Click:(id)sender
{
    CustomAlert *alert = [[CustomAlert alloc] initWithTitle:nil text:@"Hiii, what are you doing these days??? As you can see it is a multi-line demo of custom alert." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    alert.backgroundImageFileName = @"DialogBox.png";
    alert.buttonImageFileName = @"DialogBoxBtn.png";
    [alert show];
}

-(void) btn3Click:(id)sender
{
    CustomAlert *alert = [[CustomAlert alloc] initWithTitle:@"Title" text:@"It is a single line alert." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok",nil];
    alert.backgroundImageFileName = @"DialogBox.png";
    alert.buttonImageFileName = @"DialogBoxBtn.png";
    [alert show];
}


-(void) btn4Click:(id)sender
{
    CustomAlert *alert = [[CustomAlert alloc] initWithTitle:nil text:@"Hiii, what are you doing these days??? As you can see it is a multi-line demo of custom alert. Just a test Just a test Just a test Just a test Just a test Just a test Just a testJust a testJust a testJust " delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok",nil];
    alert.backgroundImageFileName = @"DialogBox.png";
    alert.buttonImageFileName = @"DialogBoxBtn.png";
    [alert show];
}


-(void) btn5Click:(id)sender
{
    CustomAlert *alert = [[CustomAlert alloc] initWithTitle:nil text:@"It is a single line. " delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok",@"Done",nil];
    alert.backgroundImageFileName = @"DialogBox.png";
    alert.buttonImageFileName = @"DialogBoxBtn.png";
    [alert show];
}


-(void) btn6Click:(id)sender
{
    CustomAlert *alert = [[CustomAlert alloc] initWithTitle:@"Title kPadding kPadding kPadding kPadding kPadding kPadding" text:@"It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert. It is a single line alert." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok",@"Done",nil];
//    CustomAlert *alert = [[CustomAlert alloc] initWithTitle:@"" text:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok",@"Done",nil];
    alert.backgroundImageFileName = @"DialogBox.png";
    alert.buttonImageFileName = @"DialogBoxBtn.png";
    [alert show];
}

-(void) btnPressedAtIndex:(int)index
{
    // To check whether we are getting the correct callback for each button, I am changing the backgound colour of viewcontroller
    switch (index)
    {
        case 0:
            self.view.backgroundColor = [UIColor redColor];
            break;
            
        case 1:
            self.view.backgroundColor = [UIColor greenColor];
            break;
            
        case 2:
            self.view.backgroundColor = [UIColor cyanColor];
            break;
            
        default:
            break;
    }
}




@end
