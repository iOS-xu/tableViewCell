//
//  ViewController.m
//  HXTableView
//
//  Created by MJRB on 2017/11/8.
//  Copyright © 2017年 szsxrkj. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "MainTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray * dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setupUI];
   
}

//懒加载
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        
    }
    return _dataArray;
}



//搭建UI
-(void)setupUI{
    
   //tableView
    UITableView  * MainTableView = [[UITableView alloc] init];
    MainTableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:MainTableView];
    [MainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    MainTableView.delegate = self;
    MainTableView.dataSource = self;
    [MainTableView registerClass:[MainTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    //自适应高度
    MainTableView.estimatedRowHeight = 200;
    MainTableView.rowHeight = UITableViewAutomaticDimension;
    
  
    
    [self.dataArray addObject:@{@"content":@"Q: 通过红人装进淘宝、天猫、京东购物支付以后佣金需要多久才能显示在【预期收益】里？", @"answer":@"A: 因为在红人装的每一笔支付都需要阿里与红人装同时审核，所以在淘宝、天猫购物24小时内显示，京东48显示内显示。",@"isChoice":@"NO"}];
    
    [self.dataArray addObject:@{@"content":@"Q: 通过红人装进淘宝、天猫、京东购物支付以后佣金需要多久才能显示在【预期收益】里？",@"answer":@"A: 因为在红人装的每一笔支付都需要阿里与红人装同时审核，所以在淘宝、天猫购物24小时内显示，京东48显示内显示。如果超过时间以后也没有显示出来，就把淘宝的订单号",@"isChoice":@"NO"}];
    
    [self.dataArray addObject:@{@"content":@"Q: 通过红人装进淘宝、天猫、京东购物支付以后佣金需要多久才能显示在【预期收益】里？",@"answer":@"A: 因为在红人装的每一笔支付都需要阿里与红人装同时审核，所以在淘宝、天猫购物24小时内显示，京东48显示内显示。如果超过时间以后也没有显示出来，就把淘宝的订单号复制到红人装【我的】-【已购】【订单申述】里提交，然后公司人工处理。",@"isChoice":@"NO"}];
    
    [self.dataArray addObject:@{@"content":@"Q: 通过红人装进淘宝、天猫、京东购物支付以后佣金需要多久才能显示在【预期收益】里？",@"answer":@"A: 因为在红人装的每一笔支付都需要阿里与红人装同时审核，所以在淘宝、天猫购物24小时内显示，京东48显示内显示。如果超过时间以后也没有显示出来，就把淘宝的订单号复制到红人装【我的】-【已购】【订单申述】里提交，然后公司人工处理。",@"isChoice":@"NO"}];
    
    [self.dataArray addObject:@{@"content":@"Q: 通过红人装进淘宝、天猫、京东购物支付以后佣金需要多久才能显示在【预期收益】里？",@"answer":@"A: 因为在红人装的每一笔支付都需要阿里与红人装同时审核，所以在淘宝、天猫购物24小时内显示，京东48显示内显示。如果超过时间以后也没有显示出来，就把淘宝的订单号复制到红人装【我的】-【已购】【订单申述】里提交，然后公司人工处理。",@"isChoice":@"NO"}];

    
}


/**
   数据源方法
 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.dic = self.dataArray[indexPath.row];
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    return cell;
}


/**
 tableview 代理方法
 */

#pragma mark--底部边线距离
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
#pragma mark－－－顶部高距离
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = self.dataArray[indexPath.row];
    NSMutableDictionary *dictemp= [NSMutableDictionary dictionaryWithDictionary:dic];
    
    /*
       点击判断
     */
    if ([dic[@"isChoice"] isEqualToString:@"NO"]) {
        [dictemp setObject:@"YES" forKey:@"isChoice"];
        [self.dataArray replaceObjectAtIndex:indexPath.row withObject:dictemp];
    }else{
        [dictemp setObject:@"NO" forKey:@"isChoice"];
        [self.dataArray replaceObjectAtIndex:indexPath.row withObject:dictemp];
    }
    [tableView reloadData];
    
}

@end
