//
//  ViewController5.h
//  timer
//
//  Created by yosemite on 11/11/15.
//  Copyright © 2015 qwerty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface ViewController5 : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *r1;
@property (weak, nonatomic) IBOutlet UIButton *r2;
@property (weak, nonatomic) IBOutlet UIButton *r3;
@property (weak, nonatomic) IBOutlet UIButton *r4;
@property (weak, nonatomic) IBOutlet UIButton *m;
@property (weak, nonatomic) IBOutlet UILabel *question;
@property (weak, nonatomic) IBOutlet UILabel *erreur;
@property (weak, nonatomic) IBOutlet UILabel *life;
- (IBAction)backs:(id)sender;
- (IBAction)calcul:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *l3;
@property (weak, nonatomic) IBOutlet UIImageView *l2;
@property (weak, nonatomic) IBOutlet UIImageView *l1;

@property(strong,nonatomic) DBManager* DB;
@property NSString* b;
@property  NSString* a;
@end
