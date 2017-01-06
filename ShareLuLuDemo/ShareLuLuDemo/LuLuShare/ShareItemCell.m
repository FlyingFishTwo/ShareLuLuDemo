//
//  ShareItemCell.m
//  DMR
//
//  Created by 雨 on 16/11/30.
//  Copyright © 2016年 wangzitao. All rights reserved.
//

#import "ShareItemCell.h"
#import "UIColor+HEX.h"
//#import <Masonry/Masonry.h>
#import "Masonry.h"
#define WeakSelf(weakSelf) __weak typeof(&*self)weakSelf = self


@interface ShareItemCell ()

@property (nonatomic, strong) UIButton *itemButton;
@property (nonatomic, strong) UILabel *itemLabel;

@end
@implementation ShareItemCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
        [self initUI];
        [self initLayouts];
    }
    return self;
}

- (void)initData {
    _itemType = @"";
    _isCollection = NO;
}

- (void)initUI {
    [self.contentView addSubview:self.itemButton];
    [self.contentView addSubview:self.itemLabel];
}

- (void)initLayouts {
    WeakSelf(weakSelf);
    [_itemButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.centerX.equalTo(weakSelf.contentView);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    [_itemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.bottom.equalTo(weakSelf.contentView);
        make.height.greaterThanOrEqualTo(@0);
    }];
}

#pragma mark - private

- (void)itemClicked:(UIButton *)sender {
    if (self.clicked) {
        self.clicked(_itemType);
    }
}

- (void)resumeContent {
    WeakSelf(weakSelf);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *img = [UIImage imageNamed:[self itemImgName]];
        NSString *itemContent = [self itemContentText];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.itemButton setBackgroundImage:img forState:UIControlStateNormal];
            weakSelf.itemLabel.text = itemContent;
        });
    });
}

- (NSString *)itemContentText {
    NSString *itemContent = @"";
    if ([_itemType isEqual:ShareItemTypeWechatSession]) {
        itemContent = ShareItemTypeWechatSessionCN;
    } else if ([_itemType isEqual:ShareItemTypeWechatTimeline]) {
        itemContent = ShareItemTypeWechatTimelineCN;
    } else if ([_itemType isEqual:ShareItemTypeQQ]) {
        itemContent = ShareItemTypeQQCN;
    } else if ([_itemType isEqual:ShareItemTypeQzone]) {
        itemContent = ShareItemTypeQzoneCN;
    } else if ([_itemType isEqual:ShareItemTypeSina]) {
        itemContent = ShareItemTypeSinaCN;
    } else if ([_itemType isEqual:ShareItemTypeCollection]) {
        itemContent = ShareItemTypeCollectionCN;
    } else if ([_itemType isEqual:ShareItemTypeReport]) {
        itemContent = ShareItemTypeReportCN;
    }
    
    return itemContent;
}

- (NSString *)itemImgName {
    NSString *imgName = @"";
    if ([_itemType isEqual:ShareItemTypeWechatSession]) {
        imgName = ShareItemTypeWechatSessionIN;
    } else if ([_itemType isEqual:ShareItemTypeWechatTimeline]) {
        imgName = ShareItemTypeWechatTimelineIN;
    } else if ([_itemType isEqual:ShareItemTypeQQ]) {
        imgName = ShareItemTypeQQIN;
    } else if ([_itemType isEqual:ShareItemTypeQzone]) {
        imgName = ShareItemTypeQzoneIN;
    } else if ([_itemType isEqual:ShareItemTypeSina]) {
        imgName = ShareItemTypeSinaIN;
    } else if ([_itemType isEqual:ShareItemTypeCollection]) {
        
        if (_isCollection) {
            imgName = ShareItemTypeCollectionedIN;
        } else {
            imgName = ShareItemTypeCollectionIN;
        }
        
    } else if ([_itemType isEqual:ShareItemTypeReport]) {
        imgName = ShareItemTypeReportIN;
    }
    
    return imgName;
}

#pragma mark - overwrite

- (void)setItemType:(NSString *)itemType {
    _itemType = itemType;
    [self resumeContent];
}

- (void)setIsCollection:(BOOL)isCollection {
    _isCollection = isCollection;
    [self resumeContent];
}

#pragma mark - property

- (UIButton *)itemButton {
    if (_itemButton == nil) {
        _itemButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_itemButton addTarget:self action:@selector(itemClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _itemButton;
}

- (UILabel *)itemLabel {
    if (_itemLabel == nil) {
        _itemLabel = [[UILabel alloc]init];
        _itemLabel.font = [UIFont fontWithName:@"STHeitiSC-Light" size:13];
        
        
//        _itemLabel.textColor = [UIColor colorWithHex:0x363636];
        _itemLabel.textColor = [UIColor redColor];

        
        
        _itemLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _itemLabel;
}

@end
