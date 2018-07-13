//
//  Location.m
//  JSONHandler
//
//  Created by Iorweth on 02/03/2015.
//  Copyright (c) 2015 alexik (c). All rights reserved.
//

#import "Location.h"

@implementation Location

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary
{
    if(self = [self init])
    {
        
        // Assign all properties with keyed values from the dictionary
        _wsID =             [jsonDictionary objectForKey:@"walkID"];
        _wsVersion=         [jsonDictionary objectForKey:@"walkVersion"];
        _wsTitle=           [jsonDictionary objectForKey:@"walkTitle"];
        _wsDescription=     [jsonDictionary objectForKey:@"walkDescription"];
        _wsLength=          [jsonDictionary objectForKey:@"walkLength"];
        _wsGrade=           [jsonDictionary objectForKey:@"walkGrade"];
        _wsCounty=          [jsonDictionary objectForKey:@"walkCounty"];
        _wsDistrict=        [jsonDictionary objectForKey:@"walkDistrict"];
        _wsType=            [jsonDictionary objectForKey:@"walkType"];
        _wsRating=          [jsonDictionary objectForKey:@"walkRating"];
        _wsSegments=        @"0";//[jsonDictionary objectForKey:@"walkSegments"];
        _wsStartCoordLat=   [jsonDictionary objectForKey:@"walkStartCoordLat"];
        _wsStartCoordLong=  [jsonDictionary objectForKey:@"walkStartCoordLong"];
        _wsIcon=            [jsonDictionary objectForKey:@"walkIcon"];
        _wsIllustration=    [jsonDictionary objectForKey:@"walkIllustration"];
        _wsPublished=       [jsonDictionary objectForKey:@"walkPublished"];
        _wsPhoto=           [jsonDictionary objectForKey:@"walkPhoto"];
        _wsnumsegs=         [jsonDictionary objectForKey:@"numsegs"];
    }
    
    return self;
}

@end
