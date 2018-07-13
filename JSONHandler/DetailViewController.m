//
//  DetailViewController.m
//  JSONHandler
//
//  Created by Iorweth on 02/03/2015.
//  Copyright (c) 2015 alexik (c). All rights reserved.
//
#import "DetailViewController.h"
#import "MapAnnotation.h"

@interface DetailViewController ()
@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;

    // We are delegate for map view
    self.mapView.delegate = self;
    
    // Set title
    self.title = [NSString stringWithFormat:@"id%@, %@",self.location.wsID,self.location.wsTitle];
    
    // set texts...
    self.walkCounty.text      = self.location.wsCounty ;
    self.walkDescription.text = self.location.wsDescription;
    self.walkDistrict.text    = self.location.wsDistrict ;
    self.walkGrade.text       = [NSString stringWithFormat:@"%@",self.location.wsGrade];
    self.walkLength.text      = [NSString stringWithFormat:@"%@",self.location.wsLength];
    self.walkPublished.text   = self.location.wsPublished ;
    self.walkRating.text      = [NSString stringWithFormat:@"%@",self.location.wsRating];
    self.walkSegments.text    = self.location.wsSegments ;
    self.walkType.text        = self.location.wsType ;
    self.walkVersion.text     = [NSString stringWithFormat:@"%@",self.location.wsVersion];
    self.numsegs.text         = [NSString stringWithFormat:@"%@",self.location.wsnumsegs] ;
    
    //pictures
    NSString *strImg2 = [NSString stringWithFormat: @"http://www.ifootpath.com/upload/thumbs/%@",self.location.wsIllustration];
    UIImage *img2 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:strImg2]]];
    self.walkIllustration.image = img2;

    NSString *strImg3 = [NSString stringWithFormat: @"http://www.ifootpath.com/upload/thumbs/%@",self.location.wsPhoto];
    UIImage *img3 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:strImg3]]];
    self.walkPhoto.image = img3;
    
    // Make a map annotation for a pin from the longitude/latitude points
    MapAnnotation *mapPoint = [[MapAnnotation alloc] init];
    mapPoint.coordinate = CLLocationCoordinate2DMake([self.location.wsStartCoordLat doubleValue], [self.location.wsStartCoordLong doubleValue]);
    mapPoint.title = self.location.wsTitle;
    
    // Add it to the map view
    [self.mapView addAnnotation:mapPoint];
    
    // Zoom to a region around the pin
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(mapPoint.coordinate, 500, 500);
    [self.mapView setRegion:region];
}


#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *view = nil;
    static NSString *reuseIdentifier = @"MapAnnotation";
    
    // Return a MKPinAnnotationView with a simple accessory button
    view = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIdentifier];
    if(!view)
    {
        view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
        view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        view.canShowCallout = YES;
        view.animatesDrop = YES;
    }
    
    return view;
}

@end
