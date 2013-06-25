#import <UIKit/UIKit.h>

@interface LifeViewController : UIViewController {
    IBOutlet UIBarButtonItem * barButton;
}

@property (nonatomic,retain) UIBarButtonItem * barButton;

-(IBAction) barButtonClick:(id)sender;

@end
