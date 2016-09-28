//
//  ViewController.m
//  timer
//
//  Created by qwerty on 11/1/15.
//  Copyright © 2015 qwerty. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
NSString*typesQ;
int timercount;
int i=0;int j;    int e1;int e2;int verif;int deffici=1;int diffInc=0;int lvlss=0;
NSString * operator;
NSString * resultatQuadra;NSString * choixx2;NSString * choixx3;NSString * choixx4;
int resultat;int repFaux;int repVrais;
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    _DB=[[DBManager alloc]initWithDatabaseFilename:@"KingsOfMath"];
    typesQ=_QuizzType;
    _m.hidden=false;
    timercount=100;repVrais=0;repFaux=0;
    timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
    timerLabel.text= [NSString stringWithFormat:@"0"];
    e1=arc4random()%11+deffici*2;
    e2=arc4random()%11+deffici*2;
    if ([typesQ isEqual:@"The Mentalist"]) {
        lvlss=7;
        j=arc4random()%5;
        switch (j) {
            case 0:
                _QuizzType=@"Basics";
                break;
            case 1:
                _QuizzType=@"Multiplication";
                break;
            case 2:
                _QuizzType=@"Division";
                break;
            case 3:
                _QuizzType=@"Power Ranger";
                break;
            case 4:
                _QuizzType=@"Linearty";
                break;
            case 5:
                
                _QuizzType=@"Quadratica";
                break;
            default:
                
                _QuizzType=@"Basics";
                break;
        }
    }
    if([_QuizzType isEqual:@"Basics"]){
        lvlss=1;
        j=arc4random()%2;
        switch (j) {
            case 0:
                resultat=e1+e2;
                _question.text=[NSString stringWithFormat:@"%d + %d",e1,e2];
                break;
            case 1:
                resultat=e1-e2;
                _question.text=[NSString stringWithFormat:@"%d - %d",e1,e2];
                break;
            default:
                break;
        }
        
    }
    if([_QuizzType isEqual:@"Multiplication"]){
        lvlss=4;
        resultat=e1*e2;
        _question.text=[NSString stringWithFormat:@"%d * %d",e1,e2];
    }
    if([_QuizzType isEqual:@"Division"]){
        lvlss=6;
        e1=e1*e2;
        resultat=e1/e2;
        _question.text=[NSString stringWithFormat:@"%d / %d",e1,e2];
    }
    if([_QuizzType isEqual:@"Power Ranger"]){
        lvlss=5;
        e1=arc4random()%11;
        e2=arc4random()%5;
        resultat=1;
        for (int ggg=0; ggg<e2; ggg++) {
            resultat=resultat*e1;
        }
        if (e2==0) {
            _question.text=[NSString stringWithFormat:@"%d º",e1];
        }
        if (e2==1) {
            _question.text=[NSString stringWithFormat:@"%d ¹",e1];
        }
        if (e2==2) {
            _question.text=[NSString stringWithFormat:@"%d ²",e1];
        }
        if (e2==3) {
            _question.text=[NSString stringWithFormat:@"%d ³",e1];
        }

    }
    if ([_QuizzType isEqualToString:@"Linearty"]) {
        lvlss=2;
        int bb;
        int a1,b,c;
        a1=(arc4random()%10)+1;
        b=(arc4random()%20)+5;
        bb=a1*((arc4random()%4)+2);
        c=b-bb;
        if (c>=0) {
            _question.text=[NSString stringWithFormat:@"%d x + %d = %d",a1,c,b];
            
        }else{
            _question.text=[NSString stringWithFormat:@"%d x  %d = %d",a1,c,b];
            
        }
        resultat=((b-c)/a1);
        
    }
    if ([_QuizzType isEqualToString:@"Quadraticia"]) {
        lvlss=3;
        operator=@"quadra";
        
        int delta=0;
        int a,b2,c2=0,entier1,entier2;
        a=arc4random()%4+1;
        entier1=arc4random()%2;
        entier2=arc4random()%2+2;
        b2=-(entier1+entier2)*a;
        delta=((entier2-entier1)*a);
        delta=delta*delta;
        c2=((b2*b2)-delta)/(4*a);
        if (b2<0) {
            _question.text=[NSString stringWithFormat:@"%d x²  %d x ",a,b2];
        }else{
            _question.text=[NSString stringWithFormat:@"%d x² + %d x ",a,b2];
        }
        if (c2<0) {
            _question.text=[NSString stringWithFormat:@"%@  %d = 0 ",_question.text,c2];
        }else{
            _question.text=[NSString stringWithFormat:@"%@ + %d = 0 ",_question.text,c2];
        }
        resultatQuadra=[NSString stringWithFormat:@"x = [ %d , %d ]",entier1,entier2];
        choixx2=[NSString stringWithFormat:@"x = [ %d , %d ]",entier1+1,entier2];
        choixx3=[NSString stringWithFormat:@"x = [ %d , %d ]",entier1,entier2+2];
        choixx4=[NSString stringWithFormat:@"x = [ %d , %d ]",entier1+2,entier2+1];

        
    }
    i=0;
    
    
    verif=1+arc4random()%4;
    if(verif==1){
        if ([operator  isEqual: @"quadra"]) {
            [_r1 setTitle:resultatQuadra forState:UIControlStateNormal];
            [_r2 setTitle:choixx2 forState:UIControlStateNormal];
            [_r3 setTitle:choixx3 forState:UIControlStateNormal];
            [_r4 setTitle:choixx4 forState:UIControlStateNormal];
        }else{
            
            [_r1 setTitle:[NSString stringWithFormat:@"%d",resultat] forState:UIControlStateNormal];
            [_r2 setTitle:[NSString stringWithFormat:@"%d",resultat+1+arc4random()%4] forState:UIControlStateNormal];
            [_r3 setTitle:[NSString stringWithFormat:@"%d",resultat+5+arc4random()%5] forState:UIControlStateNormal];
            [_r4 setTitle:[NSString stringWithFormat:@"%d",resultat+10+arc4random()%10] forState:UIControlStateNormal];
            
        }
        
        
        
        
    }else if(verif==2){
        
        if ([operator  isEqual: @"quadra"]) {
            [_r1 setTitle:choixx2 forState:UIControlStateNormal];
            [_r2 setTitle:resultatQuadra forState:UIControlStateNormal];
            [_r3 setTitle:choixx3 forState:UIControlStateNormal];
            [_r4 setTitle:choixx4 forState:UIControlStateNormal];
        }else{
            
            [_r1 setTitle:[NSString stringWithFormat:@"%d",resultat+1+arc4random()%4] forState:UIControlStateNormal];
            [_r2 setTitle:[NSString stringWithFormat:@"%d",resultat] forState:UIControlStateNormal];
            [_r3 setTitle:[NSString stringWithFormat:@"%d",resultat+5+arc4random()%5] forState:UIControlStateNormal];
            [_r4 setTitle:[NSString stringWithFormat:@"%d",resultat+10+arc4random()%10] forState:UIControlStateNormal];
        }
    }else if(verif==3){
        
        if ([operator  isEqual: @"quadra"]) {
            [_r1 setTitle:choixx3 forState:UIControlStateNormal];
            [_r2 setTitle:choixx2 forState:UIControlStateNormal];
            [_r3 setTitle:resultatQuadra forState:UIControlStateNormal];
            [_r4 setTitle:choixx4 forState:UIControlStateNormal];
        }else{
            
            [_r1 setTitle:[NSString stringWithFormat:@"%d",resultat+1+arc4random()%4] forState:UIControlStateNormal];
            [_r2 setTitle:[NSString stringWithFormat:@"%d",resultat+5+arc4random()%5] forState:UIControlStateNormal];
            [_r3 setTitle:[NSString stringWithFormat:@"%d",resultat] forState:UIControlStateNormal];
            [_r4 setTitle:[NSString stringWithFormat:@"%d",resultat+10+arc4random()%10] forState:UIControlStateNormal];
        }
    }else if(verif==4){
        
        if ([operator  isEqual: @"quadra"]) {
            [_r1 setTitle:choixx4 forState:UIControlStateNormal];
            [_r2 setTitle:choixx2 forState:UIControlStateNormal];
            [_r3 setTitle:choixx3 forState:UIControlStateNormal];
            [_r4 setTitle:resultatQuadra forState:UIControlStateNormal];
        }else{
            
            [_r1 setTitle:[NSString stringWithFormat:@"%d",resultat+1+arc4random()%4] forState:UIControlStateNormal];
            [_r2 setTitle:[NSString stringWithFormat:@"%d",resultat+5+arc4random()%5] forState:UIControlStateNormal];
            [_r3 setTitle:[NSString stringWithFormat:@"%d",resultat+10+arc4random()%10] forState:UIControlStateNormal];
            [_r4 setTitle:[NSString stringWithFormat:@"%d",resultat] forState:UIControlStateNormal];
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)count{
    
    if(timercount<1){
        timercount=0;
        
        timerLabel.text= [NSString stringWithFormat:@"%i",timercount];
        _question.text=@"Game Over";
        int score=repVrais*200-repFaux*300+5000;
        if (score>0) {
            NSString* requete=[NSString stringWithFormat:@"update scores set score = %d where (type = '%@' and number = %d )",score,@"quizz",lvlss];
            
            [_DB executeQuery:requete];

        }
        _erreur.text=[NSString stringWithFormat:@"Your Score is : %d",score];
        _r1.hidden=true;_r2.hidden=true;_r3.hidden=true;_r4.hidden=true;
        _m.hidden=false;
    }else{
    timercount=timercount-1;
    timerLabel.text= [NSString stringWithFormat:@"%i",timercount];
    }
    
}

- (IBAction)backs:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)pause:(id)sender {
    
   if([[NSString stringWithFormat:@"%d",resultat]  isEqual: [sender titleForState:UIControlStateNormal]] ||
      
      ([operator  isEqual: @"quadra"]&& [resultatQuadra isEqualToString:[sender titleForState:UIControlStateNormal]])){
        i=i+1;
       diffInc++;
       if (diffInc == 4) { deffici++; diffInc = 0; }
       repVrais=repVrais+1;
        _erreur.text=@"";
       e1=arc4random()%11+deffici*2;
       e2=arc4random()%11+deffici*2;
       if ([typesQ isEqual:@"The Mentalist"]) {
           j=arc4random()%5;
           switch (j) {
               case 0:
                   _QuizzType=@"Basics";
                   break;
               case 1:
                   _QuizzType=@"Multiplication";
                   break;
               case 2:
                   _QuizzType=@"Division";
                   break;
               case 3:
                   _QuizzType=@"Power Ranger";
                   break;
               case 4:
                   _QuizzType=@"Linearty";
                   break;
               case 5:
                   
                   _QuizzType=@"Quadratica";
                   break;
               default:
                   
                   _QuizzType=@"Basics";
                   break;
           }
       }
       if([_QuizzType isEqual:@"Basics"]){
           j=arc4random()%2;
           switch (j) {
               case 0:
                   operator=@"+";
                   resultat=e1+e2;
                   _question.text=[NSString stringWithFormat:@"%d + %d",e1,e2];
                   break;
               case 1:
                   operator=@"-";
                   resultat=e1-e2;
                   _question.text=[NSString stringWithFormat:@"%d - %d",e1,e2];
                   break;
               default:
                   break;
           }
           
       }
       if([_QuizzType isEqual:@"Multiplication"]){
           
           operator=@"*";
           resultat=e1*e2;
           _question.text=[NSString stringWithFormat:@"%d * %d",e1,e2];
       }
       if([_QuizzType isEqual:@"Division"]){
           operator=@"/";
           e1=e1*e2;
           resultat=e1/e2;
           _question.text=[NSString stringWithFormat:@"%d / %d",e1,e2];
       }
       if([_QuizzType isEqual:@"Power Ranger"]){
           operator=@"power";
           e1=arc4random()%11;
           e2=arc4random()%4;
           resultat=1;
           for (int ggg=0; ggg<e2; ggg++) {
               resultat=resultat*e1;
           }
           if (e2==0) {
               _question.text=[NSString stringWithFormat:@"%d º",e1];
           }
           if (e2==1) {
               _question.text=[NSString stringWithFormat:@"%d ¹",e1];
           }
           if (e2==2) {
               _question.text=[NSString stringWithFormat:@"%d ²",e1];
           }
           if (e2==3) {
               _question.text=[NSString stringWithFormat:@"%d ³",e1];
           }
           
       }
       if ([_QuizzType isEqualToString:@"Linearty"]) {
           operator=@"linea";
           int bb;
           int a1,b,c;
           a1=(arc4random()%10)+1;
           b=(arc4random()%20)+5;
           bb=a1*((arc4random()%4)+2);
           c=b-bb;
           if (c>=0) {
               _question.text=[NSString stringWithFormat:@"%d x + %d = %d",a1,c,b];
               
           }else{
               _question.text=[NSString stringWithFormat:@"%d x  %d = %d",a1,c,b];
               
           }
           resultat=((b-c)/a1);
           
       }
       if ([_QuizzType isEqualToString:@"Quadraticia"]) {
           
           operator=@"quadra";
           
           int delta=0;
           int a,b2,c2=0,entier1,entier2;
           a=arc4random()%4+1;
           entier1=arc4random()%2;
           entier2=arc4random()%2+2;
           b2=-(entier1+entier2)*a;
           delta=((entier2-entier1)*a);
           delta=delta*delta;
           c2=((b2*b2)-delta)/(4*a);
           if (b2<0) {
               _question.text=[NSString stringWithFormat:@"%d x²  %d x ",a,b2];
           }else{
               _question.text=[NSString stringWithFormat:@"%d x² + %d x ",a,b2];
           }
           if (c2<0) {
               _question.text=[NSString stringWithFormat:@"%@  %d = 0 ",_question.text,c2];
           }else{
               _question.text=[NSString stringWithFormat:@"%@ + %d = 0 ",_question.text,c2];
           }
           resultatQuadra=[NSString stringWithFormat:@"x = [ %d , %d ]",entier1,entier2];
           choixx2=[NSString stringWithFormat:@"x = [ %d , %d ]",entier1+1,entier2];
           choixx3=[NSString stringWithFormat:@"x = [ %d , %d ]",entier1,entier2+2];
           choixx4=[NSString stringWithFormat:@"x = [ %d , %d ]",entier1+2,entier2+1];
           
           
       }
       i=0;
       
       
       verif=1+arc4random()%4;
       if(verif==1){
           if ([operator  isEqual: @"quadra"]) {
               [_r1 setTitle:resultatQuadra forState:UIControlStateNormal];
               [_r2 setTitle:choixx2 forState:UIControlStateNormal];
               [_r3 setTitle:choixx3 forState:UIControlStateNormal];
               [_r4 setTitle:choixx4 forState:UIControlStateNormal];
           }else{
               
               [_r1 setTitle:[NSString stringWithFormat:@"%d",resultat] forState:UIControlStateNormal];
               [_r2 setTitle:[NSString stringWithFormat:@"%d",resultat+1+arc4random()%4] forState:UIControlStateNormal];
               [_r3 setTitle:[NSString stringWithFormat:@"%d",resultat+5+arc4random()%5] forState:UIControlStateNormal];
               [_r4 setTitle:[NSString stringWithFormat:@"%d",resultat+10+arc4random()%10] forState:UIControlStateNormal];
               
           }
           
           
           
           
       }else if(verif==2){
           
           if ([operator  isEqual: @"quadra"]) {
               [_r1 setTitle:choixx2 forState:UIControlStateNormal];
               [_r2 setTitle:resultatQuadra forState:UIControlStateNormal];
               [_r3 setTitle:choixx3 forState:UIControlStateNormal];
               [_r4 setTitle:choixx4 forState:UIControlStateNormal];
           }else{
               
               [_r1 setTitle:[NSString stringWithFormat:@"%d",resultat+1+arc4random()%4] forState:UIControlStateNormal];
               [_r2 setTitle:[NSString stringWithFormat:@"%d",resultat] forState:UIControlStateNormal];
               [_r3 setTitle:[NSString stringWithFormat:@"%d",resultat+5+arc4random()%5] forState:UIControlStateNormal];
               [_r4 setTitle:[NSString stringWithFormat:@"%d",resultat+10+arc4random()%10] forState:UIControlStateNormal];
           }
       }else if(verif==3){
           
           if ([operator  isEqual: @"quadra"]) {
               [_r1 setTitle:choixx3 forState:UIControlStateNormal];
               [_r2 setTitle:choixx2 forState:UIControlStateNormal];
               [_r3 setTitle:resultatQuadra forState:UIControlStateNormal];
               [_r4 setTitle:choixx4 forState:UIControlStateNormal];
           }else{
               
               [_r1 setTitle:[NSString stringWithFormat:@"%d",resultat+1+arc4random()%4] forState:UIControlStateNormal];
               [_r2 setTitle:[NSString stringWithFormat:@"%d",resultat+5+arc4random()%5] forState:UIControlStateNormal];
               [_r3 setTitle:[NSString stringWithFormat:@"%d",resultat] forState:UIControlStateNormal];
               [_r4 setTitle:[NSString stringWithFormat:@"%d",resultat+10+arc4random()%10] forState:UIControlStateNormal];
           }
       }else if(verif==4){
           
           if ([operator  isEqual: @"quadra"]) {
               [_r1 setTitle:choixx4 forState:UIControlStateNormal];
               [_r2 setTitle:choixx2 forState:UIControlStateNormal];
               [_r3 setTitle:choixx3 forState:UIControlStateNormal];
               [_r4 setTitle:resultatQuadra forState:UIControlStateNormal];
           }else{
               
               [_r1 setTitle:[NSString stringWithFormat:@"%d",resultat+1+arc4random()%4] forState:UIControlStateNormal];
               [_r2 setTitle:[NSString stringWithFormat:@"%d",resultat+5+arc4random()%5] forState:UIControlStateNormal];
               [_r3 setTitle:[NSString stringWithFormat:@"%d",resultat+10+arc4random()%10] forState:UIControlStateNormal];
               [_r4 setTitle:[NSString stringWithFormat:@"%d",resultat] forState:UIControlStateNormal];
           }
       }
       
       
     
    }else{
        _erreur.text=@"False";
        timercount=timercount-5;
        repFaux=repFaux+1;
         }
 
}


@end
