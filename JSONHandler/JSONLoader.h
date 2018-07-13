//
//  JSONLoader.h
//  JSONHandler
//
//  Created by Iorweth on 02/03/2015.
//  Copyright (c) 2015 alexik (c). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONLoader : NSObject
// Return an array of Location objects from the json file at location given by url
- (NSMutableArray *)walksFromJSONFile:(NSURL *)url;
@end
