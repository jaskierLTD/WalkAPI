//
//  JSONLoader.m
//  JSONHandler
//
//  Created by Iorweth on 02/03/2015.
//  Copyright (c) 2015 alexik (c). All rights reserved.
//

#import "JSONLoader.h"
#import "Location.h"
/*
@interface NSNull (JSON)
@end

@implementation NSNull (JSON)

- (NSUInteger)length        { return 0; }
- (NSInteger)integerValue   { return 0; };
- (float)floatValue         { return 0; };
- (NSString *)description   { return @"0(NSNull)"; }
- (NSArray *)componentsSeparatedByString:(NSString *)separator { return @[]; }
- (id)objectForKey:(id)key  { return nil; }
- (BOOL)boolValue           { return NO; }

@end
 */

@implementation JSONLoader

- (NSMutableArray *)walksFromJSONFile:(NSURL *)url
{
    // Create a NSURLRequest with the given URL
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                         timeoutInterval:30.0];
	
    // Get the data
    NSURLResponse *response;
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    // Now create a NSDictionary from the JSON data
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

    // Create a new array to hold the locations
    NSMutableArray *walksArray = [[NSMutableArray alloc] init];
    
    // Get an array of dictionaries with the key "walks"
    NSArray *array = [jsonDictionary objectForKey:@"walks"];

    // Iterate through the array of dictionaries
    for(NSDictionary *dict in array)
    {
        // Create a new Location object for each one and initialise it with information in the dictionary
        Location *walkloc = [[Location alloc] initWithJSONDictionary:dict];
        
        // Add the Location object to the array
        [walksArray addObject:walkloc];
    }
    // Return the array of Location objects
    return walksArray;

}

@end
