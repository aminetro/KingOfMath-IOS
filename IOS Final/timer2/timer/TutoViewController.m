//
//  TutoViewController.m
//  timer
//
//  Created by ESPRIT on 04/01/2016.
//  Copyright © 2016 qwerty. All rights reserved.
//

#import "TutoViewController.h"

@interface TutoViewController ()

@end

@implementation TutoViewController
int ituto=0;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%ld",(long)_typeTuto);
    
    if(_typeTuto==1){
        _imgTuto.image=[UIImage imageNamed:@"tutoaddition1.png"];ituto=1;
    }
    if(_typeTuto==2){
        _imgTuto.image=[UIImage imageNamed:@"tutosoustraction1.png"];ituto=1;
    }
    if(_typeTuto==3){
        _imgTuto.image=[UIImage imageNamed:@"tutomultiplication1.png"];ituto=1;
    }
    if(_typeTuto==4){
        _imgTuto.image=[UIImage imageNamed:@"tutodivision1.png"];ituto=1;
    }
    
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

- (IBAction)tutoNext:(id)sender {
    
    if(_typeTuto==1){
        if (ituto==1) {
            _imgTuto.image=[UIImage imageNamed:@"tutoaddition2.png"];ituto=2;
        }
        else if (ituto==2) {
            _imgTuto.image=[UIImage imageNamed:@"tutoaddition3.png"];ituto=3;
        }
        else if (ituto==3) {
            _imgTuto.image=[UIImage imageNamed:@"tutoaddition4.png"];ituto=4;
        }
    }
    
    
    if(_typeTuto==2){
        if (ituto==1) {
            _imgTuto.image=[UIImage imageNamed:@"tutosoustraction2.png"];ituto=2;
        }
        else if (ituto==2) {
            _imgTuto.image=[UIImage imageNamed:@"tutosoustraction3.png"];ituto=3;
        }
    }
    
    if(_typeTuto==3){
        if (ituto==1) {
            _imgTuto.image=[UIImage imageNamed:@"tutomultiplication2.png"];ituto=2;
        }
        else if (ituto==2) {
            _imgTuto.image=[UIImage imageNamed:@"tutomultiplication3.png"];ituto=3;
        }
        else if (ituto==3) {
            _imgTuto.image=[UIImage imageNamed:@"tutomultiplication4.png"];ituto=4;
        }
        else if (ituto==4) {
            _imgTuto.image=[UIImage imageNamed:@"tutomultiplication5.png"];ituto=5;
        }
    }
    
    if(_typeTuto==4){
        if (ituto==1) {
            _imgTuto.image=[UIImage imageNamed:@"tutodivision2.png"];ituto=2;
        }
        else if (ituto==2) {
            _imgTuto.image=[UIImage imageNamed:@"tutodivision3.png"];ituto=3;
        }
    }
}

- (IBAction)tutoPrevious:(id)sender {
    if(_typeTuto==1){
        if (ituto==2) {
            _imgTuto.image=[UIImage imageNamed:@"tutoaddition1.png"];ituto=1;
        }
        else if (ituto==3) {
            _imgTuto.image=[UIImage imageNamed:@"tutoaddition2.png"];ituto=2;
        }
        else if (ituto==4) {
            _imgTuto.image=[UIImage imageNamed:@"tutoaddition3.png"];ituto=3;
        }
    }
    
    
    if(_typeTuto==2){
        if (ituto==2) {
            _imgTuto.image=[UIImage imageNamed:@"tutosoustraction1.png"];ituto=1;
        }
        else if (ituto==3) {
            _imgTuto.image=[UIImage imageNamed:@"tutosoustraction2.png"];ituto=2;
        }
    }
    
    if(_typeTuto==3){
        if (ituto==2) {
            _imgTuto.image=[UIImage imageNamed:@"tutomultiplication1.png"];ituto=1;
        }
        else if (ituto==3) {
            _imgTuto.image=[UIImage imageNamed:@"tutomultiplication2.png"];ituto=2;
        }
        else if (ituto==4) {
            _imgTuto.image=[UIImage imageNamed:@"tutomultiplication3.png"];ituto=3;
        }
        else if (ituto==5) {
            _imgTuto.image=[UIImage imageNamed:@"tutomultiplication4.png"];ituto=4;
        }
    }
    
    if(_typeTuto==4){
        if (ituto==2) {
            _imgTuto.image=[UIImage imageNamed:@"tutodivision1.png"];ituto=1;
        }
        else if (ituto==3) {
            _imgTuto.image=[UIImage imageNamed:@"tutodivision2.png"];ituto=2;
        }
    }
    
}
@end
