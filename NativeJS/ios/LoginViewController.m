//
//  LoginViewController.m
//  NativeJS
//
//  Created by 众陶联众陶联 on 17/3/11.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "LoginViewController.h"

#import "AppDelegate.h"
#import <React/RCTRootView.h>

//NSString *const UCALoginSuccessNotification = @"LoginSuccessNotification";
@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *ttfAccount;
@property (weak, nonatomic) IBOutlet UITextField *ttfPassword;


@end

@implementation LoginViewController

// MARK: - UIStoryboard相关

// 模仿登录成功
- (IBAction)loginSuccess:(id)sender {
  NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
  [center postNotificationName:@"LoginSuccessNotification" object:self userInfo:@{@"account": self.ttfAccount.text, @"password": self.ttfPassword.text}];
}

// 跳转到RN界面
- (IBAction)pushToUserInfo:(id)sender {
  
  AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
  RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:delegate.bridge
                                                   moduleName:@"NativeJS"
                                            initialProperties:nil];
  
  UIViewController *userInfoVC = [[UIViewController alloc] init];
  userInfoVC.view = rootView;
  
  [self.navigationController pushViewController:userInfoVC animated:true];
}


// MARK: - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
