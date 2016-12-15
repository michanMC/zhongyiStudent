//
//  MCToolsManage.h
//  MCCWYJ
//
//  Created by MC on 16/7/29.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MCToolsManage : NSObject

/*!
 @method
 @brief 判断字符是否为Emoji
 @discussion
 @param string 需要判断是否为emoji的字符
 @result 字符是否为Emoji
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;
/*!
 指定的文本改变颜色
 @method
 @str 整个原字符串
 @acolor 常态颜色
 @afont  文本的font
 @ordinaryColor 要改颜色
 @startnum 起点坐标
 @tonum  结束坐标
 @result butedString
 */

+(NSMutableAttributedString *)formatString:(NSString *)str textColor:(UIColor *)acolor font:(CGFloat )afont textordinaryColor:(UIColor*)ordinaryColor startNum:(NSInteger)startnum toNum:(NSInteger)tonum;

/*!
 @method
 @time 时间戳
 @result NSString(几天前、几小时前、几分钟前、几秒前)
 */

+(NSString*)daysAgoAgainst:(long long)time;
/*!
 @method
 @str
 @result md5加密(大写)
 */

+(NSString *) md5:(NSString *)str;

/*
 是否是车牌号码
 */
+(BOOL) isChePaiHao:(NSString *)cheNum;

//首位是否字母
+ (BOOL) isFirstChr:(NSString*)str;
//是否邮箱地址
+ (BOOL) isEmail:(NSString*)email;
//是否身份证件号码
+ (BOOL) isCardNum:(NSString *)strNum;
//字母数字结合
+ (BOOL) isTranNum:(NSString *)strNum;
//a-z\A-Z\!@#$&
+ (BOOL) isLimitChar:(NSString *)strNum;
//是否手机号码
+ (BOOL) isMobile:(NSString *)strNum;
//是否数字
+ (BOOL) isNumbericString:(NSString *)str;
//电话号码打****
+(NSString *)phonenumbel:(NSString *)num;
//身份号码打****
+(NSString *)Number:(NSString *)num;
//车牌****
+(NSString *)carNumbel:(NSString *)num;
/**
 时间戳转化为NSString
 NSString<-时间戳
 @time  时间戳
 @format @“yyyyMMddHHmmss”、yyyy-MM-dd HH:mm:ss(自定义类型)
 
 */
+(NSString*)getStringWithLong:(long long)time Format:(NSString*)format;
/*
 时间格式化
 NSString->时间戳
 */
+(NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;

//间隔天数
+(NSUInteger)daysAgo:(NSDate *) fromdate todate:(NSDate *) todate;
//间隔当前天数
+(NSUInteger)daysAgo:(NSDate *)currdate;

//午夜时间距今几天
+(NSUInteger)daysAgoAgainstMidnight:(NSDate *) mydate;

/**
 @method 获取指定宽度width,字体大小fontSize,字符串value的高度
 @param value 待计算的字符串
 @param fontSize 字体的大小
 @param Width 限制字符串显示区域的宽度
 @result float 返回的宽度
 */
+ (CGFloat) heightforString:(NSString *)value andHeight:(CGFloat)height fontSize:(CGFloat)fontSize;
/**
 ios7.0之后适用
 @method 获取指定宽度width,字体大小fontSize,字符串value的高度
 @param value 待计算的字符串
 @param fontSize 字体的大小
 @param Width 限制字符串显示区域的宽度
 @result float 返回的高度
 */
+ (CGFloat) heightforString:(NSString *)value andWidth:(CGFloat)width fontSize:(CGFloat)fontSize;

/**
 图片模糊化
 */
//加模糊效果，image是图片，blur是模糊度
+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur ;
/**
 *  压缩图片的大小(压缩之后图片将会变成jpg,因为jpg压缩图片的效率高于png的效率，故才用jpg的图片压缩方式)
 *  @parameter picData       需要压缩的图片
 *  @parameter compressBytes 指定压缩后的图片大小范围以下(在设置范围的时候最好事先找到最小零界值，因为一旦达到最小零界值就不再会被压缩)
 *
 */

// 返回虚线image的方法

+ (UIImage *)drawLineByImageView:(UIImageView *)imageView;
/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;



+(NSData *)compressPicQualityWith:(UIImage *)picImage andCompressBytesLow:(int)compressBytesLow;
/**
 *  压缩图片的尺寸
 *  @parameter orignalImage  需要压缩的图片
 *  @parameter compressSize  压缩的尺寸
 */

+(UIImage *)compressPicSizeWithOrignalImage:(UIImage *)orignalImage andCompressSize:(CGSize)compressSize;
/*
 *获取某类的私有变量
 */
-(NSMutableArray *)fromClassStr:(id)Str;
/*
 *str->（字典）对象
 */

+(id)analysis:(NSString*)str;
/*
判断字符串是否
 */
+(BOOL)IsJudgeExistStr:(NSString*)str JudgeStr:(NSString*)judgeStr;
@end
