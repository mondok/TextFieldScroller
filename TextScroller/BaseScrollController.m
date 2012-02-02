//
//  BaseScrollController.m
//  TextScroller
//
//  Created by Matthew Mondok on 2/1/12.
//

#import "BaseScrollController.h"

@implementation BaseScrollController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) { }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) 
                                                 name:UIKeyboardWillShowNotification object:self.view.window];     
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) 
                                                 name:UIKeyboardDidHideNotification object:self.view.window];    
}

- (void)viewDidUnload
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil]; 
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil]; 
    __activeField = nil;
    scrollView = nil;
    [super viewDidUnload];
}

#pragma mark - Text Delegates

- (BOOL)textFieldShouldReturn:(UITextField*)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    __activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    __activeField = nil;
}

#pragma mark - Keyboard Events

- (void)keyboardWillShow:(NSNotification *)notif
{
    NSDictionary* info = [notif userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    CGRect bkgndRect = __activeField.superview.frame;
    bkgndRect.size.height += kbSize.height;
    [__activeField.superview setFrame:bkgndRect];
    [scrollView setContentOffset:CGPointMake(0.0, __activeField.frame.origin.y-kbSize.height) animated:YES];
}

- (void)keyboardWillHide:(NSNotification *)notif
{
    NSDictionary* info = [notif userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    CGRect bkgndRect = __activeField.superview.frame;
    bkgndRect.size.height -= kbSize.height;
    [__activeField.superview setFrame:bkgndRect];
    [scrollView setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
}

@end
