//
//  wayDetailViewController.m
//  hairStyleHouse
//
//  Created by jeason on 13-12-11.
//  Copyright (c) 2013年 jeason. All rights reserved.
//

#import "wayDetailViewController.h"
#import "AppDelegate.h"
#import "ASIFormDataRequest.h"
#import "SBJson.h"
#import "UIImageView+WebCache.h"

#import "MobClick.h"
@interface wayDetailViewController ()

@end

@implementation wayDetailViewController
@synthesize inforDic;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self refreashNavLab];
    [self refreashNav];
    myTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    dic = [[NSDictionary alloc] init];
    dresserArray =[[NSMutableArray alloc] init];
    
    //    myTableView.allowsSelection=NO;
    [myTableView setSeparatorInset:UIEdgeInsetsZero];
    myTableView.dataSource=self;
    myTableView.delegate=self;
    myTableView.allowsSelection=NO;
    
    myTableView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:myTableView];
    
    [self getData];
    
}
#pragma mark - View lifecycle

-(void) viewDidAppear:(BOOL)animated
{
    NSString* cName = [NSString stringWithFormat:@"资讯详情"];
    [MobClick beginLogPageView:cName];
//
}

-(void) viewDidDisappear:(BOOL)animated
{
    NSString* cName = [NSString stringWithFormat:@"资讯详情"];
    [MobClick endLogPageView:cName];
}
-(void)refreashNav
{
    UIButton * leftButton=[[UIButton alloc] init];
    leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton.layer setMasksToBounds:YES];
    [leftButton.layer setCornerRadius:3.0];
    [leftButton.layer setBorderWidth:1.0];
    [leftButton.layer setBorderColor: CGColorCreate(CGColorSpaceCreateDeviceRGB(),(CGFloat[]){ 0, 0, 0, 0 })];//边框颜色
    [leftButton setImage:[UIImage imageNamed:@"返回.png"]  forState:UIControlStateNormal];
    leftButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [leftButton setBackgroundColor:[UIColor clearColor]];
    [leftButton setTitleColor:[UIColor colorWithRed:245.0/256.0 green:35.0/256.0 blue:96.0/256.0 alpha:1.0] forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    leftButton.frame = CGRectMake(0,28, 24, 26);
    UIBarButtonItem *leftButtonItem=[[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem=leftButtonItem;
}

-(void)leftButtonClick
{
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)refreashNavLab
{
    UILabel * Lab= [[UILabel alloc] initWithFrame:CGRectMake(160, 7, 100, 30)];
    Lab.text = [NSString stringWithFormat:@"资讯详情"];
    Lab.textAlignment = NSTextAlignmentCenter;
    Lab.font = [UIFont systemFontOfSize:16];
    Lab.textColor = [UIColor blackColor];
    self.navigationItem.titleView =Lab;
}

-(void)getData
{
    //    AppDelegate* appDele=(AppDelegate* )[UIApplication sharedApplication].delegate;
    NSURL * urlString= [NSURL URLWithString:@"http://wap.faxingw.cn/wapapp.php?g=wap&m=news&a=newsView"];
    ASIFormDataRequest* request=[[ASIFormDataRequest alloc] initWithURL:urlString];
    request.delegate=self;
    request.tag=1;
    [request setPostValue:[inforDic objectForKey:@"news_id"] forKey:@"news_id"];
    [request startAsynchronous];
}
-(void)requestFinished:(ASIHTTPRequest *)request
{
    if (dresserArray!=nil) {
        [dresserArray removeAllObjects];
    }
    if (request.tag==1) {
        NSLog(@"%@",request.responseString);
        NSData*jsondata = [request responseData];
        NSString*jsonString = [[NSString alloc]initWithBytes:[jsondata bytes]length:[jsondata length]encoding:NSUTF8StringEncoding];
            jsonString = [jsonString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //去除掉首尾的空白字符和换行字符
            jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\r" withString:@""];
            jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        SBJsonParser* jsonP=[[SBJsonParser alloc] init];
        dic=[jsonP objectWithString:jsonString];
        NSLog(@"资讯详情dic:%@",dic);
        
        if ([[dic objectForKey:@"content_list"] isKindOfClass:[NSString class]])
        {
            
        }
        else if ([[dic objectForKey:@"content_list"] isKindOfClass:[NSArray class]])
        {
            dresserArray = [dic objectForKey:@"content_list"];//评价列表
        }
        
        [self freashView];
    }

}

-(void)freashView
{
    [myTableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dresserArray.count+1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([indexPath row]==0)
    {
        NSString* contentStr = [dic  objectForKey:@"title"];
        UIFont *font = [UIFont systemFontOfSize:16.0];
        //设置一个行高上限
        CGSize size = CGSizeMake(300,400);
        //计算实际frame大小，并将label的frame变成实际大小
        CGSize labelsize = [contentStr sizeWithFont:font constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap];
       
            return 30+labelsize.height;
        
    }
    else
    {
        //初始化label
        //        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
        //设置自动行数与字符换行
        //        [label setNumberOfLines:0];
        //        label.lineBreakMode = UILineBreakModeWordWrap;
        //        [label setFrame:CGRectMake(0,0, labelsize.width, labelsize.height)];
        
        
        // 测试字串
        NSString *_content =[[dresserArray objectAtIndex:[indexPath row]-1] objectForKey:@"content"];
        UIFont *font = [UIFont systemFontOfSize:12.0];
        //设置一个行高上限
        CGSize size = CGSizeMake(300,400);
        //计算实际frame大小，并将label的frame变成实际大小
        CGSize labelsize = [_content sizeWithFont:font constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap];
       return 320+labelsize.height;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID=@"cell";
    wayDetailCell *cell=(wayDetailCell*)[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell=[[wayDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSInteger row =[indexPath row];
    if (row==0) {
        
        [cell setFirstCell:dic ];
    }
    else
    {
        [cell setOtherCell:dresserArray and:row];
    }
    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
