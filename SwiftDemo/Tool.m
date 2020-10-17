//
//  Tool.m
//  SwiftDemo
//
//  Created by Qi Liu on 2020/9/10.
//  Copyright © 2020 Qi Liu. All rights reserved.
//

#import "Tool.h"
#include <net/if.h>
#include <ifaddrs.h>
#include <arpa/inet.h>

#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

@implementation Tool


//static NSString * const CRLF2DataStr =  @"\r\n\r\n";
static NSString * const CRLF2DataStr =  @"123456";
static NSString * ChunkedTransferEncodingEndData =  @"0\r\n\r\n";

+(void)rangetestT{
    
    
    NSData * data = [@"abcdef123456" dataUsingEncoding:NSUTF8StringEncoding];
    NSData * su = [CRLF2DataStr dataUsingEncoding:NSUTF8StringEncoding];
    
//    data
    NSData * subData = [data subdataWithRange:NSMakeRange(6, 6)];
    
    NSRange CRLFRange1 = [data rangeOfData:subData options:NSDataSearchBackwards range:NSMakeRange(0, data.length)];
    
    if (CRLFRange1.location != NSNotFound) {
        NSData * subData = [data subdataWithRange:NSMakeRange(0, CRLFRange1.location)];
        NSLog(@"oc测试:%@",[[NSString alloc]initWithData:subData encoding:NSUTF8StringEncoding]);
    }
}

+(NSString *)getIPAddress:(int)preferNet
{
    @try {
        NSArray *searchArray = nil;
        switch (preferNet) {
            case 0:
                searchArray=@[ IOS_CELLULAR @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6 ];
                break;
            case 1:
                searchArray=@[ IOS_WIFI @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6 ];
                break;
            case 2:
                searchArray=@[ IOS_VPN @"/" IP_ADDR_IPv4, IOS_VPN @"/" IP_ADDR_IPv6 ];
                break;
            default:
                searchArray=@[ IOS_CELLULAR @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_VPN @"/" IP_ADDR_IPv4, IOS_VPN @"/" IP_ADDR_IPv6 ] ;
                break;
        }
        
        NSDictionary *addresses = [self getIPAddresses];
        __block NSString *address;
        [searchArray enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop)
         {
            address = addresses[key];
            if(address) *stop = YES;
        } ];
        return address ? address : @"0.0.0.0";
    } @catch (NSException *exception) {
        return @"0.0.0.0";
    }
    
}

+(NSDictionary *)getIPAddresses{
    @try {
        NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
        // retrieve the current interfaces - returns 0 on success
        struct ifaddrs *interfaces;
        if(!getifaddrs(&interfaces)) {
            // Loop through linked list of interfaces
            struct ifaddrs *interface;
            for(interface=interfaces; interface; interface=interface->ifa_next) {
                if(!(interface->ifa_flags & IFF_UP) /* || (interface->ifa_flags & IFF_LOOPBACK) */ ) {
                    continue; // deeply nested code harder to read
                }
                const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
                char addrBuf[ MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN) ];
                if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                    NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                    NSString *type;
                    if(addr->sin_family == AF_INET) {
                        if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                            type = IP_ADDR_IPv4;
                        }
                    } else {
                        const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
                        if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                            type = IP_ADDR_IPv6;
                        }
                    }
                    if(type) {
                        NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
                        addresses[key] = [NSString stringWithUTF8String:addrBuf];
                    }
                }
            }
            // Free memory
            freeifaddrs(interfaces);
        }
        return [addresses count] ? addresses : nil;
    } @catch (NSException *exception) {
        return nil;
    }
    
}
@end
