//
//  LeaderBoardViewController.h
//  timer
//
//  Created by ESPRIT on 03/12/15.
//  Copyright © 2015 qwerty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface LeaderBoardViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UILabel *Neterrors;


@property(strong,nonatomic) NSArray* myarray;
@end
