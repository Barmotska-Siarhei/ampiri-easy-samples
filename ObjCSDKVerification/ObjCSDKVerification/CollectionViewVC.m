//
//  CollectionViewVC.m
//  ObjCSDKVerification
//
//  Created by Siarhei Barmotska on 20/02/2017.
//  All rights reserved.
//

#import "CollectionViewVC.h"
#import "CollectionViewCell.h"
#import <AmpiriSDK/AmpiriSDK.h>


@interface CollectionViewVC () <UICollectionViewDelegateFlowLayout>

@property (strong) AMPCollectionViewStreamAdapter *adapter;
@end

@implementation CollectionViewVC

static NSString * const reuseIdentifier = @"CollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.adapter = [[AmpiriSDK sharedSDK]
                    addLocationControlToCollectionView: self.collectionView
                    parentViewController: self
                    adUnitId: @"7f900c7d-7ce3-4190-8e93-310053e70ca2"
                    templateType: AMPNativeAdsTemplateTypeInFeed
                    delegate: nil
                    templateCustomization: ^(AMPTemplateCustomizationObject
                                             *templateCustomizationObject) {
                        templateCustomizationObject.ampCTABorderWidth = 1;
                        templateCustomizationObject.ampCTACornerRadius = 5;
                    }];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView amp_dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.nameLabel.text = [NSString stringWithFormat:@"#%ld", indexPath.row];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((self.collectionView.frame.size.width - 2) / 2 , 40);
}

@end
