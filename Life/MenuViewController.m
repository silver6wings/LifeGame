#import "MenuViewController.h"
#import "LifeViewController.h"

@implementation MenuViewController

@synthesize superViewController;

@synthesize killed0;
@synthesize killed1;
@synthesize killed2;
@synthesize killed3;
@synthesize killed4;
@synthesize killed5;
@synthesize killed6;
@synthesize killed7;
@synthesize killed8;

@synthesize birth0;
@synthesize birth1;
@synthesize birth2;
@synthesize birth3;
@synthesize birth4;
@synthesize birth5;
@synthesize birth6;
@synthesize birth7;
@synthesize birth8;

@synthesize sliderLabel;

-(void)refresh{
    if (self.superViewController.isKilled0) [killed0 setOn:YES];
    if (self.superViewController.isKilled1) [killed1 setOn:YES];
    if (self.superViewController.isKilled2) [killed2 setOn:YES];
    if (self.superViewController.isKilled3) [killed3 setOn:YES];
    if (self.superViewController.isKilled4) [killed4 setOn:YES];
    if (self.superViewController.isKilled5) [killed5 setOn:YES];
    if (self.superViewController.isKilled6) [killed6 setOn:YES];
    if (self.superViewController.isKilled7) [killed7 setOn:YES];
    if (self.superViewController.isKilled8) [killed8 setOn:YES];
    
    if (self.superViewController.isBirth0) [birth0 setOn:YES];
    if (self.superViewController.isBirth1) [birth1 setOn:YES];
    if (self.superViewController.isBirth2) [birth2 setOn:YES];
    if (self.superViewController.isBirth3) [birth3 setOn:YES];
    if (self.superViewController.isBirth4) [birth4 setOn:YES];
    if (self.superViewController.isBirth5) [birth5 setOn:YES];
    if (self.superViewController.isBirth6) [birth6 setOn:YES];
    if (self.superViewController.isBirth7) [birth7 setOn:YES];
    if (self.superViewController.isBirth8) [birth8 setOn:YES];
    
}

-(IBAction) sliderChanged:(id)sender{
    UISlider * slider = (UISlider *)sender;
    superViewController.evolveInterval = slider.value;
    
	int fps = (int)(slider.value * 1000);
	NSString * newText = [[NSString alloc] initWithFormat:@"更新间隔:%dms", fps];
	sliderLabel.text = newText;
}

-(IBAction) switchChanged:(id)sender{
    UISwitch * tempSwitch = (UISwitch *)sender;
    
    //Killed Swtiches
    switch (tempSwitch.tag) {
        case 1110: superViewController.isKilled0 = !superViewController.isKilled0; break;
        case 1111: superViewController.isKilled1 = !superViewController.isKilled1; break;
        case 1112: superViewController.isKilled2 = !superViewController.isKilled2; break;
        case 1113: superViewController.isKilled3 = !superViewController.isKilled3; break;
        case 1114: superViewController.isKilled4 = !superViewController.isKilled4; break;
        case 1115: superViewController.isKilled5 = !superViewController.isKilled5; break;
        case 1116: superViewController.isKilled6 = !superViewController.isKilled6; break;
        case 1117: superViewController.isKilled7 = !superViewController.isKilled7; break;
        case 1118: superViewController.isKilled8 = !superViewController.isKilled8; break;
            
        case 1120: superViewController.isBirth0 = !superViewController.isBirth0; break;
        case 1121: superViewController.isBirth1 = !superViewController.isBirth1; break;
        case 1122: superViewController.isBirth2 = !superViewController.isBirth2; break;
        case 1123: superViewController.isBirth3 = !superViewController.isBirth3; break;
        case 1124: superViewController.isBirth4 = !superViewController.isBirth4; break;
        case 1125: superViewController.isBirth5 = !superViewController.isBirth5; break;
        case 1126: superViewController.isBirth6 = !superViewController.isBirth6; break;
        case 1127: superViewController.isBirth7 = !superViewController.isBirth7; break;
        case 1128: superViewController.isBirth8 = !superViewController.isBirth8; break;
    }
}

//====== system ======
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {}
    return self;
}

- (void)dealloc{
    [super dealloc];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad{
    [self refresh];
    [super viewDidLoad];
}

- (void)viewDidUnload{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
