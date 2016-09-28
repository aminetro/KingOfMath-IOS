//
//  QuizzListController.m
//  timer
//
//  Created by ESPRIT on 16/12/2015.
//  Copyright © 2015 qwerty. All rights reserved.
//

#import "QuizzListController.h"

#import "ViewController.h"

@interface QuizzListController ()

@end
@implementation QuizzListController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray* myarray;
    
    _DB=[[DBManager alloc]initWithDatabaseFilename:@"KingsOfMath"];
    NSString* requete2=[NSString stringWithFormat:@"select score from Scores where (type = '%@' and number = %d )",@"quizz",1];
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    NSInteger indicescore=[_DB.arrColumnNames indexOfObject:@"score"];
    if(![[[myarray objectAtIndex:0]objectAtIndex:indicescore]  isEqual: @"0"]){
        _scoreBasics.text=[[myarray objectAtIndex:0]objectAtIndex:indicescore];
    }


    
    requete2=[NSString stringWithFormat:@"select score from Scores where (type = '%@' and number = %d )",@"quizz",2];
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    if(![[[myarray objectAtIndex:0]objectAtIndex:indicescore]  isEqual: @"0"]){
        _scoreLinearty.text=[[myarray objectAtIndex:0]objectAtIndex:indicescore];
    }
    
    requete2=[NSString stringWithFormat:@"select score from Scores where (type = '%@' and number = %d )",@"quizz",3];
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    if(![[[myarray objectAtIndex:0]objectAtIndex:indicescore]  isEqual: @"0"]){
        _Quadratica.text=[[myarray objectAtIndex:0]objectAtIndex:indicescore];
    }
    
    requete2=[NSString stringWithFormat:@"select score from Scores where (type = '%@' and number = %d )",@"quizz",4];
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    if(![[[myarray objectAtIndex:0]objectAtIndex:indicescore]  isEqual: @"0"]){
        _Multiplication.text=[[myarray objectAtIndex:0]objectAtIndex:indicescore];
    }
    
    requete2=[NSString stringWithFormat:@"select score from Scores where (type = '%@' and number = %d )",@"quizz",5];
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    if(![[[myarray objectAtIndex:0]objectAtIndex:indicescore]  isEqual: @"0"]){
        _scorePower.text=[[myarray objectAtIndex:0]objectAtIndex:indicescore];
    }
    
    requete2=[NSString stringWithFormat:@"select score from Scores where (type = '%@' and number = %d )",@"quizz",6];
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    if(![[[myarray objectAtIndex:0]objectAtIndex:indicescore]  isEqual: @"0"]){
        _scoreDivision.text=[[myarray objectAtIndex:0]objectAtIndex:indicescore];
    }
    
    requete2=[NSString stringWithFormat:@"select score from Scores where (type = '%@' and number = %d )",@"quizz",7];
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    if(![[[myarray objectAtIndex:0]objectAtIndex:indicescore]  isEqual: @"0"]){
        _scoreMentaliste.text=[[myarray objectAtIndex:0]objectAtIndex:indicescore];
    }
    
}

-(void)viewDidAppear:(BOOL)animated

{
    NSArray* myarray;
    
    _DB=[[DBManager alloc]initWithDatabaseFilename:@"KingsOfMath"];
    NSString* requete2=[NSString stringWithFormat:@"select score from Scores where (type = '%@' and number = %d )",@"quizz",1];
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    NSInteger indicescore=[_DB.arrColumnNames indexOfObject:@"score"];
    if(![[[myarray objectAtIndex:0]objectAtIndex:indicescore]  isEqual: @"0"]){
        _scoreBasics.text=[[myarray objectAtIndex:0]objectAtIndex:indicescore];
    }
    
    
    
    requete2=[NSString stringWithFormat:@"select score from Scores where (type = '%@' and number = %d )",@"quizz",2];
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    if(![[[myarray objectAtIndex:0]objectAtIndex:indicescore]  isEqual: @"0"]){
        _scoreLinearty.text=[[myarray objectAtIndex:0]objectAtIndex:indicescore];
    }
    
    requete2=[NSString stringWithFormat:@"select score from Scores where (type = '%@' and number = %d )",@"quizz",3];
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    if(![[[myarray objectAtIndex:0]objectAtIndex:indicescore]  isEqual: @"0"]){
        _Quadratica.text=[[myarray objectAtIndex:0]objectAtIndex:indicescore];
    }
    
    requete2=[NSString stringWithFormat:@"select score from Scores where (type = '%@' and number = %d )",@"quizz",4];
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    if(![[[myarray objectAtIndex:0]objectAtIndex:indicescore]  isEqual: @"0"]){
        _Multiplication.text=[[myarray objectAtIndex:0]objectAtIndex:indicescore];
    }
    
    requete2=[NSString stringWithFormat:@"select score from Scores where (type = '%@' and number = %d )",@"quizz",5];
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    if(![[[myarray objectAtIndex:0]objectAtIndex:indicescore]  isEqual: @"0"]){
        _scorePower.text=[[myarray objectAtIndex:0]objectAtIndex:indicescore];
    }
    
    requete2=[NSString stringWithFormat:@"select score from Scores where (type = '%@' and number = %d )",@"quizz",6];
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    if(![[[myarray objectAtIndex:0]objectAtIndex:indicescore]  isEqual: @"0"]){
        _scoreDivision.text=[[myarray objectAtIndex:0]objectAtIndex:indicescore];
    }
    
    requete2=[NSString stringWithFormat:@"select score from Scores where (type = '%@' and number = %d )",@"quizz",7];
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    if(![[[myarray objectAtIndex:0]objectAtIndex:indicescore]  isEqual: @"0"]){
        _scoreMentaliste.text=[[myarray objectAtIndex:0]objectAtIndex:indicescore];
    }

}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ViewController * views=[segue destinationViewController];
    
    if (sender == _btBasics) {
        
        views.QuizzType=@"Basics";
    }
    else if (sender == _btLinearty) {
        
        views.QuizzType=@"Linearty";
    }
    else if (sender == _btQuadratica) {
        
        views.QuizzType=@"Quadraticia";
    }
    else if (sender == _btMulti) {
        
        views.QuizzType=@"Multiplication";
    }
    else if (sender == _btPower) {
        
        views.QuizzType=@"Power Ranger";
    }
    else if (sender == _btDivision) {
        
        views.QuizzType=@"Division";
    }
    else {
        
        views.QuizzType=@"The Mentalist";
    }
}
- (IBAction)QuizzChoice:(id)sender {
}
@end
