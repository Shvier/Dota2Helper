//
//  YYMediaPlayerEncrypt.h
//  IOSEncrypt
//
//  Created by zhuanglm on 14/11/3.
//  Copyright (c) 2014年 zhuanglm. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, YYFormatType) {
    YYFormatTypeUnknown = 100,
    YYFormatFLV,
    YYFormatMP4,
};

@interface YYMediaPlayerEncrypt : NSObject

/* @abstract    加密视频文件
 *
 * @param       参数列表
 * @path        视频文件路径
 * @success     加密成功的回调
 * @failure     加密失败的回调
 */
- (void)encryptVideo:(NSString *)path
             success:(void(^)(BOOL modified))success
             failure:(void(^)(NSError *error))failure;

/* @abstract    解密视频文件
 *
 * @param       参数列表
 * @path        视频文件路径
 * @success     解密成功的回调
 * @failure     解密失败的回调
 */
- (void)dencryptVideo:(NSString *)path
              success:(void(^)(BOOL modified))success
              failure:(void(^)(NSError *error))failure;

/* @abstract    获取加密信息, 用于视频分片的单片加密
 * @param[in]   real_fmt: 视频格式, 枚举类型 YYFormatType
 * @param[out]  buffer: 二级指针，加密信息的地址。用于返回加密数据
 length: 返回加密数据的长度
 * @return      成功返回 1, 失败返回 0
 */
+ (int)getEncryptedHeader:(unsigned char **)buffer
                   length:(uint32_t *)length
                   format:(YYFormatType)format;
/* @abstract    释放buffer
 * @param[in]   buffer: 二级指针，需要释放的 buffer 地址。
 */
+ (void)freeBuffer:(unsigned char *)buffer;

@end
