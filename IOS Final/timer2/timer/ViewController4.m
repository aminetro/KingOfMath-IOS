//
//  ViewController4.m
//  timer
//
//  Created by yosemite on 11/11/15.
//  Copyright © 2015 qwerty. All rights reserved.
//

#import "ViewController4.h"

@interface ViewController4 ()

@end

@implementation ViewController4

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
    if(sender == _B1){
        
        _indice =@"1";
    }
    if(sender == _B2){
        
        _indice =@"2";
    }
    if(sender == _B3){
        
        _indice =@"3";
    }
    if(sender == _B4){
        
        _indice =@"4";
    }
        ViewControllerLevels * v=[segue destinationViewController];
    
        
        v.type=_indice;
    
}





@end
