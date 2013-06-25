#import "LifeView.h"
#import "UIColor-Random.h"

@implementation LifeView

-(void)evolve{
    
    // Simulate the next evolve
    
    int tempNeighbour[CELL_HMAX][CELL_VMAX];
    
    // All init to 0
    for (int i = 0; i <= CELL_HMAX-1; i++) {
        for (int j = 0; j <= CELL_VMAX-1; j++) {
            tempNeighbour[i][j] = 0;
        }
    }
    
    //Cell inside
    for (int i = 1; i <= CELL_HMAX-2; i++) {
        for (int j = 1; j <= CELL_VMAX-2; j++) {
            if (cell[i][j] != nil) {
                tempNeighbour[i+1][j]++;
                tempNeighbour[i-1][j]++;
                tempNeighbour[i][j+1]++;
                tempNeighbour[i][j-1]++;
                tempNeighbour[i+1][j+1]++;
                tempNeighbour[i+1][j-1]++;
                tempNeighbour[i-1][j+1]++;
                tempNeighbour[i-1][j-1]++;            
            }
        }
    }
    
    //Cell left right side
    {
        int j;
        for (int i = 1; i <= CELL_HMAX-2; i++) {
            j = 0;
            if (cell[i][j] != nil) {
                tempNeighbour[i][j+1]++;
                tempNeighbour[i-1][j+1]++;
                tempNeighbour[i+1][j+1]++;
            }
            j = CELL_VMAX-1;
            if (cell[i][j] != nil) {
                tempNeighbour[i][j-1]++;
                tempNeighbour[i-1][j-1]++;
                tempNeighbour[i+1][j-1]++;
            }
        }
    }
    
    //Cell up down side
    {
        int i;
        for (int j = 1; j <= CELL_VMAX-2; j++) {
            i = 0;
            if (cell[i][j] != nil) {
                tempNeighbour[i+1][j]++;
                tempNeighbour[i+1][j+1]++;
                tempNeighbour[i+1][j-1]++;
            }
            i = CELL_HMAX-1;
            if (cell[i][j] != nil) {
                tempNeighbour[i-1][j]++;
                tempNeighbour[i-1][j+1]++;
                tempNeighbour[i-1][j-1]++;
            }
        }
    }
    
    //Cell at 4 corner
    {
        int i = 0;
        int j = 0;
        if(cell[i][j] != nil){
            tempNeighbour[i][j+1]++;
            tempNeighbour[i+1][j]++;
            tempNeighbour[i+1][j+1]++;
        }
        
        i = 0;
        j = CELL_VMAX-1;
        if(cell[i][j] != nil){
            tempNeighbour[i][j-1]++;
            tempNeighbour[i+1][j]++;
            tempNeighbour[i+1][j-1]++;
        }
        
        i = CELL_HMAX-1;
        j = CELL_VMAX-1;
        if(cell[i][j] != nil){
            tempNeighbour[i][j-1]++;
            tempNeighbour[i-1][j]++;
            tempNeighbour[i-1][j-1]++;
        }
        
        i = CELL_HMAX-1;
        j = 0;
        if(cell[i][j] != nil){
            tempNeighbour[i][j+1]++;
            tempNeighbour[i-1][j]++;
            tempNeighbour[i-1][j+1]++;
        }
    }
    
    // * Finish Neighbour Search
    
    // Move the next generation map back
    for (int i = 0; i <= CELL_HMAX-1; i++) {
        for (int j = 0; j <= CELL_VMAX-1; j++) {
            //lonely to die or crowd to die
            if (tempNeighbour[i][j] <= 1 || tempNeighbour[i][j] >= 4) {
                [cell[i][j] release];
                cell[i][j] = nil;
            }
            //born new cell
            if(tempNeighbour[i][j] == 3 && cell[i][j] == nil){
                cell[i][j] = [[Cell alloc] init];
            }
        }
    }
    
    generation++;
    NSString * tempString = [NSString stringWithFormat:@"%d",generation];
    [myViewController.label setText:tempString];
    [self setNeedsDisplay];
}

-(IBAction)barButtonClicked:(id)sender{ 
    
    // Control Timer
    if(myTimer == nil){
        myTimer = [NSTimer scheduledTimerWithTimeInterval:EVOLVE_INTERVAL 
                                                   target:self
                                                 selector:@selector(evolve) 
                                                 userInfo:nil 
                                                  repeats:YES];
        [[myViewController barButton]setTitle:@"Stop"];
    }else{
        if([myTimer isValid]){
            [myTimer invalidate];
            myTimer = nil;
        }
        [[myViewController barButton]setTitle:@"Play"];
    }
}

-(IBAction) barClearButtonClicked:(id)sender{
    for (int i = 0; i <= CELL_HMAX-1; i++){
        for (int j=0; j <= CELL_VMAX-1; j++){
            [cell[i][j] release];
            cell[i][j] = nil;
        }
    }
    [self setNeedsDisplay];
}



//====== draw process ======

-(void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();        
    CGContextSetLineWidth(context, 1.0);
    
    UIColor * color;
    
    // Drawing process    
    CGContextAddRect(context, CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT));
    CGContextDrawPath(context, kCGPathFillStroke);
    // Draw Cells
    for (int i = 0; i <= CELL_HMAX-1; i++) {
        for (int j = 0; j <= CELL_VMAX-1; j++) {
            if(cell[i][j] != nil){
                color = cell[i][j].color;
                CGContextSetStrokeColorWithColor(context, color.CGColor);
                CGContextSetFillColorWithColor(context, color.CGColor);
                CGContextAddEllipseInRect(context, CGRectMake(i*CELL_SIZE, j*CELL_SIZE, CELL_SIZE-1, CELL_SIZE-1));
                CGContextDrawPath(context, kCGPathFillStroke);
            }
        }
    }
    
}

//====== event ======

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    if (touchPoint.y > 0 && touchPoint.y < SCREEN_HEIGHT) {
        int x = touchPoint.x / CELL_SIZE;
        int y = touchPoint.y / CELL_SIZE;
        cell[x][y] = [[Cell alloc] init];
    }
    
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [self touchesBegan:touches withEvent:event];
}

//====== system ======

-(void)initSelfViewController:(LifeViewController *)lfvc{
    myViewController = lfvc;
}

-(id)initWithCoder:(NSCoder *)coder{
    //Initlization
    self = [super initWithCoder:coder];
    if (self) {    
        generation = 0;
        
        // Change button state
        [[myViewController barButton]setTitle:@"Go"];
        
        for (int i = 0; i <= CELL_HMAX-1; i++) 
            for (int j=0; j <= CELL_VMAX-1; j++) 
                cell[i][j] = nil;
    }            
    
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {}
    return self;
    NSLog(@"LifeView initWithFrame");
}



- (void)dealloc{
    for (int i = 0; i <= CELL_HMAX-1; i++) 
        for (int j=0; j <= CELL_VMAX-1; j++)   
            [cell[i][j] release];
    
    [myTimer invalidate];
    [super dealloc];
}

@end
