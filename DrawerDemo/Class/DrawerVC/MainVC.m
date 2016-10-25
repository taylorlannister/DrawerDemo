//
//  MainVC.m
//  DrawerDemo
//
//  Created by 刘志康 on 16/10/20.
//  Copyright © 2016年 刘志康. All rights reserved.
//

#import "MainVC.h"
#import "DrawerVC.h"
#import <PPRevealSideViewController.h>
@interface MainVC ()

@property (nonatomic, strong)PPRevealSideViewController *revealSlideViewController;

@property (strong ,nonatomic) UINavigationController * nsearch_controller;


@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationItem.title = @"主页面";
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [btn setTitle:@"侧滑" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}

- (void)btnAction{
    DrawerVC *leftTableView = [[DrawerVC alloc] init];
    UINavigationController *leftNavVC = [[UINavigationController alloc]initWithRootViewController:leftTableView];
    [self.revealSideViewController pushViewController:leftNavVC onDirection:PPRevealSideDirectionLeft withOffset:self.view.frame.size.width/2 animated:YES];
}

- (void) preloadView {
    
    
    
    
}


- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(preloadView) object:nil];
    [self performSelector:@selector(preloadView) withObject:nil afterDelay:0.3];
}

@end
