

//
//  MainTableViewCell.m
//  HXTableView
//
//  Created by 韩旭 on 2017/11/8.
//  Copyright © 2017年 韩旭. All rights reserved.
//

#import "MainTableViewCell.h"
#import "Masonry.h"
@implementation MainTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.contentView.backgroundColor = [UIColor whiteColor];
    //调用方法 搭建UI
    [self setupUI];
    return self;
}

/**
 搭建UI
 */
-(void)setupUI{
    //问题
    UILabel * titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"";
    
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    titleLabel.numberOfLines =0;
    
    
    
    
    ///答案
    UILabel * storeLable = [[UILabel alloc] init];
    storeLable.textColor = [UIColor blackColor];
    storeLable.text = @"";
    storeLable.font = [UIFont systemFontOfSize:14];
    storeLable.numberOfLines = 0;
    [self addSubview:storeLable];
    self.storeLabel = storeLable;
    
    
    
    
    //布局
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(15);
        make.left.equalTo(self).offset(15);
        
        make.right.equalTo(self).offset(-35);
    }];
    
    
    [storeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        
        make.right.equalTo(self).offset(-15);
        make.top.equalTo(titleLabel.mas_bottom).offset(15);
        make.bottom.equalTo(self);
    }];
    
    UIImageView * jiantouImage = [[UIImageView alloc]init];
    jiantouImage.image = [UIImage imageNamed:@"箭头3.2.2.2"];
    jiantouImage.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:jiantouImage];
    [jiantouImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.offset(15);
        make.top.equalTo(titleLabel);
        make.right.equalTo(self).offset(-5);
    }];
    
    self.jiantouimgView = jiantouImage;

}


/**
 
    数据赋值
 */
-(void)setDic:(NSDictionary *)dic{
    _dic = dic;
    
    
    self.titleLabel.text = [NSString stringWithFormat:@"Q: %@",dic[@"content"]];
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString: [NSString stringWithFormat:@"Q: %@",dic[@"content"]]];
    [attributeStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0,2)];
    self.titleLabel.attributedText = attributeStr;

    
    if ([_dic[@"isChoice"] isEqualToString:@"NO"]) {
        self.storeLabel.text =@"";
        self.jiantouimgView.image = [UIImage imageNamed:@"箭头3.2.2.2"];
    }else{
        self.storeLabel.text = [NSString stringWithFormat:@"A: %@",_dic[@"answer"]];
        self.jiantouimgView.image = [UIImage imageNamed:@"下箭头3.2.2.2"];
        NSMutableAttributedString *attributeStr1 = [[NSMutableAttributedString alloc] initWithString: [NSString stringWithFormat:@"A: %@",_dic[@"answer"]]];
        [attributeStr1 addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0,2)];
        self.storeLabel.attributedText = attributeStr1;
    }

}

/*
 注: 在布局cell的时候 由于数据文字多少每个cell不一致  所以要自适应高度  所以在布局cell的时候要注意   要让cell内的控件撑起来cell   最上面的控件top 根据self的top布局  最下面的控件 bottom 根据self的bottom布局 中间的上下连接

 */

@end
