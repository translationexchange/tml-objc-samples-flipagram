//
//  SecondViewController.m
//  Flipagram
//
//  Created by Michael Berkovich on 1/23/15.
//  Copyright (c) 2015 Translation Exchange, Inc. All rights reserved.
//

#import "ExploreViewController.h"

@interface ExploreViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ExploreViewController

- (IBAction)hideKeyboard:(id)sender {
    [self.searchBar resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.searchBar.layer.borderWidth = 1;
    self.searchBar.layer.borderColor = [self.view.backgroundColor CGColor];
    
    long width = self.view.frame.size.width;
    long height = width  * 4878 / 640 + 190;
    
    self.imageView.frame = CGRectMake(0, 0, width, height);
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    
    self.scrollView.contentSize = self.imageView.frame.size;
}

@end
