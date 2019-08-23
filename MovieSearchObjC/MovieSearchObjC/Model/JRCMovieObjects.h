//
//  JRCMovieObjects.h
//  MovieSearchObjC
//
//  Created by AlphaDVLPR on 8/23/19.
//  Copyright © 2019 AlphaDVLPR. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JRCMovieObjects : NSObject

//First we are going to find the properties that we need. We do this by looking at our Json and seeing all the information we need to pull out for our application
//Since it is a string we are going to say Copy
@property (nonatomic, readonly, copy)NSString *title;
@property (nonatomic, readonly, copy)NSString *summary;
@property (nonatomic, readonly, copy)NSString *image;
@property (nonatomic, readonly, copy)NSNumber *rating;

//Now that we have all of the properties that we need then we have to set an insitializer
- (instancetype)initWithTitle:(NSString *)title
                      summary:(NSString *)summary
                        image:(NSString *)image
                       rating:(NSNumber *)rating;

//Now we need the Json Dictionary Initializer
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
