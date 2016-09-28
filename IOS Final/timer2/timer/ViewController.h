//
//  ViewController.h
//  timer
//
//  Created by qwerty on 11/1/15.
//  Copyright © 2015 qwerty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface ViewController : UIViewController{
    
    
IBOutlet UILabel *timerLabel;
 NSTimer *timer;
 }
@property(strong,nonatomic) NSArray* myarrayQuestion;
@property(strong,nonatomic) NSArray* myarrayReponse;

@property (weak, nonatomic) IBOutlet UILabel *question;


@property(strong,nonatomic) DBManager* DB;


@property (weak, nonatomic) IBOutlet UILabel *erreur;
@property (weak, nonatomic) IBOutlet UIButton *m;

@property (weak, nonatomic) IBOutlet UIButton *r1;
@property (weak, nonatomic) IBOutlet UIButton *r2;
@property (weak, nonatomic) IBOutlet UIButton *r3;
@property (weak, nonatomic) IBOutlet UIButton *r4;

@property (strong,nonatomic) NSString * QuizzType;

-(void) count;

- (IBAction)backs:(id)sender;

- (IBAction)pause:(id)sender;

@end

