//
//  JRCMovieObjectController.h
//  MovieSearchObjC
//
//  Created by AlphaDVLPR on 8/23/19.
//  Copyright © 2019 AlphaDVLPR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JRCMovieObjects.h"

NS_ASSUME_NONNULL_BEGIN

//First we need to have a class
@class JRCMovieObjects;

@interface JRCMovieObjectController : NSObject

//In the controller we want to have a shared controller
+ (instancetype)sharedController;

//Next we want to fetch our information
//Make sure if we are using swift we want to specify the type by using lightweight generics
- (void)searchForPostWithSearchTerm: (NSString *)searchTerm completion:(void(^) (NSArray<JRCMovieObjects *> *posts, NSError *error))completion;


@end

NS_ASSUME_NONNULL_END
