//
//  Uitilities.m
//  ILustration
//
//  Created by NguyenDinh.Long on 7/28/16.
//  Copyright © 2016 NguyenDinh.Long. All rights reserved.
//

#import "Uitilities.h"

@implementation Uitilities

+ (void)showDialogWitTitle:(NSString *)title message:(NSString *)message view:(UIViewController *)view{
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:title
                                 message:message
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okButton = [UIAlertAction
                               actionWithTitle:@"OK!"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   [view dismissViewControllerAnimated:YES completion:nil];
                               }];
    
    
    [alert addAction:okButton];
    
    [view presentViewController:alert animated:YES completion:nil];
}


@end
