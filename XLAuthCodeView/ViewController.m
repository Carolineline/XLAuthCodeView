//
//  ViewController.m
//  XLAuthCodeView
//
//  Created by 晓琳 on 17/6/28.
//  Copyright © 2017年 xiaolin.han. All rights reserved.
//

#import "ViewController.h"
#import "XLAuthCodeView.h"
@interface ViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *authTextFiled;

@property (nonatomic, strong) XLAuthCodeView *authCodeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"验证码";
    [self.view addSubview:self.authTextFiled];
    [self.view addSubview:self.authCodeView];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (!textField.text) {
        return NO;
    }
    NSString *message = nil;
    NSString *authStr = self.authCodeView.authCodeStr;
    
    BOOL result = [textField.text compare:authStr options:NSDiacriticInsensitiveSearch];//忽略大小写
    if (textField.text && result) {
        message = @"验证成功";
    }else{
        message = @"验证失败";
    }
    UIAlertController *aler = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.authTextFiled.text = @"";
        [self.authCodeView reloadAuthCode];
        
    }];
    [aler addAction:action];
    [self presentViewController:aler animated:YES completion:nil];
    return YES;
    
}


- (XLAuthCodeView *)authCodeView {
    if (!_authCodeView) {
        _authCodeView = [[XLAuthCodeView alloc] initWithFrame:CGRectMake(0, 200, 200, 50)];
        _authCodeView.center = self.view.center;
    }
    return _authCodeView;
}

- (UITextField *)authTextFiled {
    if (!_authTextFiled) {
        _authTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(100, 150, 200, 40)];
        _authTextFiled.borderStyle = UITextBorderStyleRoundedRect;
        _authTextFiled.font = [UIFont systemFontOfSize:16];
        _authTextFiled.placeholder = @"请输入验证码";
        _authTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
        _authTextFiled.backgroundColor = [UIColor clearColor];
        _authTextFiled.textAlignment = NSTextAlignmentCenter;
        _authTextFiled.returnKeyType = UIReturnKeyDone;
        _authTextFiled.delegate = self;
    }
    return _authTextFiled;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
