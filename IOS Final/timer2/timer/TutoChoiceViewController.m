//
//  TutoChoiceViewController.m
//  timer
//
//  Created by ESPRIT on 04/01/2016.
//  Copyright © 2016 qwerty. All rights reserved.
//

#import "TutoChoiceViewController.h"

@interface TutoChoiceViewController ()

@end

@implementation TutoChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

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


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    int indicetuto=0;
    if(sender == _btadd){
        
        indicetuto =1;
    }
    if(sender == _btsous){
        
        indicetuto =2;
    }
    if(sender == _btmult){
        
        indicetuto =3;
    }
    if(sender == _btdivi){
        
        indicetuto =4;
    }
    TutoViewController * v=[segue destinationViewController];
    
    
    v.typeTuto=indicetuto;
    
}


@end
