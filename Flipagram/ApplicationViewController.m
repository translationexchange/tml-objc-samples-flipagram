//
//  ApplicationViewController.m
//  Flipagram
//
//  Created by Michael Berkovich on 1/23/15.
//  Copyright (c) 2015 Translation Exchange, Inc. All rights reserved.
//

#import "ApplicationViewController.h"
#import "Tml.h"
#import "UIViewController+Tml.h"

@interface ApplicationViewController ()

@end

@implementation ApplicationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(localize)
                                                 name:TmlLanguageChangedNotification
                                               object:self.view.window];
}

- (void) localize {
    TmlLocalizeView(self.view);
}

- (IBAction)changeLanguage:(id)sender {
    TmlChangeLanguage(self.tabBarController);
}

- (IBAction)toggleTranslations:(id)sender {
    TmlToggleInAppTranslations(self.tabBarController);
}

@end
