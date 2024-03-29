//
//  JRCMovieObject.m
//  MovieSearchObjC
//
//  Created by AlphaDVLPR on 8/23/19.
//  Copyright © 2019 AlphaDVLPR. All rights reserved.
//

#import "JRCMovieObject.h"

@implementation JRCMovieObject

@interface JRCMovieObject: NSObject

//First we are going to find the properties that we need. We do this by looking at our Json and seeing all the information we need to pull out for our application
//Since it is a string we are going to say Copy
@property (nonatomic, copy, readonly)NSString *title;
@property (nonatomic, readonly)NSInteger *ups;
@property (nonatomic, readonly)NSNumber *commentCount;

//Now that we have all of the properties that we need then we have to set an insitializer
- (instancetype)initWithTitle:(NSString *)title
                          ups:(NSInteger *)ups
                 commentCount:(NSNumber *)commentCount;

//Now we need the Json Dictionary Initializer
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
