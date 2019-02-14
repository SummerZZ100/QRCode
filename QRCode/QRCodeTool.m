//
//  QRCodeTool.m
//  QRCode
//
//  Created by Zhang xiaosong on 2019/2/14.
//  Copyright © 2019 Zhang xiaosong. All rights reserved.
//

#import "QRCodeTool.h"

@implementation QRCodeTool

/**
 二维码生成方式
 
 @param string 需要编码的字符串
 @param level 纠错水平
 @return UIImage
 */
+ (UIImage *)normalQRCodeWithString:(NSString *)string level:(CorrectionLevel)level
{
    //创建名为"CIQRCodeGenerator"的CIFilter
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    //将filter所有属性设置为默认值
    [filter setDefaults];
    
    //将所需尽心转为UTF8的数据，并设置给filter
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];
    
    //设置二维码的纠错水平，越高纠错水平越高，可以污损的范围越大
    /*
     * L: 7%
     * M: 15%
     * Q: 25%
     * H: 30%
     */
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];
    
    //拿到二维码图片，此时的图片不是很清晰，需要二次加工
    CIImage *outPutImage = [filter outputImage];
//    [outPutImage.CGImage ]
    
    UIImage *image = [[UIImage alloc] initWithCIImage:outPutImage];
    return image;
}

@end
