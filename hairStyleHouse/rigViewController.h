//
//  rigViewController.h
//  hairStyleHouse
//
//  Created by jeason on 13-12-23.
//  Copyright (c) 2013年 jeason. All rights reserved.
//

#import <UIKit/UIKit.h>


#import <UIKit/UIKit.h>
#import "TencentOpenAPI/TencentOAuth.h"
#import "SinaWeibo.h"
#import "ASIHTTPRequest.h"
#define kAppKey             @"276585644"
#define kAppSecret          @"a71b4382aeda47dfbdd5925b4b407648"
#define kAppRedirectURI     @"http://www.faxingw.cn"
@class  dresserViewController;
@interface rigViewController : UIViewController<TencentLoginDelegate,TencentSessionDelegate,SinaWeiboDelegate,ASIHTTPRequestDelegate,SinaWeiboRequestDelegate>
{
    UIView* myInfoView;
    TencentOAuth* _tencentOAuth;
    SinaWeibo* _sinaweibo;
    NSArray* _permissions;
    NSString* imageUrl;
    NSString* type;
    NSString* access_token;
    NSString* userName;
    NSData* expirationDate;
    NSString* openId;
    
    NSString* sType;
    NSString* sImageUrl;
    NSString* sAccess_token;
    NSString* sUserName;
    NSString* sExpirationDate;
    NSString* sOpenId;
    NSString* backId;
    
    UIImageView* jiaZiaView;
    NSString* touxiangUrl;
    NSString* nameLabelStr;
    
    UIButton * QQButton;
    UIButton * sinaButton;
    
    id interface;
    SEL sucfun;
    SEL errfun;
    
    
    dresserViewController * dresserFatherController;
    NSString * _backsign;
    NSMutableArray * userInforArr;
    NSMutableDictionary * userInfor;
}
-(void)getBack:(id)inter andSuc:(SEL)suc andErr:(SEL)err;
@property(nonatomic,retain) TencentOAuth* tentenOAuth;
@property(nonatomic,retain) dresserViewController * dresserFatherController;
@property(nonatomic,retain) NSString * _backsign;
@property(nonatomic,retain) NSString * _hidden;
@property(nonatomic,retain) NSString * _leftButtonhidden;

@end
