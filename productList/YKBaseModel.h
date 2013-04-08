//
//  YKBaseModel.h
//  YKModule
//
//  Created by TFH on 13-4-1.
//  Copyright (c) 2013年 YEK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YKEntity : NSObject
-(void) setAttributeValue:(NSString*) v forKey:(NSString*) akey;
-(NSString*) attributeValueForKey:(NSString*) akey;

@end





/*!
 尺寸
 */
@interface YKProductSize : YKEntity
@property (strong) NSString* sizeId;
@property (strong) NSString* sizeName;
@property (strong) NSString* sku;
@property (strong) NSString* stock;
@property (strong) NSString* marketPrice;
@property (strong) NSString* salePrice;
@end



typedef NSMutableArray YKProductSizeList;
typedef NSMutableArray YKImageList;

/*!
 花色对应的尺码
 */
@interface YKProductColor : YKEntity
@property (strong) NSString* colorId;
@property (strong) NSString* colorName;
@property (strong) NSString* colorUrl;
@property (strong) NSString* marketPrice;
@property (strong) NSString* salePrice;
@property (strong) YKImageList* imageList;
@property (strong) YKProductSizeList* sizeList;


@end

typedef NSMutableArray YKProductColorList;


/*!
 商品
 */
@interface YKProduct  : YKEntity
@property (strong) NSString* productId;
@property (strong) NSString* type;
@property (strong) NSString* imageUrl;
@property (strong) NSString* gridUrl; //??
@property (strong) NSString* marketprice;
@property (strong) NSString* salePrice;
@property (strong) NSString* totalPrice;
@property (strong) NSString* count;
@property(strong) NSString* categoryId;
@property(strong) NSString* pattern;
@property(strong) NSString* name;
@property(strong) NSString* desc;
@property(strong) YKProductColorList* colorList;


@end


@interface YKCategory  : YKEntity
@property (strong) NSString* cid;
@property (strong) NSString* name;
@property (strong) NSString* catIcon;
@property (strong) NSArray* subCategory;
@end

typedef NSMutableArray YKCategoryList;


@interface YKProductList : YKEntity
@property (assign) int totalCount;
@property (strong) NSMutableArray* productList;
@property (strong) YKCategoryList* filterCategoryList;
@property (strong) YKProductColorList* filterColorList;
@property (strong) YKProductSizeList* filterSizeList;
@end

///*!
// 筛选
// */
//@interface YKFilter : YKEntity
//@property (strong) YKCategoryList* categoryList;
//@property (strong) YKProductColorList* colorList;
//@property (strong) YKProductSizeList* sizeList;
//@end
//
//typedef NSMutableArray YKFilterList;


/*!
 地址
 */
@interface YKAddress  : YKEntity
@property (strong) NSString* addressId;
@property (strong) NSString* receiverName;
@property (strong) NSString* provinceId;
@property (strong) NSString* provinceName;
@property (strong) NSString* cityId;
@property (strong) NSString* cityName;
@property (strong) NSString* areaId;
@property (strong) NSString* areaName;
@property (strong) NSString* streetDetail; /*!< 街道地址 */
@property (strong) NSString* zipCode;
@property (strong) NSString* mobile;
@property (strong) NSString* phone;
@property (strong) NSString* email;
@end

typedef NSMutableArray YKAddressList;


/*!
 支付方式
 */
@interface YKPayWay : YKEntity

@end
typedef NSMutableArray YKPayWayList;


/*!
 送货时间
 */
@interface YKSendTime : YKEntity

@end

typedef NSMutableArray YKSendTimeList;

/*!
 订单
 */
@interface YKOrder  : YKEntity
@property (strong) NSString* orderId;
@property (strong) NSString* orderTime;
@property (strong) NSString* userId;
@property (strong) NSString* orderStatus;
@property (strong) NSString* payId;
@property (strong) NSString* payStatus;
@property (strong) NSString* dlyId;
@property (strong) NSString* dlyName;
@property (strong) NSString* dlyStatus;

@property (strong) NSString* totalPrice;
@property (strong) NSString* dlyPrice;
@property (strong) NSString* totalPayablePrice;
@property (strong) YKPayWay* payWay;
@property (strong) YKSendTime* sendTime;
@property (strong) YKAddress* address;

@property (strong) NSArray* payWayList;//?
@property (strong) NSArray* sendTimeList;//?
@property (strong) NSArray* addressList;//?
@property (strong) NSArray* productList;

@end

typedef NSMutableArray  YKOrderList;


/*!
 首页 TODO:EXT
 */
@interface YKHome  : YKEntity
@property(strong) NSArray* topicArray;
@property(strong) NSString* htmlContent;
@end

@interface YKTopic  : YKEntity
@end

/*!
 购物车
 */
@interface YKCart  : YKEntity
@property (strong) NSString* number;
@property (strong) NSString* totalMarketPrice;
@property (strong) NSString* totalSalePrice;
@property (strong) NSString* totalPayablePrice;

@property(strong) NSArray* productList;
@end


@interface YKKeyword  : YKEntity

@end

/*!
 秒杀
 */
@interface YKSecKill  : YKEntity

@property (strong) NSString* secKillId;
@property (strong) NSString* type;
@property (strong) NSString* content;
@property (strong) NSString* imageUrl;
@property (strong) NSString* startTime;
@property (strong) NSString* endTime;

@end



@interface YKGroup  : YKEntity

@property (strong) NSString* groupId;
@property (strong) NSString* type;
@property (strong) NSString* content;
@property (strong) NSString* imageUrl;
@property (strong) NSString* satisfyNumber;
@property (strong) NSString* startTime;
@property (strong) NSString* endTime;

@end


/*!
 用户信息
 */
@interface YKUser  : YKEntity
@property (strong) NSString* name;
@property (strong) NSString* userId;
@property (strong) NSString* level;
@property (strong) NSString* email;
@property (strong) NSString* birthday;
@property (strong) NSString* token;

@end


/*!
 品牌
 */
@interface YKBrand  : YKEntity

@property (strong) NSString* brandId;
@property (strong) NSString* title;
@property (strong) NSString* content;
@property (strong) NSString* imageUrl;

@end
typedef NSMutableArray YKBrandList;


/*!
 活动，满增，满减
 */
@interface YKActivity : YKEntity

@property (strong) NSString* title;
@property (strong) NSString* activityId;
@property (strong) NSString* type;
@property (strong) NSString* content;
@property (strong) NSString* imageUrl;
@property (strong) NSString* startTime;
@property (strong) NSString* endTime;

@end

typedef NSMutableArray YKActivityList;



/*!
 通知
 */
@interface YKNotice : YKEntity

@property (strong) NSString* noticeId;
@property (strong) NSString* title;
@property (strong) NSString* content;
@property (strong) NSString* imageUrl;
@property (strong) NSString* time;

@end
typedef NSMutableArray YKNoticeList;

/*!
 帮助信息
 */
@interface YKHelp : YKEntity
@property (strong) NSString* title;
@property (strong) NSString* content;
@property (strong) NSString* imageUrl;
@end

typedef NSMutableArray YKHelpList;

/*!
 版本检测
 */
@interface YKUpdate : YKEntity

@property (strong) NSString* currentVersion;
@property (strong) NSString* newestVersion;
@property (strong) NSString* isNeedUpdate;
@property (strong) NSString* updateType;
@property (strong) NSString* updateUrl;
@property (strong) NSString* updateMessage;

@end



