#import "LifeView.h"
#import "LifeViewController.h"
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
    
    //Cell inside - line:j colum;i
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
    
    //Cell updown side
    {
        int j,jj;
        for (int i = 1; i <= CELL_HMAX-2; i++) {
            j = 0;
            if (cell[i][j] != nil) {
                tempNeighbour[i][j+1]++;
                tempNeighbour[i-1][j+1]++;
                tempNeighbour[i+1][j+1]++;
                tempNeighbour[i-1][j]++;
                tempNeighbour[i+1][j]++;
                
                if(superViewController.evolveStyle == silverBessel || superViewController.evolveStyle == silverCyliner2){
                    jj = CELL_VMAX-1;                   
                    tempNeighbour[i][jj]++;
                    tempNeighbour[i-1][jj]++;
                    tempNeighbour[i+1][jj]++;
                }
            }
            
            j = CELL_VMAX-1;
            if (cell[i][j] != nil) {
                tempNeighbour[i][j-1]++;
                tempNeighbour[i-1][j-1]++;
                tempNeighbour[i+1][j-1]++;  
                tempNeighbour[i-1][j]++;
                tempNeighbour[i+1][j]++;     
                
                if(superViewController.evolveStyle == silverBessel || superViewController.evolveStyle == silverCyliner2){
                    jj = 0;
                    tempNeighbour[i][jj]++;
                    tempNeighbour[i-1][jj]++;
                    tempNeighbour[i+1][jj]++;
                }
            }
            
        }
    }
    
    //Cell leftright side
    {
        int i,ii;
        for (int j = 1; j <= CELL_VMAX-2; j++) {
            i = 0;
            if (cell[i][j] != nil) {
                tempNeighbour[i+1][j]++;
                tempNeighbour[i+1][j+1]++;
                tempNeighbour[i+1][j-1]++;
                tempNeighbour[i][j+1]++;
                tempNeighbour[i][j-1]++; 
                
                if(superViewController.evolveStyle == silverBessel || superViewController.evolveStyle == silverCyliner){
                    ii = CELL_HMAX - 1;
                    tempNeighbour[ii][j]++;
                    tempNeighbour[ii][j+1]++;
                    tempNeighbour[ii][j-1]++;
                }
            }
            
            i = CELL_HMAX - 1;
            if (cell[i][j] != nil) {
                tempNeighbour[i-1][j]++;
                tempNeighbour[i-1][j+1]++;
                tempNeighbour[i-1][j-1]++;
                tempNeighbour[i][j+1]++;
                tempNeighbour[i][j-1]++;                
                
                if(superViewController.evolveStyle == silverBessel || superViewController.evolveStyle == silverCyliner){
                    ii = 0;
                    tempNeighbour[ii][j]++;
                    tempNeighbour[ii][j+1]++;
                    tempNeighbour[ii][j-1]++;
                }
            }
        }
    }
    
    //Cell at 4 corner
    {
        // up left
        int i = 0;
        int j = 0;
        int ii = CELL_HMAX-1;
        int jj = CELL_VMAX-1;
        if(cell[i][j] != nil){
            tempNeighbour[i][j+1]++;
            tempNeighbour[i+1][j]++;
            tempNeighbour[i+1][j+1]++;
            if(superViewController.evolveStyle == silverBessel || superViewController.evolveStyle == silverCyliner){
                tempNeighbour[ii][j]++;
                tempNeighbour[ii][j+1]++;
            }
            if(superViewController.evolveStyle == silverBessel || superViewController.evolveStyle == silverCyliner2){
                tempNeighbour[i][jj]++;
                tempNeighbour[i+1][jj]++;
            }
            if(superViewController.evolveStyle == silverBessel){
                tempNeighbour[ii][jj]++;
            }
        }
        
        //down left
        i = 0;
        j = CELL_VMAX-1;
        ii = CELL_HMAX-1;
        jj = 0;
        if(cell[i][j] != nil){
            tempNeighbour[i][j-1]++;
            tempNeighbour[i+1][j]++;
            tempNeighbour[i+1][j-1]++;
            if(superViewController.evolveStyle == silverBessel || superViewController.evolveStyle == silverCyliner){
                tempNeighbour[ii][j]++;
                tempNeighbour[ii][j-1]++;
            }
            if(superViewController.evolveStyle == silverBessel || superViewController.evolveStyle == silverCyliner2){
                tempNeighbour[i][jj]++;
                tempNeighbour[i+1][jj]++;
            }
            if(superViewController.evolveStyle == silverBessel){
                tempNeighbour[ii][jj]++;
            }
        }
        
        //down right
        i = CELL_HMAX-1;
        j = CELL_VMAX-1;
        ii = 0;
        jj = 0;
        if(cell[i][j] != nil){
            tempNeighbour[i][j-1]++;
            tempNeighbour[i-1][j]++;
            tempNeighbour[i-1][j-1]++;
            if(superViewController.evolveStyle == silverBessel || superViewController.evolveStyle == silverCyliner){
                tempNeighbour[ii][j]++;
                tempNeighbour[ii][j-1]++;
            }
            if(superViewController.evolveStyle == silverBessel || superViewController.evolveStyle == silverCyliner2){
                tempNeighbour[i][jj]++;
                tempNeighbour[i-1][jj]++;
            }
            if(superViewController.evolveStyle == silverBessel){
                tempNeighbour[ii][jj]++;
            }
        }
        
        //up right
        i = CELL_HMAX-1;
        j = 0;
        ii = 0;
        jj = CELL_VMAX-1;
        if(cell[i][j] != nil){
            tempNeighbour[i][j+1]++;
            tempNeighbour[i-1][j]++;
            tempNeighbour[i-1][j+1]++;
            if(superViewController.evolveStyle == silverBessel || superViewController.evolveStyle == silverCyliner){
                tempNeighbour[ii][j]++;
                tempNeighbour[ii][j+1]++;
            }
            if(superViewController.evolveStyle == silverBessel || superViewController.evolveStyle == silverCyliner2){
                tempNeighbour[i][jj]++;
                tempNeighbour[i-1][jj]++;
            }
            if(superViewController.evolveStyle == silverBessel){
                tempNeighbour[ii][jj]++;
            }
        }
    }
    
    // * Finish Neighbour Search
    
    // Move the next generation map back
    for (int i = 0; i <= CELL_HMAX-1; i++) {
        for (int j = 0; j <= CELL_VMAX-1; j++) {
            if(cell[i][j] == nil){
                //birth    
                if(tempNeighbour[i][j] == 0 && superViewController.isBirth0){cell[i][j] = [[Cell alloc] init];}
                if(tempNeighbour[i][j] == 1 && superViewController.isBirth1){cell[i][j] = [[Cell alloc] init];}
                if(tempNeighbour[i][j] == 2 && superViewController.isBirth2){cell[i][j] = [[Cell alloc] init];}
                if(tempNeighbour[i][j] == 3 && superViewController.isBirth3){cell[i][j] = [[Cell alloc] init];}
                if(tempNeighbour[i][j] == 4 && superViewController.isBirth4){cell[i][j] = [[Cell alloc] init];}
                if(tempNeighbour[i][j] == 5 && superViewController.isBirth5){cell[i][j] = [[Cell alloc] init];}
                if(tempNeighbour[i][j] == 6 && superViewController.isBirth6){cell[i][j] = [[Cell alloc] init];}
                if(tempNeighbour[i][j] == 7 && superViewController.isBirth7){cell[i][j] = [[Cell alloc] init];}
                if(tempNeighbour[i][j] == 8 && superViewController.isBirth8){cell[i][j] = [[Cell alloc] init];}
            }else{
                //kill    
                if(tempNeighbour[i][j] == 0 && superViewController.isKilled0){[cell[i][j] release];  cell[i][j] = nil;}
                if(tempNeighbour[i][j] == 1 && superViewController.isKilled1){[cell[i][j] release];  cell[i][j] = nil;}
                if(tempNeighbour[i][j] == 2 && superViewController.isKilled2){[cell[i][j] release];  cell[i][j] = nil;}
                if(tempNeighbour[i][j] == 3 && superViewController.isKilled3){[cell[i][j] release];  cell[i][j] = nil;}
                if(tempNeighbour[i][j] == 4 && superViewController.isKilled4){[cell[i][j] release];  cell[i][j] = nil;}
                if(tempNeighbour[i][j] == 5 && superViewController.isKilled5){[cell[i][j] release];  cell[i][j] = nil;}
                if(tempNeighbour[i][j] == 6 && superViewController.isKilled6){[cell[i][j] release];  cell[i][j] = nil;}
                if(tempNeighbour[i][j] == 7 && superViewController.isKilled7){[cell[i][j] release];  cell[i][j] = nil;}
                if(tempNeighbour[i][j] == 8 && superViewController.isKilled8){[cell[i][j] release];  cell[i][j] = nil;}               
            }            
        }
    }
    
    generation++;
    NSString * tempString = [NSString stringWithFormat:@"%d",generation];
    [superViewController.label setText:tempString];
    
    [self setNeedsDisplay];
}

-(IBAction) barButtonClicked:(id)sender{ 
    
    // Control Timer
    if(lifeTimer == nil){
        lifeTimer = [NSTimer scheduledTimerWithTimeInterval:superViewController.evolveInterval
                                                   target:self
                                                 selector:@selector(evolve) 
                                                 userInfo:nil 
                                                  repeats:YES];
        [[superViewController barButton]setTitle:@"Stop"];
    }else{
        if([lifeTimer isValid]){
            [lifeTimer invalidate];
            lifeTimer = nil;
        }
        [[superViewController barButton]setTitle:@"Play"];
    }
}

-(IBAction) barClearClicked:(id)sender{
    for (int i = 0; i <= CELL_HMAX-1; i++){
        for (int j=0; j <= CELL_VMAX-1; j++){
            [cell[i][j] release];
            cell[i][j] = nil;
        }
    }
    generation = 0;
    [superViewController.label setText:@"0"];
    [self setNeedsDisplay];
}



//====== draw process ======

-(void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();        
    CGContextSetLineWidth(context, 1.0);
    
    UIColor * color;
    
    // Drawing process    
//    CGContextAddRect(context, CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT));
//    CGContextDrawPath(context, kCGPathFillStroke);
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
        if(cell[x][y] == nil){
            cell[x][y] = [[Cell alloc] init];
        }else{
            [cell[x][y] release];
            cell[x][y] = nil;
        }
    }
    
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    if (touchPoint.y > 0 && touchPoint.y < SCREEN_HEIGHT) {
        int x = touchPoint.x / CELL_SIZE;
        int y = touchPoint.y / CELL_SIZE;
        if(cell[x][y] == nil){
            cell[x][y] = [[Cell alloc] init];
        }
    }
    
    [self setNeedsDisplay];
}

//====== system ======

-(void)initSelfViewController:(LifeViewController *)lfvc{
    superViewController = lfvc;
}

-(id)initWithCoder:(NSCoder *)coder{
    //Initlization
    self = [super initWithCoder:coder];
    if (self) {    
        generation = 0;
        
        // Change button state
        [[superViewController barButton]setTitle:@"Go"];
        
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
    
    [lifeTimer invalidate];
    [super dealloc];
}

@end
