#import <UIKit/UIKit.h>

@class MenuViewController;

@interface LifeViewController : UIViewController {
    int evolveStyle;
    float evolveInterval;
    bool isMenuOpen;  
    
    bool isKilled0;
    bool isKilled1;
    bool isKilled2;
    bool isKilled3;
    bool isKilled4;
    bool isKilled5;
    bool isKilled6;
    bool isKilled7;
    bool isKilled8;
    
    bool isBirth0;
    bool isBirth1;
    bool isBirth2;
    bool isBirth3;
    bool isBirth4;
    bool isBirth5;
    bool isBirth6;
    bool isBirth7;
    bool isBirth8;
    
    IBOutlet UIBarButtonItem * barButton;
    IBOutlet UIBarButtonItem * barMenu;
    IBOutlet UILabel * label;
    
    MenuViewController * menuViewController;
}

@property int evolveStyle;
@property float evolveInterval;
@property bool isMenuOpen;

@property bool isKilled0;
@property bool isKilled1;
@property bool isKilled2;
@property bool isKilled3;
@property bool isKilled4;
@property bool isKilled5;
@property bool isKilled6;
@property bool isKilled7;
@property bool isKilled8;

@property bool isBirth0;
@property bool isBirth1;
@property bool isBirth2;
@property bool isBirth3;
@property bool isBirth4;
@property bool isBirth5;
@property bool isBirth6;
@property bool isBirth7;
@property bool isBirth8;
@property (nonatomic,retain) UIBarButtonItem * barButton;
@property (nonatomic,retain) UIBarButtonItem * barMenu;
@property (nonatomic,retain) UILabel * label;
@property (nonatomic,retain) MenuViewController * menuViewController;

-(IBAction) barMenuClicked:(id)sender;

@end
