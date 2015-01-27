//
//  ProfileViewController.m
//  Flipagram
//
//  Created by Michael Berkovich on 1/23/15.
//  Copyright (c) 2015 Translation Exchange, Inc. All rights reserved.
//

#import "ProfileViewController.h"
#import "UIViewController+Tml.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self localize];
    });
}

@end
