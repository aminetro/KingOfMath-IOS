//
//  MapViewControler.m
//  timer
//
//  Created by ESPRIT on 02/01/2016.
//  Copyright © 2016 qwerty. All rights reserved.
//

#import "MapViewControler.h"

@implementation MapViewControler
int indexs=0;
int lvlreached=1;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [(UIButton *)[_tabmap viewWithTag:1] setImage:[UIImage imageNamed:@"levellevel1.png"] forState:UIControlStateNormal ];
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tabmap reloadData];
    });
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    
    [(UIButton *)[_tabmap viewWithTag:1] setImage:[UIImage imageNamed:@"levellevel1.png"] forState:UIControlStateNormal ];
    
    NSInteger result1=0;
    _DB=[[DBManager alloc]initWithDatabaseFilename:@"KingsOfMath"];
    
    
    
    
    NSArray* myarray;
    
    NSString* requete2=@"select score from Scores where (type = 'addition')";
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    
    NSInteger indicescore=[_DB.arrColumnNames indexOfObject:@"score"];
    
    for (int iiii=1; iiii<11; iiii++) {
        
        result1=[[[myarray objectAtIndex:iiii-1]objectAtIndex:indicescore] integerValue];
        if(result1 != 0){
            indexs=iiii+1;
            [(UIButton *)[_tabmap viewWithTag:iiii+1] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"levellevel%d.png",iiii+1]] forState:UIControlStateNormal ];
            lvlreached=iiii+1;
        }
    }
    
    requete2=@"select score from Scores where (type = 'soustraction')";
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    for (int iiii=1; iiii<11; iiii++) {
        
        result1=[[[myarray objectAtIndex:iiii-1]objectAtIndex:indicescore] integerValue];
        if(result1 != 0){
            lvlreached=iiii+1;
            indexs=iiii+11;
            [(UIButton *)[_tabmap viewWithTag:iiii+11] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"levellevel%d.png",iiii+11]] forState:UIControlStateNormal ];
        }
    }
    
    requete2=@"select score from Scores where (type = 'multiplication')";
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    for (int iiii=1; iiii<11; iiii++) {
        
        result1=[[[myarray objectAtIndex:iiii-1]objectAtIndex:indicescore] integerValue];
        if(result1 != 0){
            
            lvlreached=iiii+1;
            indexs=iiii+21;
            [(UIButton *)[_tabmap viewWithTag:iiii+21] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"levellevel%d.png",iiii+21]] forState:UIControlStateNormal ];
        }
    }
    
    requete2=@"select score from Scores where (type = 'division')";
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    for (int iiii=1; iiii<8; iiii++) {
        
        result1=[[[myarray objectAtIndex:iiii-1]objectAtIndex:indicescore] integerValue];
        if(result1 != 0){
            lvlreached=iiii+1;
            indexs=iiii+31;
            [(UIButton *)[_tabmap viewWithTag:iiii+31] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"levellevel%d.png",iiii+31]] forState:UIControlStateNormal ];
        }
    }
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tabmap reloadData];
    });
    
    [self performSelectorOnMainThread:@selector(updateTable) withObject:nil waitUntilDone:NO];
}

-(void) updateTable
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tabmap reloadData];
    });
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger indicescore=0;
    UITableViewCell *cell ;
    if (indexPath.row==0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1"];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tabmap reloadData];
        });
    }if (indexPath.row==1) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2"];
        NSString* requete2=@"select score from Scores where (type = 'soustraction')";
        NSArray* myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
        
        indicescore=[_DB.arrColumnNames indexOfObject:@"score"];
        for (int iiii=1; iiii<11; iiii++) {
            
            NSInteger result1=[[[myarray objectAtIndex:iiii-1]objectAtIndex:indicescore] integerValue];
            if(result1 != 0){
                indexs=iiii+11;
                [(UIButton *)[_tabmap viewWithTag:iiii+11] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"levellevel%d.png",iiii+11]] forState:UIControlStateNormal ];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tabmap reloadData];
        });
    }if (indexPath.row==2) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell3"];
        NSString* requete2=@"select score from Scores where (type = 'multiplication')";
        NSArray* myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
        for (int iiii=1; iiii<11; iiii++) {
            
            NSInteger result1=[[[myarray objectAtIndex:iiii-1]objectAtIndex:indicescore] integerValue];
            if(result1 != 0){
                
                indexs=iiii+21;
                [(UIButton *)[_tabmap viewWithTag:iiii+21] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"levellevel%d.png",iiii+21]] forState:UIControlStateNormal ];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tabmap reloadData];
        });
    }if (indexPath.row==3) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell4"];
        
        NSString* requete2=@"select score from Scores where (type = 'division')";
        NSArray* myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
        for (int iiii=1; iiii<9; iiii++) {
            
            NSInteger result1=[[[myarray objectAtIndex:iiii-1]objectAtIndex:indicescore] integerValue];
            if(result1 != 0){
                indexs=iiii+31;
                [(UIButton *)[_tabmap viewWithTag:iiii+31] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"levellevel%d.png",iiii+31]] forState:UIControlStateNormal ];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tabmap reloadData];
        });
    }
    
    
    
    //cell.textLabel.text =[NSString stringWithFormat:@"name:%@       score:%d",playername,value];
    return cell;
}




- (IBAction)ChoosingLevel:(id)sender {
    NSLog(@"%d",lvlreached);
    
    if (lvlreached>=[sender tag]) {
        
        int screenHeight = [UIScreen mainScreen].bounds.size.height;
        UIStoryboard *storyboard;
        
        switch (screenHeight) {
                
                // iPhone 4s
            case 480:
                storyboard = [UIStoryboard storyboardWithName:@"Main-4s" bundle:nil];NSLog(@"4S");
                break;
                
                // iPhone 5s
            case 568:
                storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];NSLog(@"5S");
                break;
                
                // iPhone 6
            case 667:
                storyboard = [UIStoryboard storyboardWithName:@"Main-6" bundle:nil];NSLog(@"6S");
                break;
                
                // iPhone 6 Plus
            case 736:
                storyboard = [UIStoryboard storyboardWithName:@"Main-6-plus" bundle:nil];NSLog(@"6S+");
                break;
                
                
            default:
                // it's an iPad
                storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];NSLog(@"default");
                break;
        }

    
    ViewController5 *sv = [storyboard instantiateViewControllerWithIdentifier:@"ViewController5"];
    
    
    if ([sender tag]==1) {
        _lvl =@"1";
        _type =@"1";
    }
    if ([sender tag]==2) {
        _lvl =@"2";
        _type =@"1";
    }
    if ([sender tag]==3) {
        _lvl =@"3";
        _type =@"1";
    }
    if ([sender tag]==4) {
        _lvl =@"4";
        _type =@"1";
    }
    if ([sender tag]==5) {
        _lvl =@"5";
        _type =@"1";
    }
    if ([sender tag]==6) {
        _lvl =@"6";
        _type =@"1";
    }
    if ([sender tag]==7) {
        _lvl =@"7";
        _type =@"1";
    }
    if ([sender tag]==8) {
        _lvl =@"8";
        _type =@"1";
    }
    if ([sender tag]==9) {
        _lvl =@"9";
        _type =@"1";
    }
    if ([sender tag]==10) {
        _lvl =@"10";
        _type =@"1";
    }
    
    
    
    if ([sender tag]==11) {
        _lvl =@"1";
        _type =@"2";
    }
    if ([sender tag]==12) {
        _lvl =@"2";
        _type =@"2";
    }
    if ([sender tag]==13) {
        _lvl =@"3";
        _type =@"2";
    }
    if ([sender tag]==14) {
        _lvl =@"4";
        _type =@"2";
    }
    if ([sender tag]==15) {
        _lvl =@"5";
        _type =@"2";
    }
    if ([sender tag]==16) {
        _lvl =@"6";
        _type =@"2";
    }
    if ([sender tag]==17) {
        _lvl =@"7";
        _type =@"2";
    }
    if ([sender tag]==18) {
        _lvl =@"8";
        _type =@"2";
    }
    if ([sender tag]==19) {
        _lvl =@"9";
        _type =@"2";
    }
    if ([sender tag]==20) {
        _lvl =@"10";
        _type =@"2";
    }
    
    
    
    
    if ([sender tag]==11) {
        _lvl =@"1";
        _type =@"2";
    }
    if ([sender tag]==12) {
        _lvl =@"2";
        _type =@"2";
    }
    if ([sender tag]==13) {
        _lvl =@"3";
        _type =@"2";
    }
    if ([sender tag]==14) {
        _lvl =@"4";
        _type =@"2";
    }
    if ([sender tag]==15) {
        _lvl =@"5";
        _type =@"2";
    }
    if ([sender tag]==16) {
        _lvl =@"6";
        _type =@"2";
    }
    if ([sender tag]==17) {
        _lvl =@"7";
        _type =@"2";
    }
    if ([sender tag]==18) {
        _lvl =@"8";
        _type =@"2";
    }
    if ([sender tag]==19) {
        _lvl =@"9";
        _type =@"2";
    }
    if ([sender tag]==20) {
        _lvl =@"10";
        _type =@"2";
    }
    
    
    
    
    
    
    if ([sender tag]==21) {
        _lvl =@"1";
        _type =@"3";
    }
    if ([sender tag]==22) {
        _lvl =@"2";
        _type =@"3";
    }
    if ([sender tag]==23) {
        _lvl =@"3";
        _type =@"3";
    }
    if ([sender tag]==24) {
        _lvl =@"4";
        _type =@"3";
    }
    if ([sender tag]==25) {
        _lvl =@"5";
        _type =@"3";
    }
    if ([sender tag]==26) {
        _lvl =@"6";
        _type =@"3";
    }
    if ([sender tag]==27) {
        _lvl =@"7";
        _type =@"3";
    }
    if ([sender tag]==28) {
        _lvl =@"8";
        _type =@"3";
    }
    if ([sender tag]==29) {
        _lvl =@"9";
        _type =@"3";
    }
    if ([sender tag]==30) {
        _lvl =@"10";
        _type =@"3";
    }
    
    
    
    
    
    if ([sender tag]==31) {
        _lvl =@"1";
        _type =@"4";
    }
    if ([sender tag]==32) {
        _lvl =@"2";
        _type =@"4";
    }
    if ([sender tag]==33) {
        _lvl =@"3";
        _type =@"4";
    }
    if ([sender tag]==34) {
        _lvl =@"4";
        _type =@"4";
    }
    if ([sender tag]==35) {
        _lvl =@"5";
        _type =@"4";
    }
    if ([sender tag]==36) {
        _lvl =@"6";
        _type =@"4";
    }
    if ([sender tag]==37) {
        _lvl =@"7";
        _type =@"4";
    }
    if ([sender tag]==38) {
        _lvl =@"8";
        _type =@"4";
    }
    
    
    sv.a=_type;
    sv.b=_lvl;
    
    
    [self.navigationController pushViewController:sv animated:NO];
        
    }
}
@end
