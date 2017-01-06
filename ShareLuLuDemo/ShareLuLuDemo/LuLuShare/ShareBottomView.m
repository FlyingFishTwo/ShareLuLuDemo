//
//  ShareBottomView.m
//  DMR
//
//  Created by 雨 on 16/11/30.
//  Copyright © 2016年 wangzitao. All rights reserved.
//

#import "ShareBottomView.h"
#import "ShareItemCell.h"
#import "UIColor+HEX.h"
//#import <Masonry/Masonry.h>
#import "Masonry.h"
#define WeakSelf(weakSelf) __weak typeof(&*self)weakSelf = self
#define BXScreenH          [UIScreen mainScreen].bounds.size.height
#define Screen_width          [UIScreen mainScreen].bounds.size.width


#define kSHARE_TOP 28
#define kSHARE_EDGE 25
#define kSHARE_HEIGHT 68
#define kSHARE_CANCEL 45
#define kSHARE_LEFT 9

static NSString *const CellID = @"ShareItemCell";

@interface ShareBottomView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) NSMutableArray *itemS;

@end
@implementation ShareBottomView

- (instancetype)initWithShareItems:(NSArray *)items {
    self = [super init];
    if (self) {
        [self initDataWithItems:items];
        [self initUI];
        [self initLayouts];
    }
    return self;
}

- (void)initDataWithItems:(NSArray *)items {
    _itemS = [NSMutableArray arrayWithArray:items];
}

- (void)initUI {
    [self addSubview:self.collectionView];
    [self addSubview:self.cancelButton];
}

- (void)initLayouts {
    WeakSelf(weakSelf);
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.and.right.equalTo(weakSelf);
        make.height.mas_equalTo(@((kSHARE_TOP+kSHARE_HEIGHT)*2+kSHARE_EDGE));
    }];
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.collectionView.mas_bottom);
        make.left.right.and.bottom.equalTo(weakSelf);
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect rect = self.frame;
    rect.size.width = Screen_width;
    rect.size.height = (kSHARE_TOP+kSHARE_HEIGHT)*2+kSHARE_EDGE+kSHARE_CANCEL;
    self.frame = rect;
}

#pragma mark - private

- (void)cancelEvent:(UIButton *)button {
    
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((Screen_width-kSHARE_LEFT*2-2)/4, kSHARE_HEIGHT);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(kSHARE_TOP, kSHARE_LEFT, kSHARE_TOP, kSHARE_LEFT);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return kSHARE_EDGE;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _itemS.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ShareItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.itemType = _itemS[indexPath.item];
    
    return cell;
}

#pragma mark - property

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[ShareItemCell class] forCellWithReuseIdentifier:CellID];
        
        
//        _collectionView.backgroundColor = [UIColor colorWithHex:0xf0efef];
        
        _collectionView.backgroundColor = [UIColor colorWithHexString:@"#f9f9f9"];

        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.scrollEnabled = NO;
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout {
    if (_flowLayout == nil) {
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _flowLayout;
}

- (UIButton *)cancelButton {
    if (_cancelButton == nil) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
//        [_cancelButton setTitleColor:[UIColor colorWithHex:0x363636] forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        _cancelButton.titleLabel.font = [UIFont fontWithName:@"STHeitiSC-Light" size:13];
        [_cancelButton addTarget:self action:@selector(cancelEvent:) forControlEvents:UIControlEventTouchUpInside];
//        _cancelButton.backgroundColor = [UIColor colorWithHex:0xffffff];
        _cancelButton.backgroundColor = [UIColor colorWithHexString:@"#e3e3e3"];

    }
    return _cancelButton;
}

@end
