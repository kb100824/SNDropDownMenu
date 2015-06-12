#下拉菜单动态创建多个按钮
#ps:按钮背景图可以在SNDropDownMenu类由自己更改
  #1：使用类方法创建多个动态按钮，并通过回调移除view和按钮
  
    NSArray *titleArray = @[@"按钮",@"按钮2",@"按钮3"];
    
    [SNDropDownMenu showInView:self.view andButtonTitle:titleArray completeHandlerBlock:^(NSInteger selectIndex, NSString *selectTitle) {
        NSLog(@"selectIndex= %ld selectTitle = %@",selectIndex,selectTitle);
        
    }];
    
    #2：类方法移除view和按钮
    [SNDropDownMenu removeView];
#3演示图
![Image](https://github.com/KBvsMJ/SNDropDownMenu/blob/master/demogif/1.gif)
