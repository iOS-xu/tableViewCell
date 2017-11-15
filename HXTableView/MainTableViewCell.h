//
//  MainTableViewCell.h
//  HXTableView
//
//  Created by 韩旭 on 2017/11/8.
//  Copyright © 2017年 韩旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView * jiantouimgView;
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UILabel * storeLabel;
@property (nonatomic,strong) NSDictionary *dic;

@end
