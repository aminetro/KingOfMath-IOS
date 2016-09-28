//
//  ViewControllerLevels.h
//  timer
//
//  Created by yosemite on 11/11/15.
//  Copyright © 2015 qwerty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController5.h"
#import "DBManager.h"

@interface ViewControllerLevels : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *bt1;
@property (weak, nonatomic) IBOutlet UIButton *bt2;
@property (weak, nonatomic) IBOutlet UIButton *bt3;
@property (weak, nonatomic) IBOutlet UIButton *bt4;
@property (weak, nonatomic) IBOutlet UIButton *bt5;
@property (weak, nonatomic) IBOutlet UIButton *bt6;
@property (weak, nonatomic) IBOutlet UIButton *bt7;

@property(strong,nonatomic) DBManager* DB;
@property  NSString* type;
@property  NSString* lvl;
@end
