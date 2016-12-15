//
//  MCToolsManage.m
//  MCCWYJ
//
//  Created by MC on 16/7/29.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MCToolsManage.h"
#import <Accelerate/Accelerate.h>

@implementation MCToolsManage



+ (BOOL)stringContainsEmoji:(NSString *)string
{
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}
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

+(NSMutableAttributedString *)formatString:(NSString *)str textColor:(UIColor *)acolor font:(CGFloat )afont textordinaryColor:(UIColor*)ordinaryColor startNum:(NSInteger)startnum toNum:(NSInteger)tonum{
    
    NSMutableAttributedString *btn_arrstring = [[NSMutableAttributedString alloc] initWithString:str];
    
    [btn_arrstring addAttributes:@{NSForegroundColorAttributeName : ordinaryColor,	NSFontAttributeName : [UIFont systemFontOfSize:afont]} range:NSMakeRange(startnum, tonum)];
    return btn_arrstring;
    
}
+(NSString*)daysAgoAgainst:(long long)time{
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:time /1000];
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSCalendar *cal=[NSCalendar currentCalendar];
    
    
    unsigned int unitFlags=NSYearCalendarUnit| NSMonthCalendarUnit| NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
    
    NSDateComponents *d = [cal components:unitFlags fromDate:confromTimesp toDate:dat options:0];
    //  NSLog(@"%d天%d小时%d分钟%d秒",[d day],[d hour],[d minute],[d second]);
    
    if ([d day]) {
        return [NSString stringWithFormat:@"%ld天前",(long)[d day]];
    }
    else if([d hour])
    {
        return [NSString stringWithFormat:@"%ld小时前",(long)[d hour]];
        
    }
    else if([d minute]){
        return [NSString stringWithFormat:@"%ld分钟前",(long)[d minute]];
        
    }
    else
    {
        return [NSString stringWithFormat:@"%ld秒前",(long)[d second]];
    }
    
    
    
    return @"未知";
}
//md5 encode
+(NSString *) md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (unsigned int)strlen(cStr), digest );
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02X", digest[i]];
    
    return output;
}
//是否是车牌号码
+(BOOL) isChePaiHao:(NSString *)cheNum
{
    NSString * regex = @"^[京津冀晋蒙辽吉桂黑陕黔秦新琼宁青港藏甘陇蜀云滇沪川粤渝贵台苏浙皖澳闽赣鲁豫鄂楚湘]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{5}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL result =  [predicate evaluateWithObject:cheNum];
    
    return result;
}
+(BOOL) isFirstChr:(NSString *)str{
    NSString *regex = @"^([A-Z]|[a-z]){1}$";
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc] initWithPattern:regex options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:str options:NSMatchingReportProgress range:NSMakeRange(0, str.length)];
    if(numberofMatch > 0)
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
    return NO;
    
}
+ (BOOL) isEmail:(NSString*)email
{
    
    if( (0 != [email rangeOfString:@"@"].length) &&  (0 != [email rangeOfString:@"."].length) )
    {
        NSMutableCharacterSet *invalidCharSet = [[[NSCharacterSet alphanumericCharacterSet] invertedSet]mutableCopy];
        [invalidCharSet removeCharactersInString:@"_-"];
        
        NSRange range1 = [email rangeOfString:@"@" options:NSCaseInsensitiveSearch];
        
        // If username part contains any character other than "."  "_" "-"
        
        NSString *usernamePart = [email substringToIndex:range1.location];
        NSArray *stringsArray1 = [usernamePart componentsSeparatedByString:@"."];
        for (NSString *string in stringsArray1) {
            NSRange rangeOfInavlidChars=[string rangeOfCharacterFromSet: invalidCharSet];
            if(rangeOfInavlidChars.length !=0 || [string isEqualToString:@""])
                return NO;
        }
        
        NSString *domainPart = [email substringFromIndex:range1.location+1];
        NSArray *stringsArray2 = [domainPart componentsSeparatedByString:@"."];
        
        for (NSString *string in stringsArray2) {
            NSRange rangeOfInavlidChars=[string rangeOfCharacterFromSet:invalidCharSet];
            if(rangeOfInavlidChars.length !=0 || [string isEqualToString:@""])
                return NO;
        }
        
        return YES;
    }
    else // no ''@'' or ''.'' present
        return NO;
}
+ (BOOL) isCardNum:(NSString *)strNum
{
    strNum = [strNum uppercaseString];
    
    if([strNum length]!=15 && [strNum length]!=18)
        return false;
    
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc] initWithPattern:@"[0-9]{17}(x|X|[0-9]){1}$" options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:strNum options:NSMatchingReportProgress range:NSMakeRange(0, strNum.length)];
    if(numberofMatch > 0)
    {
        char szID[20] = {0};
        memcpy(szID, [strNum UTF8String], 18);
        int wi[17]={7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2};
        char rs[12]={"10X98765432"};
        int iSum = 0;
        for(int i=0;i<17;i++)
        {
            iSum += (szID[i]-'0')*wi[i];
        }
        if(szID[17] == rs[iSum%11])
        {
            return YES;
        }
        return NO;
    }
    else
    {
        return NO;
    }
    return NO;
}
+ (BOOL) isTranNum:(NSString *)strNum{
    
    NSString *testString = strNum;
    NSString *perchar;
    int alength = [testString length];
    
    BOOL isChar = NO;
    BOOL isnum = NO;
    BOOL isnum1 = YES;
    
    for (int i = 0; i<alength; i++) {
        char commitChar = [testString characterAtIndex:i];
        NSString *temp = [testString substringWithRange:NSMakeRange(i,1)];
        const char *u8Temp = [temp UTF8String];
        if (3==strlen(u8Temp)){
            NSLog(@"字符串中含有中文");
            isnum1 = NO;
            break;
        }
        if((commitChar>64)&&(commitChar<91)){
            NSLog(@"字符串中含有大写英文字母");
            isChar = YES;
            continue;
        }
        if((commitChar>96)&&(commitChar<123)){
            NSLog(@"字符串中含有小写英文字母");
            isChar = YES;
            continue;
            
            
        }
        if((commitChar>47)&&(commitChar<58)){
            NSLog(@"字符串中含有数字");
            isnum = YES;
            continue;
            
            
        }
        else{
            NSLog(@"字符串中含有非法字符%c",commitChar);
            isnum1 = NO;
            break;
            
        }
    }
    
    if ((isnum || isChar)&&isnum1) {
        return YES;
    }
    return NO;
    
    
}
+ (BOOL) isLimitChar:(NSString *)strNum
{
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc] initWithPattern:@"^([A-Z]|[a-z]|[0-9]|@|#|$|&|!){1,30}$" options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:strNum options:NSMatchingReportProgress range:NSMakeRange(0, strNum.length)];
    if(numberofMatch > 0)
    {
        return YES;
    }
    else
    {
        return NO;
    }
    return NO;
}
+ (BOOL) isMobile:(NSString *)strNum
{

    NSString *regex = @"^((13[0-9])|(14[0-9])|(17[0-9])|(15[0-9])|(18[0-9]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:strNum];
    
    return isMatch;
}
+ (BOOL)isNumbericString:(NSString *)str
{
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:@"^(?:|0|[1-9]\\d{0,})(?:\\.\\d*)?$"
                                              options:NSRegularExpressionCaseInsensitive
                                              error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:str
                                                                  options:NSMatchingReportProgress
                                                                    range:NSMakeRange(0, str.length)];
    if(numberofMatch > 0)
    {
        return YES;
    }
    return NO;
}
//电话号码打****
+(NSString *)phonenumbel:(NSString *)num{
    if (num.length <11) {
        return  num;
    }
    
    NSMutableString *  str = [NSMutableString stringWithString:num];
    [str deleteCharactersInRange:NSMakeRange(2, 6)];
    [str insertString:@"******" atIndex:2];
    
    return str;
    
    
}
//身份号码打****
+(NSString *)Number:(NSString *)num{
    
    if (num.length <18) {
        return  num;
    }
    
    return [num stringByReplacingCharactersInRange:NSMakeRange(14, 4) withString:@"****"];
    
    
}
//车牌****
+(NSString *)carNumbel:(NSString *)num{
    if (num.length < 1) {
        return @"暂无车牌号";
    }
    if (num.length <3) {
        return  @"***";
    }
    
    NSMutableString *  str = [NSMutableString stringWithString:num];
    [str deleteCharactersInRange:NSMakeRange(num.length - 3, 3)];
    [str insertString:@"***" atIndex:num.length - 3];
    
    return str;
    
    
}
+(NSString*)getStringWithLong:(long long)time Format:(NSString*)format{
    
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //设定时间格式,这里可以设置成自己需要的格式
    dateFormatter.dateFormat = format;
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:time/1000];
    
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr=nil;
    if(confromTimesp==nil)
        currentDateStr= [dateFormatter stringFromDate:[NSDate date]];
    else
        currentDateStr= [dateFormatter stringFromDate:confromTimesp];
    
    return currentDateStr;
    
    
}
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format
{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    NSDate *date = [inputFormatter dateFromString:string];
    return date;
}

+(NSUInteger)daysAgo:(NSDate *) fromdate todate:(NSDate *) todate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSDayCalendarUnit)
                                               fromDate:fromdate
                                                 toDate:todate
                                                options:0];
    return [components day];
}
//午夜时间距今几天
+ (NSUInteger)daysAgoAgainstMidnight:(NSDate *) mydate
{
    NSDateFormatter *mdf = [[NSDateFormatter alloc] init];
    [mdf setDateFormat:@"yyyy-MM-dd"];
    NSDate *midnight = [mdf dateFromString:[mdf stringFromDate:mydate]];
    
    return (int)[midnight timeIntervalSinceNow] / (60*60*24) *-1;
}
+(NSUInteger)daysAgo:(NSDate *) mydate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSDayCalendarUnit)
                                               fromDate:mydate
                                                 toDate:[NSDate date]
                                                options:0];
    return [components day];
}
+ (CGFloat) heightforString:(NSString *)value andHeight:(CGFloat)height fontSize:(CGFloat)fontSize{
    return [value boundingRectWithSize:CGSizeMake(100000, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:fontSize] forKey:NSFontAttributeName] context:nil].size.width;
    
}
+ (CGFloat) heightforString:(NSString *)value andWidth:(CGFloat)width fontSize:(CGFloat)fontSize{
    return [value boundingRectWithSize:CGSizeMake(width, 1000000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:fontSize] forKey:NSFontAttributeName] context:nil].size.height;
    
}
//获取某类的私有变量
-(NSMutableArray *)fromClassStr:(id)Str{
    unsigned  int count = 0;
    Ivar *members = class_copyIvarList([Str class], &count);
    NSMutableArray * array =[NSMutableArray array];
    for (int i = 0; i < count; i++)
    {
        NSMutableDictionary * dic = [NSMutableDictionary dictionary];
        Ivar var = members[i];
        
        const char *memberStr = ivar_getName(var);
        
        const char *member_Type = ivar_getTypeEncoding(var);
        
        NSString *memberName = [NSString stringWithFormat:@"%s",memberStr];
        NSString *memberType = [NSString stringWithFormat:@"%s",member_Type];
        [dic setObject: memberName forKey:@"memberName"];
        [dic setObject: memberType forKey:@"memberType"];
        [array addObject:dic];
        NSLog(@"memberName = %@ ; memberType = %@",memberName,memberType);

    }
    return array;
    
    
}
//加模糊效果，image是图片，blur是模糊度
+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur {
    
    //模糊度,
    if ((blur < 0.1f) || (blur > 2.0f)) {
        blur = 0.5f;
    }
    
    //boxSize必须大于0
    int boxSize = (int)(blur * 100);
    boxSize -= (boxSize % 2) + 1;
    boxSize = 45;
    NSLog(@"boxSize:%i",boxSize);//45
    //图像处理
    CGImageRef img = image.CGImage;
    //需要引入
    /*
     This document describes the Accelerate Framework, which contains C APIs for vector and matrix math, digital signal processing, large number handling, and image processing.
     本文档介绍了Accelerate Framework，其中包含C语言应用程序接口（API）的向量和矩阵数学，数字信号处理，大量处理和图像处理。
     */
    
    //图像缓存,输入缓存，输出缓存
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    //像素缓存
    void *pixelBuffer;
    
    //数据源提供者，Defines an opaque type that supplies Quartz with data.
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    // provider’s data.
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    //宽，高，字节/行，data
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    //像数缓存，字节行*图片高
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    
    // 第三个中间的缓存区,抗锯齿的效果
    void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    vImage_Buffer outBuffer2;
    outBuffer2.data = pixelBuffer2;
    outBuffer2.width = CGImageGetWidth(img);
    outBuffer2.height = CGImageGetHeight(img);
    outBuffer2.rowBytes = CGImageGetBytesPerRow(img);
    
    //Convolves a region of interest within an ARGB8888 source image by an implicit M x N kernel that has the effect of a box filter.
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    error = vImageBoxConvolve_ARGB8888(&outBuffer2, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    //    NSLog(@"字节组成部分：%zu",CGImageGetBitsPerComponent(img));
    //颜色空间DeviceRGB
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //用图片创建上下文,CGImageGetBitsPerComponent(img),7,8
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             CGImageGetBitmapInfo(image.CGImage));
    
    //根据上下文，处理过的图片，重新组件
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    free(pixelBuffer2);
    CFRelease(inBitmapData);
    
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    
    return returnImage;
}
+ (UIImage *)drawLineByImageView:(UIImageView *)imageView{
    
    
    UIGraphicsBeginImageContext(imageView.frame.size); //开始画线 划线的frame
    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    //设置线条终点形状
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    // 5是每个虚线的长度 1是高度
    CGFloat lengths[] = {5,1};
    CGContextRef line = UIGraphicsGetCurrentContext();
    // 设置颜色
    CGContextSetStrokeColorWithColor(line, [UIColor colorWithWhite:0.408 alpha:1.000].CGColor);
    CGContextSetLineDash(line, 0, lengths, 2); //画虚线
    CGContextMoveToPoint(line, 0.0, 2.0); //开始画线
    CGContextAddLineToPoint(line, Main_Screen_Width - 10, 2.0);
    
    CGContextStrokePath(line);
    // UIGraphicsGetImageFromCurrentImageContext()返回的就是image
    return UIGraphicsGetImageFromCurrentImageContext();
}
/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL,CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];


}


+(NSData *)compressPicQualityWith:(UIImage *)picImage andCompressBytesLow:(int)compressBytesLow{
    NSData *data = UIImageJPEGRepresentation(picImage,1.0);
    NSUInteger size = data.length / 1024;
    while(size > compressBytesLow){
        UIImage *image = [UIImage imageWithData:data];
        data = UIImageJPEGRepresentation(image, 0.9);;
        size = data.length/1024;
    }
    return data;
}
+(UIImage *)compressPicSizeWithOrignalImage:(UIImage *)orignalImage andCompressSize:(CGSize)compressSize{
    UIGraphicsBeginImageContext(compressSize);
    [orignalImage drawInRect:CGRectMake(0, 0, compressSize.width, compressSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+(id)analysis:(NSString*)str{
    if (!str) {
        return str;
    }
    NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    
    id result = [NSJSONSerialization JSONObjectWithData:jsonData
                                                options:NSJSONReadingMutableContainers
                                                  error:&err];
    NSLog(@"result == ======%@",result);
    return result;
    
}
/*
 判断字符串是否
 */
+(BOOL)IsJudgeExistStr:(NSString*)str JudgeStr:(NSString*)judgeStr{
    
    if (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)) {
        
        if ([str containsString:judgeStr])
            
            return YES;
        else
            return NO;
  
    }
    else
    {
        NSRange range = [str rangeOfString:judgeStr];//判断字符串是否包含
        if (range.length >0)//包含
            return YES;
   
        else//不包含
            return NO;
    }
        return NO;
 
    
    }




@end
