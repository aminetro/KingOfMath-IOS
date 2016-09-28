//
//  ViewController1.h
//  timer
//
//  Created by yosemite on 11/11/15.
//  Copyright © 2015 qwerty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController2.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController1 : UIViewController
@property (nonatomic, strong) AVAudioPlayer* theAudio;
- (IBAction)facebooks:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nom;
@property NSString* name;
@end
