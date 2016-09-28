//
//  ViewController5.m
//  timer
//
//  Created by yosemite on 11/11/15.
//  Copyright © 2015 qwerty. All rights reserved.
//

#import "ViewController5.h"
#import "MapViewControler.h"

@interface ViewController5 ()

@end
int e11;int e12;int resultat1;int verif1=0;
int repFaux1;int repVrais1;int lifes;NSString *op;int lvls;int divi;
@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _DB=[[DBManager alloc]initWithDatabaseFilename:@"KingsOfMath"];
    
    lvls=[_b intValue];
    lifes=3;
    _m.hidden=false;
    
    e11=(arc4random()%10+1)*lvls;
    e12=(arc4random()%10+1)*lvls;
    if ([_a  isEqual:@"1"]) {
        resultat1=e11+e12;op=@" + ";
        _a=@"addition";
    }
    if ([_a  isEqual:@"2"]) {
        resultat1=e11-e12;op=@" - ";
        _a=@"soustraction";
    }
    if ([_a  isEqual:@"3"]) {
        resultat1=e11*e12;op=@" * ";
        _a=@"multiplication";
    }
    if ([_a  isEqual:@"4"]) {
        divi=arc4random()%(lvls*5);
        e11=e12*divi;
        resultat1=e11/e12;op=@" / ";
        _a=@"division";
    }
    _life.text=[NSString stringWithFormat:@"%d",lifes];
    repVrais1=0;repFaux1=0;
    _question.text=[NSString stringWithFormat:@"%d %@ %d",e11,op,e12];
    verif1=1+arc4random()%3;
    if(verif1==1){
        
        
        [_r1 setTitle:[NSString stringWithFormat:@"%d",resultat1] forState:UIControlStateNormal];
        [_r2 setTitle:[NSString stringWithFormat:@"%d",resultat1+1+arc4random()%4] forState:UIControlStateNormal];
        [_r3 setTitle:[NSString stringWithFormat:@"%d",resultat1+5+arc4random()%5] forState:UIControlStateNormal];
        [_r4 setTitle:[NSString stringWithFormat:@"%d",resultat1+10+arc4random()%10] forState:UIControlStateNormal];
    }else if(verif1==2){
        
        
        [_r1 setTitle:[NSString stringWithFormat:@"%d",resultat1+1+arc4random()%4] forState:UIControlStateNormal];
        [_r2 setTitle:[NSString stringWithFormat:@"%d",resultat1] forState:UIControlStateNormal];
        [_r3 setTitle:[NSString stringWithFormat:@"%d",resultat1+5+arc4random()%5] forState:UIControlStateNormal];
        [_r4 setTitle:[NSString stringWithFormat:@"%d",resultat1+10+arc4random()%10] forState:UIControlStateNormal];
    }else if(verif1==3){
        
        
        [_r1 setTitle:[NSString stringWithFormat:@"%d",resultat1+1+arc4random()%4] forState:UIControlStateNormal];
        [_r2 setTitle:[NSString stringWithFormat:@"%d",resultat1+5+arc4random()%5] forState:UIControlStateNormal];
        [_r3 setTitle:[NSString stringWithFormat:@"%d",resultat1] forState:UIControlStateNormal];
        [_r4 setTitle:[NSString stringWithFormat:@"%d",resultat1+10+arc4random()%10] forState:UIControlStateNormal];
    }else if(verif1==4){
        
        
        [_r1 setTitle:[NSString stringWithFormat:@"%d",resultat1+1+arc4random()%4] forState:UIControlStateNormal];
        [_r2 setTitle:[NSString stringWithFormat:@"%d",resultat1+5+arc4random()%5] forState:UIControlStateNormal];
        [_r3 setTitle:[NSString stringWithFormat:@"%d",resultat1+10+arc4random()%10] forState:UIControlStateNormal];
        [_r4 setTitle:[NSString stringWithFormat:@"%d",resultat1] forState:UIControlStateNormal];
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

- (IBAction)backs:(id)sender {
    //[self dismissViewControllerAnimated:YES completion:nil];
    
    MapViewControler *sv = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"MapView"];
    [self.navigationController pushViewController:sv animated:NO];
}

- (IBAction)calcul:(id)sender {
    
    
    
    
    if([[NSString stringWithFormat:@"%d",resultat1]  isEqual: [sender titleForState:UIControlStateNormal]]){
        
        
        repVrais1=repVrais1+1;
        verif1=1+arc4random()%3;
        
        e11=(arc4random()%10+1)*lvls;
        e12=(arc4random()%10+1)*lvls;
        if ([_a  isEqual:@"addition"]) {
            resultat1=e11+e12;op=@" + ";
        }
        if ([_a  isEqual:@"soustraction"]) {
            resultat1=e11-e12;op=@" - ";
        }
        if ([_a  isEqual:@"multiplication"]) {
            resultat1=e11*e12;op=@" * ";
        }
        if ([_a  isEqual:@"division"]) {
            divi=arc4random()%(lvls*5);
            e11=e12*divi;
            resultat1=e11/e12;op=@" / ";
        }
        
        _erreur.text=@"";
        _question.text=[NSString stringWithFormat:@"%d %@ %d",e11,op,e12];
        if(verif1==1){
            
            
            [_r1 setTitle:[NSString stringWithFormat:@"%d",resultat1] forState:UIControlStateNormal];
            [_r2 setTitle:[NSString stringWithFormat:@"%d",resultat1+1+arc4random()%4] forState:UIControlStateNormal];
            [_r3 setTitle:[NSString stringWithFormat:@"%d",resultat1+5+arc4random()%5] forState:UIControlStateNormal];
            [_r4 setTitle:[NSString stringWithFormat:@"%d",resultat1+10+arc4random()%10] forState:UIControlStateNormal];
        }else if(verif1==2){
            
            
            [_r1 setTitle:[NSString stringWithFormat:@"%d",resultat1+1+arc4random()%4] forState:UIControlStateNormal];
            [_r2 setTitle:[NSString stringWithFormat:@"%d",resultat1] forState:UIControlStateNormal];
            [_r3 setTitle:[NSString stringWithFormat:@"%d",resultat1+5+arc4random()%5] forState:UIControlStateNormal];
            [_r4 setTitle:[NSString stringWithFormat:@"%d",resultat1+10+arc4random()%10] forState:UIControlStateNormal];
        }else if(verif1==3){
            
            
            [_r1 setTitle:[NSString stringWithFormat:@"%d",resultat1+1+arc4random()%4] forState:UIControlStateNormal];
            [_r2 setTitle:[NSString stringWithFormat:@"%d",resultat1+5+arc4random()%5] forState:UIControlStateNormal];
            [_r3 setTitle:[NSString stringWithFormat:@"%d",resultat1] forState:UIControlStateNormal];
            [_r4 setTitle:[NSString stringWithFormat:@"%d",resultat1+10+arc4random()%10] forState:UIControlStateNormal];
        }else if(verif1==4){
            
            
            [_r1 setTitle:[NSString stringWithFormat:@"%d",resultat1+1+arc4random()%4] forState:UIControlStateNormal];
            [_r2 setTitle:[NSString stringWithFormat:@"%d",resultat1+5+arc4random()%5] forState:UIControlStateNormal];
            [_r3 setTitle:[NSString stringWithFormat:@"%d",resultat1+10+arc4random()%10] forState:UIControlStateNormal];
            [_r4 setTitle:[NSString stringWithFormat:@"%d",resultat1] forState:UIControlStateNormal];
        }
        
        
    }else{
        _erreur.text=@"False";
        lifes=lifes-1;
        _life.text= [NSString stringWithFormat:@"%d",lifes];
        repFaux1=repFaux1+1;
        if (lifes==2) {
            _l3.image=[UIImage imageNamed:@"life1.png"];
        }
        if (lifes==1) {
            _l2.image=[UIImage imageNamed:@"life1.png"];
        }
        if (lifes==0) {
            _l1.image=[UIImage imageNamed:@"life1.png"];
        }
    }
    if(repVrais1==10){
        _question.text=@"** Congratulations **";
        int score=repVrais1*200-repFaux1*400+5000;
        _erreur.text=[NSString stringWithFormat:@"Your Score is : %d",score];
        _r1.hidden=true;_r2.hidden=true;_r3.hidden=true;_r4.hidden=true;
        _m.hidden=false;
        NSString* requete=[NSString stringWithFormat:@"update scores set score = %d where (type = '%@' and number = %d )",score,_a,lvls];
       
        [_DB executeQuery:requete];
        
        NSString* requete2=[NSString stringWithFormat:@"select score from Scores where (type = '%@' and number = %d )",_a,lvls];
        NSArray* myarray;
        myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
        NSInteger indicescore=[_DB.arrColumnNames indexOfObject:@"score"];
        NSString* Bscore=[[myarray objectAtIndex:0]objectAtIndex:indicescore];
        NSLog(@"%@",Bscore);
        
    }
    if(lifes<1){
        lifes=0;
        
        _life.text= [NSString stringWithFormat:@"%d",lifes];
        _question.text=@"Game Over";
        _erreur.text=@"!!!  Chapter Failed  !!!";
        _r1.hidden=true;_r2.hidden=true;_r3.hidden=true;_r4.hidden=true;
        _m.hidden=false;
    }
}
@end
