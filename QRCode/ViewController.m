//
//  ViewController.m
//  QRCode
//
//  Created by Zhang xiaosong on 2019/2/14.
//  Copyright © 2019 Zhang xiaosong. All rights reserved.
//https://www.jianshu.com/p/4be9cece8b81
//

#import "ViewController.h"
#import "QRCodeTool.h"


#define mScreenWidth  ([UIScreen mainScreen].bounds.size.width)
#define mScreenHeight  ([UIScreen mainScreen].bounds.size.height)


@interface ViewController ()

@property (nonatomic,strong)UIControl *touchControl;
@property (nonatomic,strong)UIImageView *codeImageView;

@end

@implementation ViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initInterface];
    
}

#pragma mark - internal methods

/**
 初始化子视图
 */
- (void)initInterface
{
    _touchControl = [[UIControl alloc] init];
    [_touchControl setBackgroundColor:UIColor.lightGrayColor];
    [self.view addSubview:_touchControl];
    [_touchControl setFrame:CGRectMake(0, 0, mScreenWidth, mScreenHeight)];
    [_touchControl setHidden:YES];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideQRCode)];
    [_touchControl addGestureRecognizer:tapGesture];
    
    _codeImageView = [[UIImageView alloc] init];
    [_touchControl addSubview:_codeImageView];
    [_codeImageView setFrame:CGRectMake(100, 100, 150, 150)];
    
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"生成二维码" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn setFrame:CGRectMake(44, 44, 160, 44)];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(qrClick1) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)qrClick1
{
    UIImage *image = [QRCodeTool normalQRCodeWithString:@"https://qr.alipay.com/bax052221qzlqvkdacv8009b" level:CorrectionLevel_H];
    [self showQRCodeWithImage:image];
}

/**
 展示二维码
 */
- (void)showQRCodeWithImage:(UIImage *)image
{
    [_touchControl setHidden:NO];
    [_codeImageView setImage:image];
}

/**
 隐藏二维码
 */
- (void)hideQRCode
{
    [_touchControl setHidden:YES];
}


@end
