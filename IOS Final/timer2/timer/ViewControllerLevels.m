//
//  ViewControllerLevels.m
//  timer
//
//  Created by yosemite on 11/11/15.
//  Copyright © 2015 qwerty. All rights reserved.
//

#import "ViewControllerLevels.h"

@interface ViewControllerLevels ()

@end

@implementation ViewControllerLevels

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* bbb;
    _DB=[[DBManager alloc]initWithDatabaseFilename:@"KingsOfMath"];
    
    if ([_type  isEqual:@"1"]) {
        bbb=@"addition";
    }
    if ([_type  isEqual:@"2"]) {
        bbb=@"soustraction";
    }
    if ([_type  isEqual:@"3"]) {
        bbb=@"multiplication";
    }
    if ([_type  isEqual:@"4"]) {
        bbb=@"division";
    }
    
    
    NSString* requete2=[NSString stringWithFormat:@"select score from Scores where (type = '%@')",bbb];
    NSArray* myarray;
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    
    NSInteger indicescore=[_DB.arrColumnNames indexOfObject:@"score"];
    NSInteger result1=[[[myarray objectAtIndex:0]objectAtIndex:indicescore] integerValue];
    if(result1 != 0){
        [_bt1 setTitle:[NSString stringWithFormat:@"Level 1  : %ld",(long)result1 ] forState:UIControlStateNormal];
    }
    
    
    result1=[[[myarray objectAtIndex:1]objectAtIndex:indicescore] integerValue];
    if(result1 != 0){
        [_bt2 setTitle:[NSString stringWithFormat:@"Level 2  : %ld",(long)result1] forState:UIControlStateNormal];
    }
    
    result1=[[[myarray objectAtIndex:2]objectAtIndex:indicescore] integerValue];
    if(result1 != 0){
        [_bt3 setTitle:[NSString stringWithFormat:@"Level 3  : %ld",(long)result1 ] forState:UIControlStateNormal];
    }
    
    
    result1=[[[myarray objectAtIndex:3]objectAtIndex:indicescore] integerValue];
    if(result1 != 0){
        [_bt4 setTitle:[NSString stringWithFormat:@"Level 4  : %ld",(long)result1 ] forState:UIControlStateNormal];
    }
    
    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    NSString* bbb;
    _DB=[[DBManager alloc]initWithDatabaseFilename:@"KingsOfMath"];
    
    if ([_type  isEqual:@"1"]) {
        bbb=@"addition";
    }
    if ([_type  isEqual:@"2"]) {
        bbb=@"soustraction";
    }
    if ([_type  isEqual:@"3"]) {
        bbb=@"multiplication";
    }
    if ([_type  isEqual:@"4"]) {
        bbb=@"division";
    }
    NSString* requete2=[NSString stringWithFormat:@"select score from Scores where (type = '%@')",bbb];
    NSArray* myarray;
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    
    NSInteger indicescore=[_DB.arrColumnNames indexOfObject:@"score"];
    NSInteger result1=[[[myarray objectAtIndex:0]objectAtIndex:indicescore] integerValue];
    if(result1 != 0){
        [_bt1 setTitle:[NSString stringWithFormat:@"Level 1  : %ld",(long)result1 ] forState:UIControlStateNormal];
    }
    
    
    result1=[[[myarray objectAtIndex:1]objectAtIndex:indicescore] integerValue];
    if(result1 != 0){
        [_bt2 setTitle:[NSString stringWithFormat:@"Level 2  : %ld",(long)result1] forState:UIControlStateNormal];
    }
    
    result1=[[[myarray objectAtIndex:2]objectAtIndex:indicescore] integerValue];
    if(result1 != 0){
        [_bt3 setTitle:[NSString stringWithFormat:@"Level 3  : %ld",(long)result1 ] forState:UIControlStateNormal];
    }
    
    
    result1=[[[myarray objectAtIndex:3]objectAtIndex:indicescore] integerValue];
    if(result1 != 0){
        [_bt4 setTitle:[NSString stringWithFormat:@"Level 4  : %ld",(long)result1 ] forState:UIControlStateNormal];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if(sender == _bt1){
        
        _lvl =@"1";
    }
    if(sender == _bt2){
        
        _lvl =@"2";
    }
    if(sender == _bt3){
        
        _lvl =@"3";
    }
    if(sender == _bt4){
        
        _lvl =@"4";
    }
    if(sender == _bt5){
        
        _lvl =@"5";
    }
    if(sender == _bt6){
        
        _lvl =@"6";
    }
    if(sender == _bt7){
        
        _lvl =@"7";
    }
    ViewController5 * v=[segue destinationViewController];
    
    v.a=_type;
    v.b=_lvl;

    }


@end
