//
//  QuizzListController.h
//  timer
//
//  Created by ESPRIT on 16/12/2015.
//  Copyright © 2015 qwerty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface QuizzListController : UIViewController


@property(strong,nonatomic) DBManager* DB;

@property (strong, nonatomic) IBOutlet UILabel *scoreBasics;
@property (strong, nonatomic) IBOutlet UILabel *scoreLinearty;
@property (strong, nonatomic) IBOutlet UILabel *Quadratica;
@property (strong, nonatomic) IBOutlet UILabel *Multiplication;
@property (strong, nonatomic) IBOutlet UILabel *scorePower;
@property (strong, nonatomic) IBOutlet UILabel *scoreDivision;
@property (strong, nonatomic) IBOutlet UILabel *scoreMentaliste;

- (IBAction)QuizzChoice:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btBasics;
@property (strong, nonatomic) IBOutlet UIButton *btLinearty;
@property (strong, nonatomic) IBOutlet UIButton *btQuadratica;
@property (strong, nonatomic) IBOutlet UIButton *btMulti;
@property (strong, nonatomic) IBOutlet UIButton *btPower;
@property (strong, nonatomic) IBOutlet UIButton *btDivision;
@property (strong, nonatomic) IBOutlet UIButton *btMentaliste;
@end
