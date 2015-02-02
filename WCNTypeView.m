#import "WCNTypeView.h"
#import "WCNButton.h"
#import "WCNButton+AssociatedObject.h"


@interface WCNTypeView ()

@property(strong, nonatomic)NSArray *titles;
@property(strong, nonatomic)NSMutableArray *buttons;
@property(assign, nonatomic)int curBtnTag;

/**
 *  综合判断 button的状态 
 首先确定 是否选中 
 其次判定 是否是第一次点击
 */

@end

@implementation WCNTypeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (id)initWithFrame:(CGRect)frame andData:(NSArray*)titles andBgImage:(UIImage*)bgImage andSelectedBgImage:(UIImage*)bgSelectedImage
{
    NSLog(@"%s", __func__);
    if (self=[super initWithFrame:frame]) {
        self.titles=[NSArray arrayWithArray:titles];
        self.buttons=[NSMutableArray array];
        self.curBtnTag=-1;
        self.bgImage=bgImage;
        self.bgSelectedImage=bgSelectedImage;
        [self makeButtons];
        [self buttonChanged:self.buttons[0]];
    }
    return self;
}

- (void)makeButtons
{
    NSLog(@"%s", __func__);
    float btnWidth=self.frame.size.width / self.titles.count ;
    float btnHeight=self.frame.size.height;
    float btnX=0;
    float btnY=0;
    [self.buttons removeAllObjects];
    for (int i=0, iLen=self.titles.count; i<iLen; i++) {
        NSString *str=self.titles[i];
        WCNButton *btn=[WCNButton buttonWithType:UIButtonTypeCustom];
        btn.tag=i;
        btn.frame=CGRectMake(btnX, btnY, btnWidth, btnHeight);
        [btn setTitle:str forState:UIControlStateNormal];
        [btn  setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [btn setTitle:str forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [btn setBackgroundImage:self.bgImage forState:UIControlStateNormal];
        [btn setBackgroundImage:self.bgSelectedImage forState:UIControlStateSelected];
        btn.associatedObject=@"0";
        [btn addTarget:self action:@selector(buttonChanged:) forControlEvents:UIControlEventTouchUpInside];
        [self.buttons addObject:btn];
        btnX+=btnWidth;
    }
}

- (void)buttonChanged:(WCNButton*)sender
{
    NSLog(@"%s", __func__);
    for (WCNButton *btn in self.buttons) {
        if (btn.tag==sender.tag) {
            btn.selected=YES;
            if (self.curBtnTag == sender.tag) {
                btn.associatedObject=[NSString stringWithFormat:@"%d",([btn.associatedObject intValue]+1)%2];
            }
        }else{
            btn.selected=NO;
        }
    }
    self.curBtnTag=sender.tag;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickedChanged:)]) {
        [self.delegate clickedChanged:[NSIndexPath indexPathForRow:[sender.associatedObject intValue] inSection:self.curBtnTag]];
    }
    
    NSLog(@"curBtnTag= %d, curBtnState= %@", self.curBtnTag, sender.associatedObject);
}

- (void)layoutSubviews
{
    NSLog(@"%s", __func__);
    [super layoutSubviews];
    for (WCNButton *btn in self.buttons) {
        [self  addSubview:btn];
    }
}

@end
