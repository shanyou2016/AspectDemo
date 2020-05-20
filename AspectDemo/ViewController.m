//
//  ViewController.m
//  AspectDemo
//
//  Created by ug on 2020/5/19.
//  Copyright © 2020 yy. All rights reserved.
//

#import "ViewController.h"
#import <SafariServices/SafariServices.h>
#import "UGSkinViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)test:(id)sender {
    SFSafariViewController *sf = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"http://www.hao123.com"]];

    [self.navigationController presentViewController:sf animated:YES completion:nil];
}

- (IBAction)test2:(id)sender {
    UGSkinViewController *vc = [[UGSkinViewController alloc] init];
     [self.navigationController pushViewController:vc animated:YES ];
}

@end
