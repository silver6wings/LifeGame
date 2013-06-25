#import <UIKit/UIKit.h>
#import "LifeViewController.h"
#import "Constant.h"
#import "Cell.h"


@interface LifeView : UIView {
    Cell * cell[CELL_HMAX][CELL_VMAX];    
    int generation;
    
    LifeViewController * superViewController;
    NSTimer * lifeTimer;
}

-(void) initSelfViewController:(LifeViewController *)lfvc;
-(void) evolve;

-(IBAction) barButtonClicked:(id)sender;
-(IBAction) barClearClicked:(id)sender;


@end
