//
//  SecondViewController.m
//  timer
//
//  Created by ESPRIT on 19/11/2015.
//  Copyright © 2015 qwerty. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController1.h"
@interface SecondViewController ()

@end

int firstview=1;
@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [[NSUserDefaults standardUserDefaults] setObject: @"Player" forKey:@"UserNames"];
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"name"] = @"Player";
    testObject[@"score"] = [NSNumber numberWithInt:(0)];
    
    [[NSUserDefaults standardUserDefaults] setObject: @"on" forKey:@"Audio"];
    
    [testObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSString * dataId=testObject.objectId;NSLog(@"%@",dataId);
            
            [[NSUserDefaults standardUserDefaults] setObject: dataId forKey:@"DataId"];
        } else {
            // There was a problem, check error.description
        }
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


- (IBAction)next2:(id)sender {
    
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

    
    
    
    
    ViewController1 *sv = [storyboard instantiateViewControllerWithIdentifier:@"SNFViewController"];
    [self.navigationController pushViewController:sv animated:NO];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:firstview] forKey:@"FirstUser"];
    
}
@end
