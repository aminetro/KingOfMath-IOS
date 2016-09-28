//
//  TutoViewController.h
//  timer
//
//  Created by ESPRIT on 04/01/2016.
//  Copyright © 2016 qwerty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutoViewController : UIViewController

- (IBAction)tutoNext:(id)sender;
- (IBAction)tutoPrevious:(id)sender;


@property (weak, nonatomic) IBOutlet UIImageView *imgTuto;

@property  NSInteger typeTuto;
@end
