//
//  ApplicationViewController.h
//  Flipagram
//
//  Created by Michael Berkovich on 1/23/15.
//  Copyright (c) 2015 Translation Exchange, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApplicationViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *headerView;

- (void) localize;

- (IBAction)changeLanguage:(id)sender;

- (IBAction)toggleTranslations:(id)sender;

@end
