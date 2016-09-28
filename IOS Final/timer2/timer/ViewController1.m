//
//  ViewController1.m
//  timer
//
//  Created by yosemite on 11/11/15.
//  Copyright © 2015 qwerty. All rights reserved.
//

#import "ViewController1.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
@interface ViewController1 ()

@end

@implementation ViewController1


- (void)viewDidLoad {
    [super viewDidLoad];
    _nom.text=[[NSUserDefaults standardUserDefaults] objectForKey:@"UserNames"];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"songs" ofType:@"mp3"];
    _theAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path]error:NULL];
    _theAudio.delegate = self;
    if([[[NSUserDefaults standardUserDefaults] objectForKey:@"Audio"] isEqual:@"on"]){
        [_theAudio play];
    }else
    //[[self navigationController] setNavigationBarHidden:YES animated:YES];
    self.navigationItem.hidesBackButton=YES;
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    ViewController2 * v=[segue destinationViewController];
    [_theAudio stop];
    
    [[NSUserDefaults standardUserDefaults] setObject: _nom.text forKey:@"UserNames"];
    v.x=_nom.text;

}
- (void)viewDidAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //[self performSelector:@selector(setStyleCircleForImage:) withObject:_imageView afterDelay:0];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getFacebookData) name:@"getFacebookData" object:nil];
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.readPermissions =
    @[@"public_profile", @"email", @"user_friends"];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
    
    //FBSDKProfilePictureView *profilePictureview = [[FBSDKProfilePictureView alloc]initWithFrame:_imageView.frame];
    //[[profilePictureview setProfileID:result[@"id"]];
    
    //[self.view addSubview:profilePictureview];
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"picture, email,first_name,last_name"}] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id res, NSError *error)
     {
         if (!error) {
             NSString *pictureURL = [NSString stringWithFormat:@"%@",[res objectForKey:@"picture"]];
             
             NSLog(@"the EMail = %@", [res objectForKey:@"email"]);
             
             _nom.text =[NSString stringWithFormat:@"%@ %@",[res objectForKey:@"first_name"],[res objectForKey:@"last_name"]];
             NSData  *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:pictureURL]];
             
            // _imageView.image = [UIImage imageWithData:data];
         }
         else
         {
             NSLog(@"%@", [error localizedDescription]);
         }}];
}

- (IBAction)facebooks:(id)sender {
    //[self performSelector:@selector(setStyleCircleForImage:) withObject:_imageView afterDelay:0];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getFacebookData) name:@"getFacebookData" object:nil];
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.readPermissions =
    @[@"public_profile", @"email", @"user_friends"];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
    
    //FBSDKProfilePictureView *profilePictureview = [[FBSDKProfilePictureView alloc]initWithFrame:_imageView.frame];
    //[[profilePictureview setProfileID:result[@"id"]];
    
    //[self.view addSubview:profilePictureview];
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"picture, email,first_name,last_name"}] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id res, NSError *error)
     {
         if (!error) {
             NSString *pictureURL = [NSString stringWithFormat:@"%@",[res objectForKey:@"picture"]];
             
             NSLog(@"the EMail = %@", [res objectForKey:@"email"]);
             
             _nom.text =[NSString stringWithFormat:@"%@ %@",[res objectForKey:@"first_name"],[res objectForKey:@"last_name"]];
             NSData  *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:pictureURL]];
             
         //_imageView.image = [UIImage imageWithData:data];
         }
         else
         {
             NSLog(@"%@", [error localizedDescription]);
         }}];

}

- (void)getFacebookData{
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"first_name, last_name, picture.type(large), email, name, id, gender"}]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             
             if (!error) {
                 NSLog(@"fetched user:%@", result);
             }
         }];
    }
}
@end
