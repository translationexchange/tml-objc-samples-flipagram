//
//  MomentsViewController.m
//  Flipagram
//
//  Created by Michael Berkovich on 1/23/15.
//  Copyright (c) 2015 Translation Exchange, Inc. All rights reserved.
//

#import "MomentsViewController.h"
#import "Tml.h"
#import "UIViewController+Tml.h"

@interface MomentsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;

@end

@implementation MomentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self localize];
    });
}

- (void) localize {
    
    TmlLocalizeViewWithTokens(self.label1, (@{@"count": @5, @"vieweing_user": @{@"gender": @"male"}}));
    
    TmlLocalizeViewWithLabelAndTokens(self.label2,
                                      @"You have [mark: {count | a new message, #count# new messages }].",
                                      (@{@"count": @2,
                                         @"vieweing_user": @{@"gender": @"female"},
                                         @"mark": @{
                                                 @"color": @"red"
                                                 }
                                         }));
    
    TmlLocalizeViewWithLabelAndTokens(self.label3,
                                      @"[bold: {user}] uploaded [bold: {count || photo}] to [link: {user | his, her} photo album].",
                                      (@{@"count": @1,
                                         @"user": @{@"value": @"Alex", @"gender": @"male"},
                                         @"bold": @{
                                                 @"font": @{
                                                         @"name": @"system",
                                                         @"size": @16,
                                                         @"type": @"bold"
                                                         },
                                                 },
                                         @"link": @{
                                                 @"underline": @{
                                                         @"style": @"single",
                                                         @"color": @"blue"
                                                         },
                                                 @"color": @"blue"
                                                 }
                                         }));
    
    TmlLocalizeViewWithLabelAndTokens(self.label4,
                                      @"[bold: {actor}] tagged [bold: {target}] in [bold: {count || photo}].",
                                      (@{@"count": @5,
                                         @"actor": @{@"value": TmlLocalizedString(@"Michael"), @"gender": @"male"},
                                         @"target": @{@"value": TmlLocalizedString(@"Anna"), @"gender": @"female"},
                                         @"bold": @{
                                                 @"font": @{
                                                         @"name": @"system",
                                                         @"size": @16,
                                                         @"type": @"bold"
                                                         },
                                                 },
                                         }));
    
    TmlLocalizeViewWithLabelAndTokens(self.label5,
                                      @"[bold: [green: Thank you] for [red: signing up]] with [purple: our service].",
                                      (@{@"count": @5,
                                         @"red": @{ @"color": [UIColor redColor] },
                                         @"purple": @{ @"color": [UIColor purpleColor] },
                                         @"green": @{ @"color": [UIColor greenColor] },
                                         @"bold": @{
                                                 @"font": @{
                                                         @"name": @"system",
                                                         @"size": @20,
                                                         @"type": @"bold"
                                                         },
                                                 },
                                         }));
}

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
