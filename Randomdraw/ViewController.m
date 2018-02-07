//
//  ViewController.m
//  Randomdraw
//
//  Created by 毛蛋 on 2018/2/7.
//  Copyright © 2018年 zhb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UILabel *label;
    NSTimer *timer;
    NSMutableArray *nameList;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.view.backgroundColor=[UIColor whiteColor];
    label = [[UILabel alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 60)];
    label.text = @"七夕送什么礼物";
    [self.view addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:50];
    label.textColor = [UIColor orangeColor];
    label.backgroundColor = [UIColor clearColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake((self.view.frame.size.width-100)/2, 500, 100, 40);
    [self.view addSubview:button];
    [button setTitle:@"开始选" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.showsTouchWhenHighlighted = YES;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.001
                                             target:self
                                           selector:@selector(loadData)
                                           userInfo:nil
                                            repeats:YES];
    [[NSRunLoop currentRunLoop ]addTimer:timer
                                 forMode:NSDefaultRunLoopMode];
    timer.fireDate = [NSDate distantFuture];
    
}

- (void)loadData

{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    nameList = [NSMutableArray arrayWithObjects:
                @"包包",@"nike",@"阿迪达斯",@"衣服",@"化妆品",
                @"香水",@"补水霜",@"香薰",@"绣眉笔",@"项链",
                @"手表",@"手环",@"项链",@"手镯",@"戒指",
                @"爱疯7普拉斯",@"macPro",@"MK",@"路易威登",
                @"车",@"房",@"啥都不要",@"1000块",@"100块",
                @"大吃一顿",@"出去玩一趟",@"鲜花",@"ipad",
                @"游戏机",@"挂件",@"装饰品",@"背包",@"单肩包",
                @"裙子",@"帽子",@"扎花",@"拖鞋",@"睡衣",
                @"美食",@"小摩托",@"自行车",@"滑板车", nil];
    
    [userDefaults setObject:nameList forKey:@"nameList"];
    [userDefaults synchronize];
    [userDefaults objectForKey:@"nameList"];
    int arcNumber = arc4random()%nameList.count;
    label.text = nameList[arcNumber];
    label.textColor= [UIColor redColor];
    
}

- (void)push:(UIButton *)sender{
    if (sender.selected !=YES ) {
        label.textColor = [UIColor clearColor];
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
        timer.fireDate = [NSDate distantPast];
        sender.selected = YES;
    }else{
        timer.fireDate = [NSDate distantFuture];
        label.textColor = [UIColor blackColor];
        [sender setTitle:@"开始选" forState:UIControlStateNormal];
        sender.selected = NO;
    }
}
- (void)showAlertMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"真的是你" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
