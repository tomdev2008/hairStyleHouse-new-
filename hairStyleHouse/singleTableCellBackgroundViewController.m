//
//  singleTableCellBackgroundViewController.m
//  hairStyleHouse
//
//  Created by jeason on 13-11-27.
//  Copyright (c) 2013年 jeason. All rights reserved.
//

#import "singleTableCellBackgroundViewController.h"
#import "UIImageView+WebCache.h"
#import "mineViewController.h"
#import "AppDelegate.h"

@interface singleTableCellBackgroundViewController ()

@end

@implementation singleTableCellBackgroundViewController
@synthesize fatherController;
@synthesize infoDic;
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
    
    _firstBackView.layer.cornerRadius = 5;//设置那个圆角的有多圆
    _firstBackView.layer.borderWidth =1;//设置边框的宽度，当然可以不要
    _firstBackView.layer.borderColor = [[UIColor colorWithRed:154.0/256.0 green:154.0/256.0 blue:154.0/256.0 alpha:1.0] CGColor];//设置边框的颜色
    _firstBackView.layer.masksToBounds = YES;//设为NO去试试
    
    
    _clearPerson.layer.cornerRadius = 5;//设置那个圆角的有多圆
    _clearPerson.layer.borderWidth =1;//设置边框的宽度，当然可以不要
    _clearPerson.layer.borderColor = [[UIColor colorWithRed:154.0/256.0 green:154.0/256.0 blue:154.0/256.0 alpha:1.0] CGColor];//设置边框的颜色
    _clearPerson.layer.masksToBounds = YES;//设为NO去试试
    
    
    _myMessage.layer.cornerRadius = 5;//设置那个圆角的有多圆
    _myMessage.layer.borderWidth =1;//设置边框的宽度，当然可以不要
    _myMessage.layer.borderColor = [[UIColor colorWithRed:154.0/256.0 green:154.0/256.0 blue:154.0/256.0 alpha:1.0] CGColor];//设置边框的颜色
    _myMessage.layer.masksToBounds = YES;//设为NO去试试
    
    _myBeaspeak.layer.cornerRadius = 5;//设置那个圆角的有多圆
    _myBeaspeak.layer.borderWidth =1;//设置边框的宽度，当然可以不要
    _myBeaspeak.layer.borderColor = [[UIColor colorWithRed:154.0/256.0 green:154.0/256.0 blue:154.0/256.0 alpha:1.0] CGColor];//设置边框的颜色
    _myBeaspeak.layer.masksToBounds = YES;//设为NO去试试
    
    _myWorks.layer.cornerRadius = 5;//设置那个圆角的有多圆
    _myWorks.layer.borderWidth =1;//设置边框的宽度，当然可以不要
    _myWorks.layer.borderColor = [[UIColor colorWithRed:154.0/256.0 green:154.0/256.0 blue:154.0/256.0 alpha:1.0] CGColor];//设置边框的颜色
    _myWorks.layer.masksToBounds = YES;//设为NO去试试
    
    _mySave.layer.cornerRadius = 5;//设置那个圆角的有多圆
    _mySave.layer.borderWidth =1;//设置边框的宽度，当然可以不要
    _mySave.layer.borderColor = [[UIColor colorWithRed:154.0/256.0 green:154.0/256.0 blue:154.0/256.0 alpha:1.0] CGColor];//设置边框的颜色
    _mySave.layer.masksToBounds = YES;//设为NO去试试
    
    _toolBox.layer.cornerRadius = 5;//设置那个圆角的有多圆
    _toolBox.layer.borderWidth =1;//设置边框的宽度，当然可以不要
    _toolBox.layer.borderColor = [[UIColor colorWithRed:154.0/256.0 green:154.0/256.0 blue:154.0/256.0 alpha:1.0] CGColor];//设置边框的颜色
    _toolBox.layer.masksToBounds = YES;//设为NO去试试
    
    _myShow.layer.cornerRadius = 5;//设置那个圆角的有多圆
    _myShow.layer.borderWidth =1;//设置边框的宽度，当然可以不要
    _myShow.layer.borderColor = [[UIColor colorWithRed:154.0/256.0 green:154.0/256.0 blue:154.0/256.0 alpha:1.0] CGColor];//设置边框的颜色
    _myShow.layer.masksToBounds = YES;//设为NO去试试
    
    _mySet.layer.cornerRadius = 5;//设置那个圆角的有多圆
    _mySet.layer.borderWidth =1;//设置边框的宽度，当然可以不要
    _mySet.layer.borderColor = [[UIColor colorWithRed:154.0/256.0 green:154.0/256.0 blue:154.0/256.0 alpha:1.0] CGColor];//设置边框的颜色
    _mySet.layer.masksToBounds = YES;//设为NO去试试
    
    
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated
{
    NSString* headStr=[infoDic objectForKey:@"head_photo"];
    NSString* nameStr = [infoDic objectForKey:@"username"];
    NSString* cityStr = [infoDic objectForKey:@"city"];
    NSString* fansStr = [infoDic objectForKey:@"fans_num"];
    NSString* fouceStr = [infoDic objectForKey:@"attention_num"];
    NSString* workStr = [infoDic objectForKey:@"works_num"];
    
    NSMutableArray * workArr ;
    if ([[infoDic objectForKey:@"portfolio"] isKindOfClass:[NSArray class]]) {
        workArr = [infoDic objectForKey:@"portfolio"];
    }
    else
    {
        
    }
    
    NSString* messageStr = [infoDic objectForKey:@"newpm"];
    NSString* beaspeakStr = [infoDic objectForKey:@"reserve_num"];
    NSString* saveStr = [infoDic objectForKey:@"collect_num"];
    NSString* mobileStr = [infoDic objectForKey:@"mobile"];
    NSString* inforStr = [infoDic objectForKey:@"signature"];
    
    [_headImage setImageWithURL:[NSURL URLWithString:headStr]];
    _nameLable.text = nameStr;
    _addressLable.text = cityStr;
    _fansLable.text =fansStr;
    _fouceLable.text = fouceStr;
//    [_fansButton setTitle:[NSString stringWithFormat:@"我的粉丝%@",fansStr] forState:UIControlStateNormal];
//    [_fouceButton setTitle:[NSString stringWithFormat:@"我的关注%@",fouceStr] forState:UIControlStateNormal];
    _worksLable.text = [NSString stringWithFormat:@"作品集(共%@张)",workStr];
    _messageLable.text = [NSString stringWithFormat:@"%@",messageStr];
    _beaspeakLable.text = [NSString stringWithFormat:@"%@",beaspeakStr];
    _saveLable.text = [NSString stringWithFormat:@"%@",saveStr];
    _mobileLable.text = [NSString stringWithFormat:@"%@",mobileStr];
    _personInforText.text = inforStr;
    
    for (UIView* _sub in workScroll.subviews)
    {
//        if ([_sub isKindOfClass:[AllAroundPullView class]]) {
//            continue;
//        }
        [_sub removeFromSuperview];
    }
    
    if (workArr.count>0)
    {
        [workScroll setContentSize:CGSizeMake(workArr.count*(60+10), 60)];
        if (workScroll.contentSize.width<workScroll.frame.size.width)
        {
            [workScroll setContentSize:CGSizeMake(workScroll.frame.size.width+1, workScroll.frame.size.height)];
        }
            CGRect rect=CGRectZero;
            for (int i=0; i<workArr.count; i++)
            {
                rect=CGRectMake(60*i+10*(i+1), 10, 60, 60);
                UIImageView * workImage = [[UIImageView alloc] initWithFrame:rect];
                [workImage setImageWithURL:[[workArr objectAtIndex:i] objectForKey:@"work_image"]];
                UIButton *newvideobutton=[UIButton buttonWithType:UIButtonTypeCustom];
                newvideobutton.backgroundColor=[UIColor clearColor];
                newvideobutton.tag=i;
                [newvideobutton addTarget:self  action:@selector(selectImage:) forControlEvents:UIControlEventTouchUpInside];
                [newvideobutton setFrame:rect];
                [workScroll addSubview:workImage];
                [workScroll addSubview:newvideobutton];
            }
    }
}

-(void)selectImage:(UIButton*)button
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)headButtonClick:(id)sender
{
    personInfor = nil;
    personInfor =[[personInforViewController alloc] init];
    personInfor._hidden =@"yes";
    [fatherController needAppdelegatePushToViewController:personInfor];
}

- (IBAction)myFansButtonClick:(id)sender {
    fansAndfouceAndMassege = nil;
    fansAndfouceAndMassege =[[fansAndFouceAndmassegeViewController alloc] init];
    fansAndfouceAndMassege.fansOrFouceOrMessage=@"noMassege";
    fansAndfouceAndMassege.fansOrFouce=@"fans";
    [fatherController needAppdelegatePushToViewController:fansAndfouceAndMassege];
}

- (IBAction)myFouceButtonClick:(id)sender
{
    fansAndfouceAndMassege = nil;
    fansAndfouceAndMassege =[[fansAndFouceAndmassegeViewController alloc] init];
    fansAndfouceAndMassege.fansOrFouceOrMessage=@"noMassege";
    fansAndfouceAndMassege.fansOrFouce=@"fouce";
    [fatherController needAppdelegatePushToViewController:fansAndfouceAndMassege];

}



- (IBAction)clearPersonButtonClick:(id)sender
{
    sameCityView = nil;
    sameCityView= [[sameCityViewController alloc] init];
    sameCityView._hidden = @"yes";
    [fatherController needAppdelegatePushToViewController:sameCityView];
}

- (IBAction)messageButtonClick:(id)sender
{
    fansAndfouceAndMassege = nil;
    fansAndfouceAndMassege =[[fansAndFouceAndmassegeViewController alloc] init];
    fansAndfouceAndMassege.fansOrFouceOrMessage=@"massege";
    [fatherController needAppdelegatePushToViewController:fansAndfouceAndMassege];


}

- (IBAction)beaspeakButtonClick:(id)sender
{
    beaspeakView = nil;
    beaspeakView = [[beaspeakViewController alloc] init];
    [fatherController needAppdelegatePushToViewController:beaspeakView];
}

- (IBAction)myWorksButtonClick:(id)sender
{
    scanView=nil;
    scanView = [[scanImageViewController alloc] init];
    AppDelegate* appDele=(AppDelegate* )[UIApplication sharedApplication].delegate;
    scanView.uid = appDele.uid;
    scanView.worksOrsave = @"works";
    scanView.selfOrOther = @"self";
    scanView._hidden = @"yes";
    [fatherController needAppdelegatePushToViewController:scanView];
}

- (IBAction)saveButtonClick:(id)sender
{
    scanView=nil;
    scanView = [[scanImageViewController alloc] init];
    scanView._hidden = @"yes";
    AppDelegate* appDele=(AppDelegate* )[UIApplication sharedApplication].delegate;
    scanView.uid = appDele.uid;
    scanView.worksOrsave = @"save";
//    [fatherController needAppdelegatePushToViewController:scanView];
//    AppDelegate* appDele=(AppDelegate* )[UIApplication sharedApplication].delegate;
    
    [ appDele pushToViewController:scanView];
    
}

- (IBAction)toolBoxButtonClick:(id)sender
{
    toolBoxView = nil;
    toolBoxView = [[toolBoxViewController alloc] init];
    toolBoxView._hidden = @"yes";
    [fatherController needAppdelegatePushToViewController:toolBoxView];
    
}

- (IBAction)myShowButtonClick:(id)sender
{
    myShowView = nil;
    myShowView = [[myShowViewController alloc] init];
    myShowView._hidden = @"yes";

    [ fatherController needAppdelegatePushToViewController:myShowView];
}
- (IBAction)mySetButtonClick:(id)sender
{

    mySetView = nil;
    mySetView = [[mySetViewController alloc] init];
    mySetView._hidden = @"yes";
    [ fatherController needAppdelegatePushToViewController:mySetView];

}
@end
