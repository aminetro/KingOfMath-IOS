//
//  MultiPlayerViewController.h
//  timer
//
//  Created by ESPRIT on 03/01/2016.
//  Copyright © 2016 qwerty. All rights reserved.
//

#import "ViewController.h"

@interface MultiPlayerViewController : ViewController
@property (weak, nonatomic) IBOutlet UIButton *bt1p2;
@property (weak, nonatomic) IBOutlet UIButton *bt2p2;
@property (weak, nonatomic) IBOutlet UIButton *bt3p2;
@property (weak, nonatomic) IBOutlet UIButton *bt4p2;
@property (weak, nonatomic) IBOutlet UILabel *TFquestion2;
@property (weak, nonatomic) IBOutlet UILabel *TFScore2;

@property (weak, nonatomic) IBOutlet UIButton *bt1p1;
@property (weak, nonatomic) IBOutlet UIButton *bt2p1;
@property (weak, nonatomic) IBOutlet UIButton *bt3p1;
@property (weak, nonatomic) IBOutlet UIButton *bt4p1;
@property (weak, nonatomic) IBOutlet UILabel *TFquestion1;
@property (weak, nonatomic) IBOutlet UILabel *TFScore1;
- (IBAction)exitMP:(id)sender;

- (IBAction)BTrpClick:(id)sender;



@end
