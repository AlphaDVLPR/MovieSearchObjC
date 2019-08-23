//
//  JRCMovieObjects.m
//  MovieSearchObjC
//
//  Created by AlphaDVLPR on 8/23/19.
//  Copyright © 2019 AlphaDVLPR. All rights reserved.
//

#import "JRCMovieObjects.h"

//initializer to initialize our properties
@implementation JRCMovieObjects

//MARK: -Magic Strings
//static NSString *const title = @"title";
//static NSString *const summary = @"overview";
//static NSString *const image = @"poster_path";
//static NSString *const rating = @"vote_average";

-(instancetype)initWithTitle:(NSString *)title summary:(NSString *)summary rating:(NSNumber *)rating
{
    self = [super init];
    if (self)
    {
        _title = [title copy];
        _summary = [summary copy];
//        _image = [image copy];
        _rating = [rating copy];
    }
    return self;
}

//For now we want our model to be as basic as possible. We want to throw in all the complicated stuff within the controller
//So we are just going to initialize this dictionary within our model
//So access the dictionary

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    //once we are in the dictionary we are going to go into the data dictionaries that way we can loop through them
    //Get each host from the data key
    NSDictionary *dataDictionary = dictionary[@"data"];
    
    
    //When your inside the inner-most data dictionary which holds the object that you want to initialize, that is when you can define your property. In this case we are defining Post that come from the Json
    
    NSString *title = dataDictionary[[JRCMovieObjects titleKey]];
    NSString *summary = dataDictionary[[JRCMovieObjects summaryKey]];
//    NSString *image = dataDictionary[[JRCMovieObjects imageKey]];
    NSNumber *rating = dataDictionary[[JRCMovieObjects ratingKey]];

    return[self initWithTitle:title summary:summary rating:rating];

}


/*
 case title
 case rating = "vote_average"
 case summary = "overview"
 case image = "poster_path"
 */

//MARK: - Keys
+ (NSString *)titleKey
{
    return @"title";
}

+ (NSString *)summaryKey
{
    return @"overview";
}

//+ (NSString *)imageKey
//{
//    return @"poster_path";
//}

+ (NSNumber *)ratingKey
{
    return @"vote_average";
}

@end
