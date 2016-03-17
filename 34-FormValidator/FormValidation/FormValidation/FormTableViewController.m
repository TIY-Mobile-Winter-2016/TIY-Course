//
//  FormTableViewController.m
//  FormValidation
//
//  Created by Phil Wright on 3/16/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "FormTableViewController.h"

@interface FormTableViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextField *trackTextField;
@property (weak, nonatomic) IBOutlet UITextField *albumTextField;
@end

@implementation FormTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.artistTextField becomeFirstResponder];
}

#pragma mark - Text field delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL returnValue = NO;
    
    if (textField == self.artistTextField) {
        if (![self.artistTextField.text isEqualToString:@""])
        {
            returnValue = YES;
            [self.albumTextField becomeFirstResponder];
        }
    }
    else if (textField == self.albumTextField) {
        if (![self.albumTextField.text isEqualToString:@""])
        {
            returnValue = YES;
            [self.trackTextField becomeFirstResponder];
        }
    }
    else if (textField == self.trackTextField) {
        if (![self.trackTextField.text isEqualToString:@""])
        {
            returnValue = YES;
            [textField resignFirstResponder];
        }
    }
    
    if (returnValue == NO) {
        self.tableView.backgroundColor = [UIColor redColor];
    }
    else {
        self.tableView.backgroundColor = [UIColor whiteColor];
    }
    return returnValue;
}

@end
