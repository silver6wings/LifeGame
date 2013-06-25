#import <UIKit/UIKit.h>
#import "LifeViewController.h"
#import "Constant.h"
#import "Cell.h"


@interface LifeView : UIView {
    Cell * cell[CELL_HMAX][CELL_VMAX];    
    int generation;
    
    NSTimer * myTimer;
}

-(void) evolve;
-(IBAction) barButtonClicked:(id)sender;

@end
