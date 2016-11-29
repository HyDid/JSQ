//
//  ViewController.m
//  JSQ
//
//  Created by LiHongYu on 2016/11/10.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (strong, nonatomic) UILabel *wenbenkuang;
@property (nonatomic,copy)NSMutableArray *customArray;
@property (nonatomic ,assign)float a;
@property (nonatomic ,assign)float b;
@property (nonatomic ,assign)int c;
@property (nonatomic ,copy)NSString *customStr;
@end

@implementation ViewController

//懒加载可变数组
-(NSMutableArray *)customArray{
    if (_customArray == nil) {
        _customArray = [NSMutableArray array];
    }
    return _customArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UILabel *lab = [[UILabel alloc]init];
    
    lab.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wen"]];
    lab.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-160, 130, 320, 50);
    [lab setTextAlignment:NSTextAlignmentRight];
    self.wenbenkuang = lab;
    [self.view addSubview:lab];
    
    
    NSArray *nameArray = @[@"7",@"8",@"9",@"+",@"4",@"5",@"6",@"-",@"1",@"2",@"3",@"*",@".",@"0",@"=",@"/",@"清零"];
    for (int i = 0; i < 17; i++) {
        UIButton *button = [[UIButton alloc]init];
        [button setBackgroundImage:[UIImage imageNamed:@"buttonback"] forState:UIControlStateNormal];
        [button setTitle:nameArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2+80*((i%4)-2), 200 + 250*(i/4)/4, 80, 50);
        [button addTarget:self action:@selector(BtnOnclick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        [self.view addSubview:button];
    }
    
}

-(void)BtnOnclick:(UIButton *)btn{

    switch (btn.tag) {
        case 0:
            [self.customArray addObject:@"7"];
            [self labelRefrash];
            break;
        case 1:
            [self.customArray addObject:@"8"];
            [self labelRefrash];
            break;
        case 2:
            [self.customArray addObject:@"9"];
            [self labelRefrash];
            break;
        case 3:
            self.c = 1;
            [self.customArray addObject:@"+"];
            [self labelRefrash];
            break;
        case 4:
            [self.customArray addObject:@"4"];
            [self labelRefrash];
            break;
        case 5:
            [self.customArray addObject:@"5"];
            [self labelRefrash];
            break;
        case 6:
            [self.customArray addObject:@"6"];
            [self labelRefrash];
            break;
        case 7:
            self.c = 2;
            [self.customArray addObject:@"-"];
            [self labelRefrash];
            break;
        case 8:
            [self.customArray addObject:@"1"];
            [self labelRefrash];
            break;
        case 9:
            [self.customArray addObject:@"2"];
            [self labelRefrash];
            break;
        case 10:
            [self.customArray addObject:@"3"];
            [self labelRefrash];
            break;
        case 11:
            self.c = 3;
            [self.customArray addObject:@"*"];
            [self labelRefrash];
            break;
        case 12:
            [self.customArray addObject:@"."];
            [self labelRefrash];
            break;
        case 13:
            [self.customArray addObject:@"0"];
            [self labelRefrash];
            break;
        case 14:
            [self dengyuAction];
            break;
        case 15:
            self.c = 4;
            [self.customArray addObject:@"/"];
            [self labelRefrash];
            break;
        case 16:
            [self.customArray removeAllObjects];
            [self labelRefrash];
            break;
            
        default:
            break;
    }
}



-(void)dengyuAction{
    
    
    
    NSArray *listItems = [[NSArray alloc]init];
    
    switch (self.c) {
        case 1:
            listItems = [self.customStr componentsSeparatedByString:@"+"];
            break;
        case 2:
            listItems = [self.customStr componentsSeparatedByString:@"-"];
            break;
        case 3:
            listItems = [self.customStr componentsSeparatedByString:@"*"];
            break;
        case 4:
            listItems = [self.customStr componentsSeparatedByString:@"/"];
            break;
            
        default:
            break;
    }
    
    [self qingkongAction];
//    float y = 0;
//    for (int i = 0; i<listItems.count; i++) {
//         float k =[listItems[i] floatValue];
//         y = y+k;
//    }
//    NSLog(@"%f",y);
    
    self.a = [listItems.firstObject floatValue];
    self.b = [listItems.lastObject floatValue];
    
    float k;
    if (self.c == 1) {
        k = self.a + self.b;
    }else if (self.c == 2){
        k = self.a - self.b;
    }else if (self.c == 3){
        k = self.a * self.b;
    }else if (self.c == 4){
        k = self.a / self.b;
    }
    self.wenbenkuang.text = [NSString stringWithFormat:@"%.5f", k];
    
}

//清空按钮
-(void)qingkongAction{
    [self.customArray removeAllObjects];
    [self labelRefrash];
}

//刷新lable
-(void)labelRefrash{
    self.customStr = [self.customArray componentsJoinedByString:@""];
    self.wenbenkuang.text = self.customStr;
}

@end
