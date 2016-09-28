//
//  ViewController2.h
//  timer
//
//  Created by yosemite on 11/11/15.
//  Copyright © 2015 qwerty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController1.h"
#import "DBManager.h"

#import <AVFoundation/AVFoundation.h>
#import <Parse/Parse.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>




@interface ViewController2 : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    
    SLComposeViewController *composer;
}
@property (weak, nonatomic) IBOutlet UILabel *score;
@property NSString* x;
@property (weak, nonatomic) IBOutlet UILabel *noms;
@property (weak, nonatomic) IBOutlet UIButton *BTsong;
- (IBAction)Sounds:(id)sender;
@property(strong,nonatomic) DBManager* DB;
- (IBAction)Facebook:(id)sender;
- (IBAction)twitter:(id)sender;

@end
