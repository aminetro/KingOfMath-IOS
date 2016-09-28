//
//  ViewController2.m
//  timer
//
//  Created by yosemite on 11/11/15.
//  Copyright © 2015 qwerty. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2
NSString * sounds=@"";
AVAudioPlayer* theAudio;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"songs" ofType:@"mp3"];
    theAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path]error:NULL];
    theAudio.delegate = self;
    sounds = [[NSUserDefaults standardUserDefaults] objectForKey:@"Audio"] ;
    NSLog(@"%@",sounds);
    if([sounds isEqual:@"on"]){
        [theAudio play];
    }else{
        
        [self.BTsong setBackgroundImage:[UIImage imageNamed:@"Soff.png"] forState:UIControlStateNormal];
    }
   _DB=[[DBManager alloc]initWithDatabaseFilename:@"KingsOfMath"];
    _noms.text=_x;
    NSString* requete2=[NSString stringWithFormat:@"select sum (score) from Scores"];
    NSArray* myarray;
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    NSString* Bscore=[[myarray objectAtIndex:0]objectAtIndex:0];
    NSLog(@"%@",Bscore);
    
    _score.text=Bscore;
    
    
    
    
    //firstUser = [[[NSUserDefaults standardUserDefaults] objectForKey:@"FirstUser"] intValue];
    NSString * dataId = [[NSUserDefaults standardUserDefaults] objectForKey:@"DataId"] ;
    
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.kingofmath.TodayExtensionSharingDefaults"];
    
    [sharedDefaults setObject:dataId forKey:@"MyNumberKey"];
    [sharedDefaults synchronize];
    
    PFQuery *query = [PFQuery queryWithClassName:@"TestObject"];
    NSLog(@"%@",dataId);
    // Retrieve the object by id
    [query getObjectInBackgroundWithId:dataId
                                 block:^(PFObject *gameScore, NSError *error) {
                                     // Now let's update it with some new data. In this case, only cheatMode and score
                                     // will get sent to the cloud. playerName hasn't changed.
                                     gameScore[@"name"] = _x;
                                     gameScore[@"score"] = [NSNumber numberWithInt:([Bscore intValue])];
                                     [gameScore saveInBackground];
                                 }];
    
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    _DB=[[DBManager alloc]initWithDatabaseFilename:@"KingsOfMath"];
    _noms.text=_x;
    NSString* requete2=[NSString stringWithFormat:@"select sum (score) from Scores"];
    NSArray* myarray;
    myarray=[[NSArray alloc]initWithArray:[_DB loadDataFromDB:requete2]];
    NSString* Bscore=[[myarray objectAtIndex:0]objectAtIndex:0];
    NSLog(@"%@",Bscore);
    
    _score.text=Bscore;
    
    
    
    NSString * dataId = [[NSUserDefaults standardUserDefaults] objectForKey:@"DataId"] ;
    PFQuery *query = [PFQuery queryWithClassName:@"TestObject"];
    
    // Retrieve the object by id
    [query getObjectInBackgroundWithId:dataId
                                 block:^(PFObject *gameScore, NSError *error) {
                                     // Now let's update it with some new data. In this case, only cheatMode and score
                                     // will get sent to the cloud. playerName hasn't changed.
                                     gameScore[@"name"] = _x;
                                     gameScore[@"score"] = [NSNumber numberWithInt:([Bscore intValue])];
                                     [gameScore saveInBackground];
                                 }];
    
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

- (IBAction)Sounds:(id)sender {
    NSLog(@"OUSSEMA1");
    
    
    sounds = [[NSUserDefaults standardUserDefaults] objectForKey:@"Audio"] ;
    NSLog(@"OUSSEMA2 %@",sounds);
    if([sounds isEqual:@"on"]){
        [self.BTsong setBackgroundImage:[UIImage imageNamed:@"Soff.png"] forState:UIControlStateNormal];
        [[NSUserDefaults standardUserDefaults] setObject: @"off" forKey:@"Audio"];
        [theAudio stop];
        
        
        
    }else{
        
        [[NSUserDefaults standardUserDefaults] setObject: @"on" forKey:@"Audio"];
        [self.BTsong setBackgroundImage:[UIImage imageNamed:@"Son.png"] forState:UIControlStateNormal];
        [theAudio play];
        
    }
}
- (IBAction)Facebook:(id)sender {
    composer = [[ SLComposeViewController alloc] init];
    composer = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [composer setInitialText:[NSString stringWithFormat:@"My score in KingOfMath =%@",self.score.text]];
    [composer addImage:[UIImage imageNamed:@"logo1.png"]];
    [self presentViewController:composer animated:YES completion:NULL];
}

- (IBAction)twitter:(id)sender {
    composer = [[ SLComposeViewController alloc] init];
    composer = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [composer setInitialText:[NSString stringWithFormat:@"My score in KingOfMath =%@",self.score.text]];
    [composer addImage:[UIImage imageNamed:@"logo1.png"]];
    [self presentViewController:composer animated:YES completion:NULL];
}
@end
