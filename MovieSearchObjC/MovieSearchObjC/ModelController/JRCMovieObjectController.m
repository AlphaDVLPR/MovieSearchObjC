//
//  JRCMovieObjectController.m
//  MovieSearchObjC
//
//  Created by AlphaDVLPR on 8/23/19.
//  Copyright © 2019 AlphaDVLPR. All rights reserved.
//

#import "JRCMovieObjectController.h"
#
@implementation JRCMovieObjectController

//Now first we want to set the shared controller -1
+(instancetype)sharedController
{
    static JRCMovieObjectController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[JRCMovieObjectController alloc] init];
    });
    return sharedInstance;
}

- (NSURL *)baseURL
{
    return [NSURL URLWithString: @"https://api.themoviedb.org/3/search/movie"];
}

//MARK: - Fetch -2
//Now we are creating our fetch method -2

- (void)searchForPostWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<JRCMovieObjects *> *, NSError *))completion
//Now we want to head over to the website to grab the baseURL
{
    
    //we need our search URL -3
    /*
     So this is the breakdown of what is going on. So we are creating the searchURL first. We are declaring the searchURL.
     Since baseURL is an instance method we can just call self
     now searchURL is = appending path component. which means that the user is building our url. This is why it is the search URL whatever they are typing in is building the components.
     */
    NSURL *searchURL = [self baseURL];
    searchURL = [searchURL URLByAppendingPathComponent:searchTerm];
    
    
    //MARK: - Properties -4 / build the final URL
    

    NSString *key = @"89e4f2c080deaadb142502d9394694cc";
    
    NSURLComponents *components = [NSURLComponents componentsWithString:@"https://api.themoviedb.org/3/search/movie"];
    NSURLQueryItem *keyQueryItem = [NSURLQueryItem queryItemWithName:@"api_key" value:key];
    NSURLQueryItem *searchQueryItem = [NSURLQueryItem queryItemWithName:@"query" value:searchTerm];

    //Create Final URL
    
    components.queryItems = @[keyQueryItem, searchQueryItem];
    NSURL *finalURL = components.URL;
    
    //Iterate through URL Session -5
    //the "searchURL" is sometimes started with baseURL depending on the api
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData *  data, NSURLResponse * response, NSError *  error)
      {
          
          //Error Handling -6
          if (error) {
              NSLog(@"%@", error.localizedDescription);
              completion(nil, error);
              return;
          }
          
          if (!data) {
              NSLog(@"Error: no data returned from the data task.");
              completion(nil, error);
              return;
          }
          
          //So first we are going to get that TopLevelDictionary Json -7
          NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
          
          //Now that we have the first Json Dictionary lets do a little bit of error handling
          //This is just extra error handling for the developer.
          if(!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]) {
              NSLog(@"JSONdictionary is not a dictionary class.");
              completion(nil, error);
              return;
          }
          
          //Now that we have made it this far and we have in fact made it to the data array of dictionary. We can now move forword with parsing or drilling the data array
          
          NSDictionary *postDataDictionaries = jsonDictionary[@"JSON"];
          NSArray *childrenArray = postDataDictionaries[@"results"];
          //Placeholder Array so we can complete with the type that we define for our return object ([JRCMovieObjects])
          NSMutableArray *movieArray = [NSMutableArray array];
          
          
          //Now that we made it into the children array we are going to use a for loop to check all of the dictionaries for the information that we want
          //Don't forget to import JRCMovieObjects
          for (NSDictionary *dataDictionary in childrenArray) {
              
              JRCMovieObjects *movie = [[JRCMovieObjects alloc] initWithDictionary:dataDictionary];
              //This data will be filled to the mutable array everytime that it cycles through
              [movieArray addObject:movie];
          }
          completion(movieArray, nil);
      }]resume];
}

//NSURL *searchURL = [self baseURL];
//searchURL = [searchURL URLByAppendingPathComponent:searchTerm];
//searchURL = [searchURL URLByAppendingPathExtension:@"json"];

//This is for the Fetch Image


@end
