//
//  XLAuthCodeView.h
//  XLAuthCodeView
//
//  Created by 晓琳 on 17/6/28.
//  Copyright © 2017年 xiaolin.han. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLAuthCodeView : UIView

@property (strong, nonatomic) NSArray *dataArray;//字符素材数组

@property (strong, nonatomic) NSMutableString *authCodeStr;//验证码字符串

- (void)reloadAuthCode;//获取验证码
@end
