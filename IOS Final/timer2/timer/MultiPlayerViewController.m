//
//  MultiPlayerViewController.m
//  timer
//
//  Created by ESPRIT on 03/01/2016.
//  Copyright © 2016 qwerty. All rights reserved.
//

#import "MultiPlayerViewController.h"

@interface MultiPlayerViewController ()

@end
int score1=0;int score2=0; int solution = 0; int deff = 1;int ii = 0;int jj = 0; NSString *opop = @"";int nb1 = 0;int nb2 = 0;

NSString *operation = @"";
@implementation MultiPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _bt1p2.transform=CGAffineTransformMakeRotation(180.0*M_PI/180.0);
    _bt2p2.transform=CGAffineTransformMakeRotation(180.0*M_PI/180.0);
    _bt3p2.transform=CGAffineTransformMakeRotation(180.0*M_PI/180.0);
    _bt4p2.transform=CGAffineTransformMakeRotation(180.0*M_PI/180.0);
    _TFquestion2.transform=CGAffineTransformMakeRotation(180.0*M_PI/180.0);
    _TFScore2.transform=CGAffineTransformMakeRotation(180.0*M_PI/180.0);
    
    _TFScore2.text = [NSString stringWithFormat:@"score = %d", score2];
    _TFScore1.text = [NSString stringWithFormat:@"score = %d", score1];

    //GameSet();
    
    
    
    jj = (arc4random()%7);
    if (jj == 0) { opop = @"+"; }
    if (jj == 1) { opop = @"-"; }
    if (jj == 2) { opop = @"*"; }
    if (jj == 3) { opop = @"/"; }
    if (jj == 4) { opop = @"power"; }
    if (jj == 5) { opop = @"quadra"; }
    if (jj == 6) { opop = @"Linearty"; }
    
    
    
    nb1 =(arc4random()%10+deff*2);
    nb2 =(arc4random()%10+deff*2);
    
    if ([opop  isEqual: @"+"])
    {
        solution = nb1 + nb2;
    }
    if ([opop  isEqual: @"-"])
    {
        solution = nb1 - nb2;
    }
    if ([opop  isEqual: @"*"])
    {
        solution = nb1 * nb2;
    }
    if ([opop  isEqual: @"/"])
    {
        nb1 = nb2 * nb1;
        solution = nb1 / nb2;
    }
    
    _TFquestion1.text =[NSString stringWithFormat:@"%d %@ %d", nb1,opop,nb2];
    _TFquestion2.text =[NSString stringWithFormat:@"%d %@ %d", nb1,opop,nb2];
    if ([opop  isEqual: @"power"])
    {
        nb1 = (arc4random()%11);
        nb2 = (arc4random()%4);
        solution = 1;
        for (int ggg = 0; ggg < nb2; ggg++)
        {
            
            solution = solution * nb1;
        }
        if (nb2 == 0)
        {
            _TFquestion1.text = [NSString stringWithFormat:@"%d º", nb1];
            _TFquestion2.text = [NSString stringWithFormat:@"%d º", nb1];
        }
        if (nb2 == 1)
        {
            _TFquestion1.text = [NSString stringWithFormat:@"%d ¹", nb1];
            _TFquestion2.text = [NSString stringWithFormat:@"%d ¹", nb1];
        }
        if (nb2 == 2)
        {
            _TFquestion1.text = [NSString stringWithFormat:@"%d ²", nb1];
            _TFquestion2.text = [NSString stringWithFormat:@"%d ²", nb1];
        }
        if (nb2 == 3)
        {
            _TFquestion1.text = [NSString stringWithFormat:@"%d ³", nb1];
            _TFquestion2.text = [NSString stringWithFormat:@"%d ³", nb1];
        }
    }
    
    int seuil = 15;
    if ([opop  isEqual: @"Linearty"])
    {
        
        int bb;
        int a1, b, c;
        a1 = (arc4random()%9) + 1;
        b = (arc4random()%20) + 5;
        bb = a1 * ((arc4random()%4) + 1);
        c = b - bb;
        if (c >= 0)
        {
            _TFquestion1.text = [NSString stringWithFormat:@"%d x + %d = %d", a1,c,b];
            _TFquestion2.text = [NSString stringWithFormat:@"%d x + %d = %d", a1,c,b];
        }
        else if (c < 0)
        {
            _TFquestion1.text = [NSString stringWithFormat:@"%d x  %d = %d", a1,c,b];
            _TFquestion2.text = [NSString stringWithFormat:@"%d x  %d = %d", a1,c,b];
        }
        
        solution = ((b - c) / a1);
        seuil = 5;
        
    }
    int choix1 =(arc4random()%seuil-1)+1 + solution;
    int choix2 = 0;
    int choix3 = 0;
    do
    {
        choix2 = (arc4random()%seuil-1)+1 + solution;choix3 = (arc4random()%seuil-1)+1 + solution;
    } while (choix1 == choix2 || choix2 == choix3 || choix1 == choix3 || solution == choix1 || solution == choix2 || solution == choix3 );
    
    
    ii = (arc4random()%4);
    if (ii == 0)
    {
        [_bt1p1 setTitle:[NSString stringWithFormat:@"%d",solution] forState:UIControlStateNormal];
        [_bt2p1 setTitle:[NSString stringWithFormat:@"%d",choix1] forState:UIControlStateNormal];
        [_bt3p1 setTitle:[NSString stringWithFormat:@"%d",choix2] forState:UIControlStateNormal];
        [_bt4p1 setTitle:[NSString stringWithFormat:@"%d",choix3] forState:UIControlStateNormal];
        
        [_bt1p2 setTitle:[NSString stringWithFormat:@"%d",solution] forState:UIControlStateNormal];
        [_bt2p2 setTitle:[NSString stringWithFormat:@"%d",choix1] forState:UIControlStateNormal];
        [_bt3p2 setTitle:[NSString stringWithFormat:@"%d",choix2] forState:UIControlStateNormal];
        [_bt4p2 setTitle:[NSString stringWithFormat:@"%d",choix3] forState:UIControlStateNormal];
        
    }
    if (ii == 1)
    {
        [_bt1p1 setTitle:[NSString stringWithFormat:@"%d",choix1] forState:UIControlStateNormal];
        [_bt2p1 setTitle:[NSString stringWithFormat:@"%d",solution] forState:UIControlStateNormal];
        [_bt3p1 setTitle:[NSString stringWithFormat:@"%d",choix2] forState:UIControlStateNormal];
        [_bt4p1 setTitle:[NSString stringWithFormat:@"%d",choix3] forState:UIControlStateNormal];
        
        [_bt1p2 setTitle:[NSString stringWithFormat:@"%d",choix1] forState:UIControlStateNormal];
        [_bt2p2 setTitle:[NSString stringWithFormat:@"%d",solution] forState:UIControlStateNormal];
        [_bt3p2 setTitle:[NSString stringWithFormat:@"%d",choix2] forState:UIControlStateNormal];
        [_bt4p2 setTitle:[NSString stringWithFormat:@"%d",choix3] forState:UIControlStateNormal];
        
    }
    if (ii == 2)
    {
        [_bt1p1 setTitle:[NSString stringWithFormat:@"%d",choix2] forState:UIControlStateNormal];
        [_bt2p1 setTitle:[NSString stringWithFormat:@"%d",choix1] forState:UIControlStateNormal];
        [_bt3p1 setTitle:[NSString stringWithFormat:@"%d",solution] forState:UIControlStateNormal];
        [_bt4p1 setTitle:[NSString stringWithFormat:@"%d",choix3] forState:UIControlStateNormal];
        
        [_bt1p2 setTitle:[NSString stringWithFormat:@"%d",choix2] forState:UIControlStateNormal];
        [_bt2p2 setTitle:[NSString stringWithFormat:@"%d",choix1] forState:UIControlStateNormal];
        [_bt3p2 setTitle:[NSString stringWithFormat:@"%d",solution] forState:UIControlStateNormal];
        [_bt4p2 setTitle:[NSString stringWithFormat:@"%d",choix3] forState:UIControlStateNormal];
        
    }
    if (ii == 3)
    {
        [_bt1p1 setTitle:[NSString stringWithFormat:@"%d",choix3] forState:UIControlStateNormal];
        [_bt2p1 setTitle:[NSString stringWithFormat:@"%d",choix1] forState:UIControlStateNormal];
        [_bt3p1 setTitle:[NSString stringWithFormat:@"%d",choix2] forState:UIControlStateNormal];
        [_bt4p1 setTitle:[NSString stringWithFormat:@"%d",solution] forState:UIControlStateNormal];
        
        [_bt1p2 setTitle:[NSString stringWithFormat:@"%d",choix3] forState:UIControlStateNormal];
        [_bt2p2 setTitle:[NSString stringWithFormat:@"%d",choix1] forState:UIControlStateNormal];
        [_bt3p2 setTitle:[NSString stringWithFormat:@"%d",choix2] forState:UIControlStateNormal];
        [_bt4p2 setTitle:[NSString stringWithFormat:@"%d",solution] forState:UIControlStateNormal];
        
        
    }
    
    if ([opop  isEqual: @"quadra"])
    {
        int delta = 0;
        int a, b, c = 0, entier1, entier2;
        a = (arc4random()%4) + 1;
        entier1 = (arc4random()%2);
        entier2 = (arc4random()%2) + 2;
        b = -(entier1 + entier2) * a;
        delta = ((entier2 - entier1) * a);
        delta = delta * delta;
        c = ((b * b) - delta) / (4 * a);
        
        if (b < 0)
        {
            _TFquestion1.text =[NSString stringWithFormat:@"%d x² %d x",a,b];
            _TFquestion2.text = [NSString stringWithFormat:@"%d x² %d x",a,b];
        }
        else
        {
            _TFquestion1.text = [NSString stringWithFormat:@"%d x² + %d x",a,b];
            _TFquestion2.text = [NSString stringWithFormat:@"%d x² + %d x",a,b];
        }
        if (c < 0)
        {
            _TFquestion1.text =[NSString stringWithFormat:@"%@ %d = 0",_TFquestion1.text,c];
            _TFquestion2.text =[NSString stringWithFormat:@"%@ %d = 0",_TFquestion2.text,c];
            
        }
        else
        {
            
            _TFquestion1.text =[NSString stringWithFormat:@"%@ + %d = 0",_TFquestion1.text,c];
            _TFquestion2.text =[NSString stringWithFormat:@"%@ + %d = 0",_TFquestion2.text,c];
            
        }
        
        NSString* solutionCh =[NSString stringWithFormat:@"x = [%d , %d]",entier1,entier2];
        NSString* choixx1 =[NSString stringWithFormat:@"x = [%d , %d]",entier1+1,entier2];
        NSString* choixx2 = [NSString stringWithFormat:@"x = [%d , %d]",entier1,entier2+2];
        NSString* choixx3 = [NSString stringWithFormat:@"x = [%d , %d]",entier1+2,entier2+1];
        if (ii == 0)
        {
            [_bt1p1 setTitle:[NSString stringWithFormat:@"%@",solutionCh] forState:UIControlStateNormal];
            [_bt2p1 setTitle:[NSString stringWithFormat:@"%@",choixx1] forState:UIControlStateNormal];
            [_bt3p1 setTitle:[NSString stringWithFormat:@"%@",choixx2] forState:UIControlStateNormal];
            [_bt4p1 setTitle:[NSString stringWithFormat:@"%@",choixx3] forState:UIControlStateNormal];
            
            [_bt1p2 setTitle:[NSString stringWithFormat:@"%@",solutionCh] forState:UIControlStateNormal];
            [_bt2p2 setTitle:[NSString stringWithFormat:@"%@",choixx1] forState:UIControlStateNormal];
            [_bt3p2 setTitle:[NSString stringWithFormat:@"%@",choixx2] forState:UIControlStateNormal];
            [_bt4p2 setTitle:[NSString stringWithFormat:@"%@",choixx3] forState:UIControlStateNormal];
            
        }
        if (ii == 1)
        {
            [_bt1p1 setTitle:[NSString stringWithFormat:@"%@",choixx1] forState:UIControlStateNormal];
            [_bt2p1 setTitle:[NSString stringWithFormat:@"%@",solutionCh] forState:UIControlStateNormal];
            [_bt3p1 setTitle:[NSString stringWithFormat:@"%@",choixx2] forState:UIControlStateNormal];
            [_bt4p1 setTitle:[NSString stringWithFormat:@"%@",choixx3] forState:UIControlStateNormal];
            
            [_bt1p2 setTitle:[NSString stringWithFormat:@"%@",choixx1] forState:UIControlStateNormal];
            [_bt2p2 setTitle:[NSString stringWithFormat:@"%@",solutionCh] forState:UIControlStateNormal];
            [_bt3p2 setTitle:[NSString stringWithFormat:@"%@",choixx2] forState:UIControlStateNormal];
            [_bt4p2 setTitle:[NSString stringWithFormat:@"%@",choixx3] forState:UIControlStateNormal];
            
        }
        if (ii == 2)
        {
            [_bt1p1 setTitle:[NSString stringWithFormat:@"%@",choixx2] forState:UIControlStateNormal];
            [_bt2p1 setTitle:[NSString stringWithFormat:@"%@",choixx1] forState:UIControlStateNormal];
            [_bt3p1 setTitle:[NSString stringWithFormat:@"%@",solutionCh] forState:UIControlStateNormal];
            [_bt4p1 setTitle:[NSString stringWithFormat:@"%@",choixx3] forState:UIControlStateNormal];
            
            [_bt1p2 setTitle:[NSString stringWithFormat:@"%@",choixx2] forState:UIControlStateNormal];
            [_bt2p2 setTitle:[NSString stringWithFormat:@"%@",choixx1] forState:UIControlStateNormal];
            [_bt3p2 setTitle:[NSString stringWithFormat:@"%@",solutionCh] forState:UIControlStateNormal];
            [_bt4p2 setTitle:[NSString stringWithFormat:@"%@",choixx3] forState:UIControlStateNormal];
            
        }
        if (ii == 3)
        {
            [_bt1p1 setTitle:[NSString stringWithFormat:@"%@",choixx3] forState:UIControlStateNormal];
            [_bt2p1 setTitle:[NSString stringWithFormat:@"%@",choixx1] forState:UIControlStateNormal];
            [_bt3p1 setTitle:[NSString stringWithFormat:@"%@",choixx2] forState:UIControlStateNormal];
            [_bt4p1 setTitle:[NSString stringWithFormat:@"%@",solutionCh] forState:UIControlStateNormal];
            
            [_bt1p2 setTitle:[NSString stringWithFormat:@"%@",choixx3] forState:UIControlStateNormal];
            [_bt2p2 setTitle:[NSString stringWithFormat:@"%@",choixx1] forState:UIControlStateNormal];
            [_bt3p2 setTitle:[NSString stringWithFormat:@"%@",choixx2] forState:UIControlStateNormal];
            [_bt4p2 setTitle:[NSString stringWithFormat:@"%@",solutionCh] forState:UIControlStateNormal];
            
            
        }
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






- (IBAction)exitMP:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)BTrpClick:(id)sender {
    int indiceBT=-1;int player=0;
    if (sender==_bt1p1) {
        indiceBT=0;player=1;
    }if (sender==_bt2p1) {
        indiceBT=1;player=1;
    }if (sender==_bt3p1) {
        indiceBT=2;player=1;
    }if (sender==_bt4p1) {
        indiceBT=3;player=1;
    }
    if (sender==_bt1p2) {
        indiceBT=0;player=2;
    }if (sender==_bt2p2) {
        indiceBT=1;player=2;
    }if (sender==_bt3p2) {
        indiceBT=2;player=2;
    }if (sender==_bt4p2) {
        indiceBT=3;player=2;
    }
    
    
    if (ii == indiceBT)
    {
        deff++;
        if (player == 1)
        {
            score1++;
            _TFScore1.text = [NSString stringWithFormat:@"score = %d",score1];
        }
        else
        {
            score2++;
            _TFScore2.text = [NSString stringWithFormat:@"score = %d",score2];

        }
        if (score1 == 10)
        {
            _bt1p1.hidden = true;_bt2p1.hidden = true;_bt3p1.hidden = true;_bt4p1.hidden = true;
            _bt1p2.hidden = true;_bt2p2.hidden = true;_bt3p2.hidden = true;_bt4p2.hidden = true;
            _TFquestion1.text = @"You WIN";
            _TFquestion2.text = @"You LOSE";
        }
        else if (score2 == 10)
        {
            _bt1p1.hidden = true;_bt2p1.hidden = true;_bt3p1.hidden = true;_bt4p1.hidden = true;
            _bt1p2.hidden = true;_bt2p2.hidden = true;_bt3p2.hidden = true;_bt4p2.hidden = true;
            _TFquestion1.text = @"You LOSE";
            _TFquestion2.text = @"You WIN";
        }
        else
        {
            
            
            jj = (arc4random()%7);
            if (jj == 0) { opop = @"+"; }
            if (jj == 1) { opop = @"-"; }
            if (jj == 2) { opop = @"*"; }
            if (jj == 3) { opop = @"/"; }
            if (jj == 4) { opop = @"power"; }
            if (jj == 5) { opop = @"quadra"; }
            if (jj == 6) { opop = @"Linearty"; }
            
            
            
            nb1 =(arc4random()%10+deff*2);
            nb2 =(arc4random()%10+deff*2);
            
            if ([opop  isEqual: @"+"])
            {
                solution = nb1 + nb2;
            }
            if ([opop  isEqual: @"-"])
            {
                solution = nb1 - nb2;
            }
            if ([opop  isEqual: @"*"])
            {
                solution = nb1 * nb2;
            }
            if ([opop  isEqual: @"/"])
            {
                nb1 = nb2 * nb1;
                solution = nb1 / nb2;
            }
            
            _TFquestion1.text =[NSString stringWithFormat:@"%d %@ %d", nb1,opop,nb2];
            _TFquestion2.text =[NSString stringWithFormat:@"%d %@ %d", nb1,opop,nb2];
            if ([opop  isEqual: @"power"])
            {
                nb1 = (arc4random()%11);
                nb2 = (arc4random()%4);
                solution = 1;
                for (int ggg = 0; ggg < nb2; ggg++)
                {
                    
                    solution = solution * nb1;
                }
                if (nb2 == 0)
                {
                    _TFquestion1.text = [NSString stringWithFormat:@"%d º", nb1];
                    _TFquestion2.text = [NSString stringWithFormat:@"%d º", nb1];
                }
                if (nb2 == 1)
                {
                    _TFquestion1.text = [NSString stringWithFormat:@"%d ¹", nb1];
                    _TFquestion2.text = [NSString stringWithFormat:@"%d ¹", nb1];
                }
                if (nb2 == 2)
                {
                    _TFquestion1.text = [NSString stringWithFormat:@"%d ²", nb1];
                    _TFquestion2.text = [NSString stringWithFormat:@"%d ²", nb1];
                }
                if (nb2 == 3)
                {
                    _TFquestion1.text = [NSString stringWithFormat:@"%d ³", nb1];
                    _TFquestion2.text = [NSString stringWithFormat:@"%d ³", nb1];
                }
            }
            
            int seuil = 15;
            if ([opop  isEqual: @"Linearty"])
            {
                
                int bb;
                int a1, b, c;
                a1 = (arc4random()%9) + 1;
                b = (arc4random()%20) + 5;
                bb = a1 * ((arc4random()%4) + 1);
                c = b - bb;
                if (c >= 0)
                {
                    _TFquestion1.text = [NSString stringWithFormat:@"%d x + %d = %d", a1,c,b];
                    _TFquestion2.text = [NSString stringWithFormat:@"%d x + %d = %d", a1,c,b];
                }
                else if (c < 0)
                {
                    _TFquestion1.text = [NSString stringWithFormat:@"%d x  %d = %d", a1,c,b];
                    _TFquestion2.text = [NSString stringWithFormat:@"%d x  %d = %d", a1,c,b];
                }
                
                solution = ((b - c) / a1);
                seuil = 5;
                
            }
            int choix1 =(arc4random()%seuil-1)+1 + solution;
            int choix2 = 0;
            int choix3 = 0;
            do
            {
                choix2 = (arc4random()%seuil-1)+1 + solution;choix3 = (arc4random()%seuil-1)+1 + solution;
            } while (choix1 == choix2 || choix2 == choix3 || choix1 == choix3);
            ii = (arc4random()%3);
            if (ii == 0)
            {
                [_bt1p1 setTitle:[NSString stringWithFormat:@"%d",solution] forState:UIControlStateNormal];
                [_bt2p1 setTitle:[NSString stringWithFormat:@"%d",choix1] forState:UIControlStateNormal];
                [_bt3p1 setTitle:[NSString stringWithFormat:@"%d",choix2] forState:UIControlStateNormal];
                [_bt4p1 setTitle:[NSString stringWithFormat:@"%d",choix3] forState:UIControlStateNormal];
                
                [_bt1p2 setTitle:[NSString stringWithFormat:@"%d",solution] forState:UIControlStateNormal];
                [_bt2p2 setTitle:[NSString stringWithFormat:@"%d",choix1] forState:UIControlStateNormal];
                [_bt3p2 setTitle:[NSString stringWithFormat:@"%d",choix2] forState:UIControlStateNormal];
                [_bt4p2 setTitle:[NSString stringWithFormat:@"%d",choix3] forState:UIControlStateNormal];
                
            }
            if (ii == 1)
            {
                [_bt1p1 setTitle:[NSString stringWithFormat:@"%d",choix1] forState:UIControlStateNormal];
                [_bt2p1 setTitle:[NSString stringWithFormat:@"%d",solution] forState:UIControlStateNormal];
                [_bt3p1 setTitle:[NSString stringWithFormat:@"%d",choix2] forState:UIControlStateNormal];
                [_bt4p1 setTitle:[NSString stringWithFormat:@"%d",choix3] forState:UIControlStateNormal];
                
                [_bt1p2 setTitle:[NSString stringWithFormat:@"%d",choix1] forState:UIControlStateNormal];
                [_bt2p2 setTitle:[NSString stringWithFormat:@"%d",solution] forState:UIControlStateNormal];
                [_bt3p2 setTitle:[NSString stringWithFormat:@"%d",choix2] forState:UIControlStateNormal];
                [_bt4p2 setTitle:[NSString stringWithFormat:@"%d",choix3] forState:UIControlStateNormal];
                
            }
            if (ii == 2)
            {
                [_bt1p1 setTitle:[NSString stringWithFormat:@"%d",choix2] forState:UIControlStateNormal];
                [_bt2p1 setTitle:[NSString stringWithFormat:@"%d",choix1] forState:UIControlStateNormal];
                [_bt3p1 setTitle:[NSString stringWithFormat:@"%d",solution] forState:UIControlStateNormal];
                [_bt4p1 setTitle:[NSString stringWithFormat:@"%d",choix3] forState:UIControlStateNormal];
                
                [_bt1p2 setTitle:[NSString stringWithFormat:@"%d",choix2] forState:UIControlStateNormal];
                [_bt2p2 setTitle:[NSString stringWithFormat:@"%d",choix1] forState:UIControlStateNormal];
                [_bt3p2 setTitle:[NSString stringWithFormat:@"%d",solution] forState:UIControlStateNormal];
                [_bt4p2 setTitle:[NSString stringWithFormat:@"%d",choix3] forState:UIControlStateNormal];
                
            }
            if (ii == 3)
            {
                [_bt1p1 setTitle:[NSString stringWithFormat:@"%d",choix3] forState:UIControlStateNormal];
                [_bt2p1 setTitle:[NSString stringWithFormat:@"%d",choix1] forState:UIControlStateNormal];
                [_bt3p1 setTitle:[NSString stringWithFormat:@"%d",choix2] forState:UIControlStateNormal];
                [_bt4p1 setTitle:[NSString stringWithFormat:@"%d",solution] forState:UIControlStateNormal];
                
                [_bt1p2 setTitle:[NSString stringWithFormat:@"%d",choix3] forState:UIControlStateNormal];
                [_bt2p2 setTitle:[NSString stringWithFormat:@"%d",choix1] forState:UIControlStateNormal];
                [_bt3p2 setTitle:[NSString stringWithFormat:@"%d",choix2] forState:UIControlStateNormal];
                [_bt4p2 setTitle:[NSString stringWithFormat:@"%d",solution] forState:UIControlStateNormal];
                
                
            }
            
            if ([opop  isEqual: @"quadra"])
            {
                int delta = 0;
                int a, b, c = 0, entier1, entier2;
                a = (arc4random()%4) + 1;
                entier1 = (arc4random()%2);
                entier2 = (arc4random()%2) + 2;
                b = -(entier1 + entier2) * a;
                delta = ((entier2 - entier1) * a);
                delta = delta * delta;
                c = ((b * b) - delta) / (4 * a);
                
                if (b < 0)
                {
                    _TFquestion1.text =[NSString stringWithFormat:@"%d x² %d x",a,b];
                    _TFquestion2.text = [NSString stringWithFormat:@"%d x² %d x",a,b];
                }
                else
                {
                    _TFquestion1.text = [NSString stringWithFormat:@"%d x² + %d x",a,b];
                    _TFquestion2.text = [NSString stringWithFormat:@"%d x² + %d x",a,b];
                }
                if (c < 0)
                {
                    _TFquestion1.text =[NSString stringWithFormat:@"%@ %d = 0",_TFquestion1.text,c];
                    _TFquestion2.text =[NSString stringWithFormat:@"%@ %d = 0",_TFquestion2.text,c];
                    
                }
                else
                {
                    
                    _TFquestion1.text =[NSString stringWithFormat:@"%@ + %d = 0",_TFquestion1.text,c];
                    _TFquestion2.text =[NSString stringWithFormat:@"%@ + %d = 0",_TFquestion2.text,c];
                    
                }
                
                NSString* solutionCh =[NSString stringWithFormat:@"x = [%d , %d]",entier1,entier2];
                NSString* choixx1 =[NSString stringWithFormat:@"x = [%d , %d]",entier1+1,entier2];
                NSString* choixx2 = [NSString stringWithFormat:@"x = [%d , %d]",entier1,entier2+2];
                NSString* choixx3 = [NSString stringWithFormat:@"x = [%d , %d]",entier1+2,entier2+1];
                if (ii == 0)
                {
                    [_bt1p1 setTitle:[NSString stringWithFormat:@"%@",solutionCh] forState:UIControlStateNormal];
                    [_bt2p1 setTitle:[NSString stringWithFormat:@"%@",choixx1] forState:UIControlStateNormal];
                    [_bt3p1 setTitle:[NSString stringWithFormat:@"%@",choixx2] forState:UIControlStateNormal];
                    [_bt4p1 setTitle:[NSString stringWithFormat:@"%@",choixx3] forState:UIControlStateNormal];
                    
                    [_bt1p2 setTitle:[NSString stringWithFormat:@"%@",solutionCh] forState:UIControlStateNormal];
                    [_bt2p2 setTitle:[NSString stringWithFormat:@"%@",choixx1] forState:UIControlStateNormal];
                    [_bt3p2 setTitle:[NSString stringWithFormat:@"%@",choixx2] forState:UIControlStateNormal];
                    [_bt4p2 setTitle:[NSString stringWithFormat:@"%@",choixx3] forState:UIControlStateNormal];
                    
                }
                if (ii == 1)
                {
                    [_bt1p1 setTitle:[NSString stringWithFormat:@"%@",choixx1] forState:UIControlStateNormal];
                    [_bt2p1 setTitle:[NSString stringWithFormat:@"%@",solutionCh] forState:UIControlStateNormal];
                    [_bt3p1 setTitle:[NSString stringWithFormat:@"%@",choixx2] forState:UIControlStateNormal];
                    [_bt4p1 setTitle:[NSString stringWithFormat:@"%@",choixx3] forState:UIControlStateNormal];
                    
                    [_bt1p2 setTitle:[NSString stringWithFormat:@"%@",choixx1] forState:UIControlStateNormal];
                    [_bt2p2 setTitle:[NSString stringWithFormat:@"%@",solutionCh] forState:UIControlStateNormal];
                    [_bt3p2 setTitle:[NSString stringWithFormat:@"%@",choixx2] forState:UIControlStateNormal];
                    [_bt4p2 setTitle:[NSString stringWithFormat:@"%@",choixx3] forState:UIControlStateNormal];
                    
                }
                if (ii == 2)
                {
                    [_bt1p1 setTitle:[NSString stringWithFormat:@"%@",choixx2] forState:UIControlStateNormal];
                    [_bt2p1 setTitle:[NSString stringWithFormat:@"%@",choixx1] forState:UIControlStateNormal];
                    [_bt3p1 setTitle:[NSString stringWithFormat:@"%@",solutionCh] forState:UIControlStateNormal];
                    [_bt4p1 setTitle:[NSString stringWithFormat:@"%@",choixx3] forState:UIControlStateNormal];
                    
                    [_bt1p2 setTitle:[NSString stringWithFormat:@"%@",choixx2] forState:UIControlStateNormal];
                    [_bt2p2 setTitle:[NSString stringWithFormat:@"%@",choixx1] forState:UIControlStateNormal];
                    [_bt3p2 setTitle:[NSString stringWithFormat:@"%@",solutionCh] forState:UIControlStateNormal];
                    [_bt4p2 setTitle:[NSString stringWithFormat:@"%@",choixx3] forState:UIControlStateNormal];
                    
                }
                if (ii == 3)
                {
                    [_bt1p1 setTitle:[NSString stringWithFormat:@"%@",choixx3] forState:UIControlStateNormal];
                    [_bt2p1 setTitle:[NSString stringWithFormat:@"%@",choixx1] forState:UIControlStateNormal];
                    [_bt3p1 setTitle:[NSString stringWithFormat:@"%@",choixx2] forState:UIControlStateNormal];
                    [_bt4p1 setTitle:[NSString stringWithFormat:@"%@",solutionCh] forState:UIControlStateNormal];
                    
                    [_bt1p2 setTitle:[NSString stringWithFormat:@"%@",choixx3] forState:UIControlStateNormal];
                    [_bt2p2 setTitle:[NSString stringWithFormat:@"%@",choixx1] forState:UIControlStateNormal];
                    [_bt3p2 setTitle:[NSString stringWithFormat:@"%@",choixx2] forState:UIControlStateNormal];
                    [_bt4p2 setTitle:[NSString stringWithFormat:@"%@",solutionCh] forState:UIControlStateNormal];
                    
                    
                }
            }
        }
        
        
    }
    else
    {
        if (player == 1)
        {
            score1--;
            _TFScore1.text = [NSString stringWithFormat:@"score = %d",score1];
        }
        else
        {
            score2--;
            _TFScore2.text = [NSString stringWithFormat:@"score = %d",score2];
        }
    }
    
}
@end
