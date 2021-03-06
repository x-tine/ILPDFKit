
#import "PDFUIAdditionElementView.h"

@implementation PDFUIAdditionElementView

@synthesize baseFrame;
@synthesize delegate;


-(void)dealloc
{
    [delegate removeObserver:self forKeyPath:@"value"];
    [delegate removeObserver:self forKeyPath:@"options"];
    [super dealloc];
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self != nil)
    {
        baseFrame = frame;
        zoomScale = 1.0;
    }
    return self;
}


-(void)updateWithZoom:(CGFloat)zoom
{
    zoomScale = zoom;
    self.frame = CGRectMake(baseFrame.origin.x*zoom,baseFrame.origin.y*zoom,baseFrame.size.width*zoom,baseFrame.size.height*zoom);
}


-(void)vectorRenderInPDFContext:(CGContextRef)ctx ForRect:(CGRect)rect
{
}

#pragma mark - Properties

-(void)setValue:(NSString *)value
{
}

-(NSString*)value
{
    return nil;
}

-(void)setOptions:(NSArray *)options
{
}

-(NSArray*)options
{
    return nil;
}

-(void)refresh
{
    [self setNeedsDisplay];
}

-(void)resign
{
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"value"]) {
        self.value = [change objectForKey:NSKeyValueChangeNewKey];
    }
    else if([keyPath isEqualToString:@"options"])
    {
        self.options = [change objectForKey:NSKeyValueChangeNewKey];
    }
}

@end
