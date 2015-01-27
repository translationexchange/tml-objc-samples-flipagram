//
//  NotificationsViewController.m
//  Flipagram
//
//  Created by Michael Berkovich on 1/23/15.
//  Copyright (c) 2015 Translation Exchange, Inc. All rights reserved.
//

#import "NotificationsViewController.h"
#import "UIViewController+Tml.h"

@interface NotificationsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIView *footerView;

@end

@implementation NotificationsViewController

- (void) localize {
    TmlLocalizeView(self.headerView);
    TmlLocalizeView(self.footerView);
    TmlLocalizeViewWithTokens(self.tableView, (@{@"count": @3}));
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2) return 30;
    return 55;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"SelfieTableViewCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"SelfieTableViewCell"];
        }
    }
    
    if (indexPath.row == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"FacebookTableViewCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"FacebookTableViewCell"];
        }
    }

    if (indexPath.row == 2) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"MoreTableViewCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MoreTableViewCell"];
        }
    }
    
    return cell;
}


@end
