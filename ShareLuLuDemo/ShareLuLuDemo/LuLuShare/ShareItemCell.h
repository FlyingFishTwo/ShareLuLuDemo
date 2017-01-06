//
//  ShareItemCell.h
//  DMR
//
//  Created by 雨 on 16/11/30.
//  Copyright © 2016年 wangzitao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareItems.h"

@interface ShareItemCell : UICollectionViewCell

@property (nonatomic, copy) ItemClick clicked;
@property (nonatomic, strong) NSString *itemType;
@property (nonatomic, assign) BOOL isCollection;

@end
