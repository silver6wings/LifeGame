#import <UIKit/UIKit.h>
#import "LifeViewController.h"
#import "Constant.h"
#import "Cell.h"


@interface LifeView : UIView {
    Cell * cell[CELL_HMAX][CELL_VMAX];    
    int generation;
    
    LifeViewController * myViewController;
    NSTimer * myTimer;
}

-(void)initSelfViewController:(LifeViewController *)lfvc;
-(void) evolve;

-(IBAction) barButtonClicked:(id)sender;
-(IBAction) barClearButtonClicked:(id)sender;

@end
