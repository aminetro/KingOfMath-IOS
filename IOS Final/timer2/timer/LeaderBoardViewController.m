//
//  LeaderBoardViewController.m
//  timer
//
//  Created by ESPRIT on 03/12/15.
//  Copyright © 2015 qwerty. All rights reserved.
//

#import "LeaderBoardViewController.h"

@interface LeaderBoardViewController ()

@end

@implementation LeaderBoardViewController
@synthesize tableview;
int oooo=-1;int max=0;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    tableview.hidden=true;
    [self performSelector:@selector(parseSelected)];
    [tableview reloadData];
}

-(void) parseSelected
{
    PFQuery *testOuery = [PFQuery queryWithClassName:@"TestObject"];
    [testOuery orderByDescending:@"score"];
    [testOuery findObjectsInBackgroundWithBlock:^(NSArray * objects, NSError *error) {
        if (!error) {
            _myarray =[[NSArray alloc] initWithArray:objects];
            _Neterrors.hidden=true;
            tableview.hidden=false;
            
        }else{
            tableview.hidden=true;        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableview reloadData];
        });
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _myarray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Configure the cell...
    
    
    return [tableView dequeueReusableCellWithIdentifier:@"Cellu"];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    PFObject *tempObject =[self.myarray objectAtIndex:indexPath.row];
    /* cell.textLabel.text = [NSNumber numberWithInteger:([tempObject objectForKey:@"score"])];*/
    
    int value;
    value= [[tempObject objectForKey:@"score"] intValue];
    NSString *playername=[tempObject objectForKey:@"name"];
    
    //NSLog(@"%@",tempObject.objectId);
    //NSLog(@"jjj     :    %@",[[NSUserDefaults standardUserDefaults] objectForKey:@"DataId"]);
    if ([tempObject.objectId isEqualToString: [[NSUserDefaults standardUserDefaults] objectForKey:@"DataId"]]) {
        
        UIImageView *myImage = (UIImageView *)[tableView viewWithTag:1];
        myImage.image = [UIImage imageNamed:@"backgrouditem2.png"];
        NSLog(@"hhhhhhhhhhhhhhh");
    }
    
    UILabel *myRank = (UILabel *)[tableView viewWithTag:2];
    myRank.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row+1];
    
    UILabel *myName = (UILabel *)[tableView viewWithTag:3];
    myName.text = [NSString stringWithFormat:@"%@", playername];
    
    UILabel *myScore = (UILabel *)[tableView viewWithTag:4];
    myScore.text = [NSString stringWithFormat:@"%d", value];
}

//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
/*{
 switch (section) {
 case 0:
 return @"Section 1";
 break;
 case 1:
 return @"Section d'assault";
 break;
 case 2:
 return @"Section Zero";
 break;
 
 default:
 return @"Nothing";
 break;
 }
 }*/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
