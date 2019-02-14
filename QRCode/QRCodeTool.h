//
//  QRCodeTool.h
//  QRCode
//
//  Created by Zhang xiaosong on 2019/2/14.
//  Copyright © 2019 Zhang xiaosong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,CorrectionLevel)
{
    CorrectionLevel_L = 0,
    CorrectionLevel_M = 1,
    CorrectionLevel_Q = 2,
    CorrectionLevel_H = 3,
};

NS_ASSUME_NONNULL_BEGIN

@interface QRCodeTool : NSObject

/**
 二维码生成方式

 @param string 需要编码的字符串
 @param level 纠错水平
 @return UIImage
 */
+ (UIImage *)normalQRCodeWithString:(NSString *)string level:(CorrectionLevel)level;

@end

NS_ASSUME_NONNULL_END
