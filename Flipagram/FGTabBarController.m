//
//  FGTabBarController.m
//  Flipagram
//
//  Created by Michael Berkovich on 1/23/15.
//  Copyright (c) 2015 Translation Exchange, Inc. All rights reserved.
//

#import "FGTabBarController.h"
#import "ApplicationViewController.h"

@interface FGTabBarController ()

@end

@implementation FGTabBarController 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    
    [self setTabBarImage:[NSString stringWithFormat:@"tabs%d.png", 1]];
}

- (void) viewDidAppear:(BOOL)animated {
    if (self.selectedIndex == 0) {
        [self setTabBarImage:[NSString stringWithFormat:@"tabs%d.png", 1]];
        ApplicationViewController *controller = [self.viewControllers objectAtIndex:0];
        [controller localize];
    }
}

- (void) setTabBarImage:(NSString *) imageName {
    for(UIView *view in self.tabBar.subviews) {
        if([view isKindOfClass:[UIImageView class]]) {
            [view removeFromSuperview];
        }
    }
    
    UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    view.frame = self.tabBar.bounds;
    view.contentMode = UIViewContentModeScaleToFill;
    [self.tabBar insertSubview:view atIndex:0];
    
    [self.tabBar setNeedsDisplay];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    NSUInteger index = [[self viewControllers] indexOfObject:viewController];
    
    if (index == 2) {
        [self performSegueWithIdentifier:@"MomentsViewController" sender:self];
        return false;
    }
    
    [self setTabBarImage:[NSString stringWithFormat:@"tabs%lu.png", index+1]];
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    ApplicationViewController *controller = nil;
    
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigation = (UINavigationController *) viewController;
        controller = (ApplicationViewController *) [[navigation viewControllers] objectAtIndex:0];
    } else {
        controller = (ApplicationViewController *) viewController;
    }
    
    [controller localize];
}

@end
