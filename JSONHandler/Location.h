//
//  Location.h
//  JSONHandler
//
//  Created by Iorweth on 02/03/2015.
//  Copyright (c) 2015 alexik (c). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString   *wsID;
@property (readonly) NSString   *wsVersion;
@property (readonly) NSString   *wsTitle;
@property (readonly) NSString   *wsDescription;
@property (readonly) NSString   *wsLength;
@property (readonly) NSString   *wsGrade;
@property (readonly) NSString   *wsCounty;
@property (readonly) NSString   *wsDistrict;
@property (readonly) NSString   *wsType;
@property (readonly) NSString   *wsRating;
@property (readonly) NSString   *wsSegments;
@property (readonly) NSString   *wsStartCoordLat;
@property (readonly) NSString   *wsStartCoordLong;
@property (readonly) NSString   *wsIcon;
@property (readonly) NSString   *wsIllustration;
@property (readonly) NSString   *wsPublished;
@property (readonly) NSString   *wsPhoto;
@property (readonly) NSString   *wsnumsegs;

@end
