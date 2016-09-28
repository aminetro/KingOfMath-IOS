//
//  MapViewControler.h
//  timer
//
//  Created by ESPRIT on 02/01/2016.
//  Copyright © 2016 qwerty. All rights reserved.
//

#import "ViewController.h"

#import "ViewController5.h"

#import "DBManager.h"

@interface MapViewControler :  UIViewController<UITableViewDataSource,UITableViewDelegate>


@property  NSString* type;
@property  NSString* lvl;

@property(strong,nonatomic) DBManager* DB;
@property (strong, nonatomic) IBOutlet UITableView *tabmap;

- (IBAction)ChoosingLevel:(id)sender;







@end
