#import "WCNButton.h"

@implementation WCNButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGSize imgSize=self.imageView.bounds.size;
    CGSize labelSize=self.titleLabel.bounds.size;
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imgSize.width, 0, imgSize.width)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, labelSize.width, 0, -labelSize.width)];
    
}

@end
