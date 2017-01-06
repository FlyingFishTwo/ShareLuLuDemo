//
//  ShareItems.h
//  DMR
//
//  Created by 雨 on 16/11/30.
//  Copyright © 2016年 wangzitao. All rights reserved.
//

#ifndef ShareItems_h
#define ShareItems_h

typedef enum {
    
    DMRNewShare_H5,//bannerH5
    DMRNewShare_MallDetailH5,//商城H5详情
    DMRNewShare_ProductDetail,//商品详情
    DMRNewShare_ShopTopic,//商城专题页
    DMRNewShare_TweetDetail,//帖子详情
    DMRNewShare_TweetShareCommentDetail,//晒图评论详情
    DMRNewShare_TweetShareDetail,//晒图详情
    DMRNewShare_CC,//CC-->(举报+收藏)
    DMRNewShare_PC,//PC端-->(举报+收藏)
    DMRNewShare_Mobile, //手机端-->(举报+收藏)
    DMRNewShare_Forecast,//直播预告
    
} DMR_NewShareType;

typedef enum : NSUInteger {
    
    DMR_ShareItemTypeWechatSession,//微信好友
    DMR_ShareItemTypeWechatTimeline,//微信朋友圈
    DMR_ShareItemTypeQQ,//QQ
    DMR_ShareItemTypeQzone,//QQ空间
    DMR_ShareItemTypeSina,//新浪微博
    DMR_ShareItemTypeCollection,//收藏
    DMR_ShareItemTypeReport,//举报
    
} DMR_ShareItemType;

typedef void(^ItemClick)(NSString *type);//platform
typedef void(^UnInstallAlertEvent)();

//platform
static NSString * const ShareItemTypeWechatSession = @"ShareItemTypeWechatSession";//微信好友
static NSString * const ShareItemTypeWechatTimeline = @"ShareItemTypeWechatTimeline";//朋友圈
static NSString * const ShareItemTypeQQ = @"ShareItemTypeQQ";//QQ
static NSString * const ShareItemTypeQzone = @"ShareItemTypeQzone";//QQ空间
static NSString * const ShareItemTypeSina = @"ShareItemTypeSina";//新浪微博
static NSString * const ShareItemTypeCollection = @"ShareItemTypeCollection";//收藏
static NSString * const ShareItemTypeReport = @"ShareItemTypeReport";//举报

//imageName
static NSString * const ShareItemTypeWechatSessionIN = @"icon_share_wx";
static NSString * const ShareItemTypeWechatTimelineIN = @"icon_share_friends";
static NSString * const ShareItemTypeQQIN = @"icon_share_qq";
static NSString * const ShareItemTypeQzoneIN = @"icon_share_qqzone";
static NSString * const ShareItemTypeSinaIN = @"icon_share_sina";
static NSString * const ShareItemTypeCollectionIN = @"icon_share_collection";
static NSString * const ShareItemTypeReportIN = @"icon_share_warning";

static NSString * const ShareItemTypeCollectionedIN = @"icon_share_collectioned";

//content
static NSString * const ShareItemTypeWechatSessionCN = @"微信好友";
static NSString * const ShareItemTypeWechatTimelineCN = @"朋友圈";
static NSString * const ShareItemTypeQQCN = @"QQ";
static NSString * const ShareItemTypeQzoneCN = @"QQ空间";
static NSString * const ShareItemTypeSinaCN = @"新浪微博";
static NSString * const ShareItemTypeCollectionCN = @"收藏";
static NSString * const ShareItemTypeReportCN = @"举报";

//unInstall
static NSString * const ShareItemUnInstallQQ = @"你还未安装“QQ”，试试其他途径分享～";
static NSString * const ShareItemUnInstallWechat = @"你还未安装“微信”，试试其他途径分享～";
static NSString * const ShareItemUnInstallSina = @"你还未安装“微博”，试试其他途径分享～";

//defaultShareImage
static NSString * const ShareDefaultImage = @"icon180";

//Notification---->>>collection
static NSString *const ShareAddCollectionSuccessNoti = @"ShareAddCollectionSuccessNoti";
static NSString *const ShareCancelCollectionSuccessNoti = @"ShareCancelCollectionSuccessNoti";

//Notification---->>>unInstall
static NSString *const ShareItemUnInstallNoti = @"ShareItemUnInstallNoti";

//Notification---->>>hiddenBottom
static NSString *const ShareBottomViewHidden = @"ShareBottomViewHidden";





#endif /* ShareItems_h */
