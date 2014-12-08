//
//  User.h
//  HashExtractor
//
//  Created by Alex Nichol on 12/8/14.
//  Copyright (c) 2014 Alex Nichol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

+ (NSArray *)listUsers:(NSError **)error;

- (id)initWithPath:(NSString *)plist error:(NSError **)error;

@property (readonly) NSString * plistPath;
@property (readonly) NSString * name;
@property (readonly) NSString * realName;
@property (readonly) int uid;
@property (readonly) int gid;
@property (readonly) NSString * home;

@end
