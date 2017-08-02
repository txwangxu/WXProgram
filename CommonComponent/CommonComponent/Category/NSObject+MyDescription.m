//
//  NSObject+MyDescription.m
//  NewDescription
//
//  Created by DangDang on 2017/8/2.
//  Copyright © 2017年 DangDang. All rights reserved.
//

#import "NSObject+MyDescription.h"
#import <objc/runtime.h>

@implementation NSObject (MyDescription)

- (NSString *)debugDescription
{
    if ([self isKindOfClass:[NSArray class]] || [self isKindOfClass:[NSDictionary class]] || [self isKindOfClass:[NSNumber class]] || [self isKindOfClass:[NSString class]])
    {
        return self.description;
    }
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithCapacity:20];
    
    uint count = 0;
    
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i++)
    {
        objc_property_t property = properties[i];
        
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        
        id value = [self valueForKey:name] ? : @"nil";
        
        [dictionary setObject:value forKey:name];
    }
    
    free(properties);
    
    return [NSString stringWithFormat:@"<%@: %p> -- %@", [self class], self, dictionary];
}

@end
