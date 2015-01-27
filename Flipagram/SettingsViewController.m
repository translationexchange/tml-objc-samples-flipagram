//
//  SettingsViewController.m
//  Flipagram
//
//  Created by Michael Berkovich on 1/23/15.
//  Copyright (c) 2015 Translation Exchange, Inc. All rights reserved.
//

#import "SettingsViewController.h"
#import "Tml.h"
#import "UIViewController+Tml.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, retain) NSArray *items;

@end

@implementation SettingsViewController

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.items = @[
                   @{
                       @"title": @"PLAYER SETTINGS",
                       @"items": @[
                               @{
                                   @"title":@"Play Sound",
                                   @"info": @"With Ringer",
                                   },
                               @{
                                   @"title": @"Auto-Play",
                                   @"info": @"Always"
                                   }
                               ]
                       },
                   @{
                       @"title": @"PHOTO SETTINGS",
                       @"items": @[
                               @{
                                   @"title": @"Photo Format",
                                   @"info": @"Crop to Fill"
                                   },
                               @{
                                   @"title": @"Photo Background Color",
                                   @"info": @"White"
                                   },
                               @{
                                   @"title": @"Auto-Save to Camera Roll",
                                   @"type": @"switch"
                                   },
                               ]
                       },
                   @{
                       @"title": @"",
                       @"items": @[
                           @{
                               @"title": @"Social Accounts",
                               },
                           @{
                               @"title": @"Notifications",
                               },
                       ]
                   },
                   @{
                       @"title": @"",
                       @"items": @[
                               @{
                                   @"title": @"Follow Us On Instagram",
                                   },
                               @{
                                   @"title": @"Follow Us on Facebook",
                                   },
                               @{
                                   @"title": @"Follow Us on Twitter",
                                   },
                               @{
                                   @"title": @"Flipagram Blog",
                                   },
                               ]
                       },
                   @{
                       @"title": @"",
                       @"items": @[
                               @{
                                   @"title": @"Libraries",
                                   },
                               @{
                                   @"title": @"FAQ",
                                   },
                               @{
                                   @"title": @"Terms of Use and Privacy Policy",
                                   },
                               @{
                                   @"title": @"Support",
                                   },
                               ]
                       },
                   @{
                       @"title": @"PURCHASES",
                       @"items": @[
                               @{
                                   @"title": @"Restore Purchases",
                                   },
                               @{
                                   @"title": @"Change Watermark Forever",
                                   },
                               ]
                       },
                @{
                       @"title": @"ACCOUNT",
                       @"items": @[
                               @{
                                   @"title": @"Log In",
                                   @"color": @"green"
                                   },
                               ]
                       },
                   @{
                       @"title": @"LOCALIZATION",
                       @"items": @[
                               @{
                                   @"title": @"Change Language",
                                   @"type": @"action"
                                   },
                               @{
                                   @"title": @"In-App Translations",
                                   @"type": @"action"
                                   },
                               @{
                                   @"title": @"Translator Tools",
                                   @"type": @"action"
                                   },
                               ]
                       },
                   ];
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *sectionHeader = [[UIView alloc] init];
    sectionHeader.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, tableView.frame.size.width, 20)];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor grayColor];
    NSDictionary *sec = (NSDictionary *) [self.items objectAtIndex:section];
//    label.text = TmlLocalizedString([sec objectForKey:@"title"]);
    TmlLocalizeViewWithLabel(label, [sec objectForKey:@"title"]);
    [sectionHeader addSubview:label];
    return sectionHeader;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
    }
    
    NSDictionary *section = (NSDictionary *) [self.items objectAtIndex:indexPath.section];
    NSDictionary *item =[[section objectForKey:@"items"] objectAtIndex:indexPath.row];
    
    TmlLocalizeViewWithLabel(cell.textLabel, [item objectForKey:@"title"]);
//    cell.textLabel.text = TmlLocalizedString([item objectForKey:@"title"]);
    cell.textLabel.font = [UIFont systemFontOfSize:12];

    if ([item objectForKey:@"info"])
//        cell.detailTextLabel.text = TmlLocalizedString([item objectForKey:@"info"]);
        TmlLocalizeViewWithLabel(cell.detailTextLabel, [item objectForKey:@"info"]);
    else if ([[item objectForKey:@"title"] isEqualToString:@"Change Language"])
        cell.detailTextLabel.text = [[self tmlCurrentLanguage] englishName];
    else
        cell.detailTextLabel.text = @"";
    
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12];

    
    if ([[item objectForKey:@"type"] isEqualToString:@"action"]) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    } else if ([[item objectForKey:@"type"] isEqualToString:@"switch"]) {
        cell.accessoryView = [[UISwitch alloc] init];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.accessoryView = nil;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 7) {
        UIViewController *rootViewController = [[[[UIApplication sharedApplication]delegate] window] rootViewController];
        if (indexPath.row == 0) {
            TmlChangeLanguage(rootViewController);
        } else if (indexPath.row == 1) {
            TmlToggleInAppTranslations(self);
        } else if (indexPath.row == 2) {
            TmlOpenTranslatorTools(rootViewController);
        }
        return;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.items count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *item = (NSDictionary *) [self.items objectAtIndex:section];
    return [item objectForKey:@"title"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    NSDictionary *item = (NSDictionary *) [self.items objectAtIndex:section];
    if ([[item objectForKey:@"title"] isEqualToString:@""])
        return 5;
    
    return 30;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *item = (NSDictionary *) [self.items objectAtIndex:section];
    return [[item objectForKey:@"items"] count];
}

- (void) localize {
    TmlLocalizeView(self.headerView);
    [self.tableView reloadData];
}


@end
