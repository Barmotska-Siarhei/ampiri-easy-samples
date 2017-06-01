//
//  TableViewVC.m
//  ObjCSDKVerification
//
//  Created by Siarhei Barmotska on 20/02/2017.
//  All rights reserved.
//

#import "TableViewVC.h"
#import "TableViewCell.h"
#import <AmpiriSDK/Ampiri.h>

@interface TableViewVC ()

@property (strong) AMPTableViewStreamAdapter *adapter;
@end

@implementation TableViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.adapter = [[AmpiriSDK sharedSDK]
                    createStreamAdapterForTableView: self.tableView
                    parentViewController: self
                    adUnitId: @"7f900c7d-7ce3-4190-8e93-310053e70ca2"
                    templateType: AMPNativeAdsTemplateTypeList
                    templateCustomization: ^(AMPTemplateCustomizationObject
                                             *templateCustomizationObject) {
                        templateCustomizationObject.ampCTABorderWidth = 1;
                        templateCustomizationObject.ampCTACornerRadius = 5;
                    }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView amp_dequeueReusableCellWithIdentifier:NSStringFromClass([TableViewCell class]) forIndexPath:indexPath];
    
    cell.nameLabel.text = [NSString stringWithFormat:@"#%ld", indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

@end
