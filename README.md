Custom-Alert
============

Custom Alert for iOS<br/>
Using Custom Alert Box<br/>
This is compatible with iOS 4.0 & above. You need to have<br/>
background images for Alertbox and the buttons. This alert box supports at max three buttons.<br/>
You can change the text colors in the code to customize according to your background.<br/>
This code is implemented for ARC. If using without ARC add the release commands in the “destroy” function.<br/>
For using the custom alert box follow these steps:<br/>
1. Add the “CustomAlert” folder to your project.<br/>
2. #import "CustomAlert.h" (Add this import statement<br/>
to your viewController.h)<br/>
3. Implement CustomAlertDelegate in your viewController.<br/>
4. Use following code to add custom alert wherever you want:<br/>
CustomAlert *alert = [[CustomAlert alloc] initWithText:@"It is a single line. " delegate:self cancelButtonTitle:@"CancelBtnTitle" otherButtonTitles:@" Btn1Title",@"Btn2Title",nil];<br/>
alert.backgroundImageFileName = @"DialogBox.png"; <br/>
alert.buttonImageFileName = @"DialogBoxBtn.png"; <br/>
[alert show];<br/>
5. Finally implement the following function to perform action on clicking any button. Here index starts from ‘0’.<br/>
-(void) btnPressedAtIndex:(int)index<br/>
