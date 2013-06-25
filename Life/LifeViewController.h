#import <UIKit/UIKit.h>

@interface LifeViewController : UIViewController {
    IBOutlet UIBarButtonItem * barButton;
    IBOutlet UILabel * label;
}

@property (nonatomic,retain) UIBarButtonItem * barButton;
@property (nonatomic,retain) UILabel * label;

-(IBAction) barButtonClick:(id)sender;

@end
