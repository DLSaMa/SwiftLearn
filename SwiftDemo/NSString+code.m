
//
//  NSString+code.m
//  SwiftDemo
//
//  Created by Qi Liu on 2020/7/29.
//  Copyright © 2020 Qi Liu. All rights reserved.
//

#import "NSString+code.h"


@implementation NSString (code)
//- (NSString *)urlEncodedStringString {
//    NSString *encodedString = (NSString *)
//    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
//                                                              (CFStringRef)self,
//                                                              (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
//                                                              NULL,
//                                                              kCFStringEncodingUTF8));
//    return encodedString;
//}
//
//- (NSString *)urlDecodeString {
//    NSString *decodedString  = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
//                                                                                                                     (__bridge CFStringRef)self,
//                                                                                                                     CFSTR(""),
//                                                                                                                     CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
//    return decodedString;
//}
@end
