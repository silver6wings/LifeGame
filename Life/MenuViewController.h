#import <UIKit/UIKit.h>
#import "LifeViewController.h"


@interface MenuViewController : UIViewController {
    LifeViewController * superViewControler;
    
    IBOutlet UISwitch * killed0;
    IBOutlet UISwitch * killed1;
    IBOutlet UISwitch * killed2;
    IBOutlet UISwitch * killed3;
    IBOutlet UISwitch * killed4;
    IBOutlet UISwitch * killed5;
    IBOutlet UISwitch * killed6;
    IBOutlet UISwitch * killed7;
    IBOutlet UISwitch * killed8;
    
    IBOutlet UISwitch * birth0;
    IBOutlet UISwitch * birth1;
    IBOutlet UISwitch * birth2;
    IBOutlet UISwitch * birth3;
    IBOutlet UISwitch * birth4;
    IBOutlet UISwitch * birth5;
    IBOutlet UISwitch * birth6;
    IBOutlet UISwitch * birth7;
    IBOutlet UISwitch * birth8;
    
    IBOutlet UILabel * sliderLabel;
}

@property (nonatomic,retain) LifeViewController * superViewController;

@property (nonatomic,retain) UISwitch * killed0;
@property (nonatomic,retain) UISwitch * killed1;
@property (nonatomic,retain) UISwitch * killed2;
@property (nonatomic,retain) UISwitch * killed3;
@property (nonatomic,retain) UISwitch * killed4;
@property (nonatomic,retain) UISwitch * killed5;
@property (nonatomic,retain) UISwitch * killed6;
@property (nonatomic,retain) UISwitch * killed7;
@property (nonatomic,retain) UISwitch * killed8;

@property (nonatomic,retain) UISwitch * birth0;
@property (nonatomic,retain) UISwitch * birth1;
@property (nonatomic,retain) UISwitch * birth2;
@property (nonatomic,retain) UISwitch * birth3;
@property (nonatomic,retain) UISwitch * birth4;
@property (nonatomic,retain) UISwitch * birth5;
@property (nonatomic,retain) UISwitch * birth6;
@property (nonatomic,retain) UISwitch * birth7;
@property (nonatomic,retain) UISwitch * birth8;

@property (nonatomic,retain) UILabel * sliderLabel;

-(void) refresh;
-(IBAction) sliderChanged:(id)sender;
-(IBAction) switchChanged:(id)sender;

@end