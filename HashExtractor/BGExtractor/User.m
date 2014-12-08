//
//  User.m
//  HashExtractor
//
//  Created by Alex Nichol on 12/8/14.
//  Copyright (c) 2014 Alex Nichol. All rights reserved.
//

#import "User.h"

static NSDictionary * ReadDictionary(NSString * path, NSError ** error);

@implementation User

+ (NSArray *)listUsers:(NSError **)error {
  NSMutableArray * res = [[NSMutableArray alloc] init];
  NSString * dirPath = @"/var/db/dslocal/nodes/Default/users";
  NSArray * listing = [[NSFileManager defaultManager]
                       contentsOfDirectoryAtPath:dirPath error:error];
  if (!listing) {
    return nil;
  }
  for (NSString * name in listing) {
    NSString * fullPath = [dirPath stringByAppendingPathComponent:name];
    User * u = [[User alloc] initWithPath:fullPath error:error];
    if (!u) {
      return nil;
    }
    [res addObject:u];
  }
  return res;
}

- (id)initWithPath:(NSString *)plist error:(NSError **)error {
  if ((self = [super init])) {
    NSDictionary * dict = ReadDictionary(plist, error);
    if (!dict) {
      return nil;
    }
    _plistPath = plist;
    _name = [dict[@"name"] firstObject];
    _realName = [dict[@"realname"] firstObject];
    _uid = [[dict[@"uid"] firstObject] intValue];
    _gid = [[dict[@"gid"] firstObject] intValue];
    _home = [dict[@"home"] firstObject];
  }
  return self;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"<User: name='%@', uid='%d'>",
          self.name, self.uid];
}

@end

static NSDictionary * ReadDictionary(NSString * path, NSError ** error) {
  NSDictionary * contents = [[NSDictionary alloc] initWithContentsOfFile:path];
  if (!contents) {
    if (error) {
      *error = [NSError errorWithDomain:@"User"
                                   code:0
                               userInfo:nil];
    }
    return nil;
  }
  return contents;
}
