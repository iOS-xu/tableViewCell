# tableviewcell
tableviewcell 显示隐藏

    通过添加@"isChoice":@"NO" 赋值给cell 在cell里 进行处理

    如果是NO storeLabel为空
    如果是YES storeLabel有数据

    在   didSelectRowAtIndexPath 的代理方法里进行判断
    刷新 tableview
