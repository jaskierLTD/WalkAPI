//
//  DetailViewController.h
//  JSONHandler
//
//  Created by Iorweth on 02/03/2015.
//  Copyright (c) 2015 alexik (c). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"
#import <MapKit/MapKit.h>


@interface DetailViewController : UIViewController<MKMapViewDelegate>

@property (strong, nonatomic) Location *location;

@property (strong, nonatomic) IBOutlet UITextView    *walkVersion;
@property (strong, nonatomic) IBOutlet UITextView    *walkDescription;
@property (strong, nonatomic) IBOutlet UITextView    *walkLength;
@property (strong, nonatomic) IBOutlet UITextView    *walkGrade;
@property (strong, nonatomic) IBOutlet UITextView    *walkCounty;
@property (strong, nonatomic) IBOutlet UITextView    *walkDistrict;
@property (strong, nonatomic) IBOutlet UITextView    *walkType;
@property (strong, nonatomic) IBOutlet UITextView    *walkRating;
@property (strong, nonatomic) IBOutlet UITextView    *walkSegments;
@property (strong, nonatomic) IBOutlet UITextView    *walkPublished;
@property (strong, nonatomic) IBOutlet UITextView    *numsegs;
@property (strong, nonatomic) IBOutlet MKMapView     *mapView;
@property (strong, nonatomic) IBOutlet UIImageView   *walkIllustration;
@property (strong, nonatomic) IBOutlet UIImageView   *walkPhoto;


@end
