//
//  main.m
//  BGExtractor
//
//  Created by Alex Nichol on 12/8/14.
//  Copyright (c) 2014 Alex Nichol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSError * error = nil;
    NSArray * listing = [User listUsers:&error];
    if (!listing) {
      NSLog(@"failed %@", error);
    } else {
      NSLog(@"got listing %@", listing);
    }
  }
  return 0;
}
