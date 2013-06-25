#import "LifeViewController.h"
#import "LifeView.h"

@implementation LifeViewController

@synthesize barButton;
@synthesize label;

-(IBAction) barButtonClick:(id)sender{
    LifeView * lfView = (LifeView *)[self view];
    [lfView barButtonClicked:self];
}

//====== system ======

- (void)dealloc{
    [super dealloc];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad{
    LifeView * tempView = (LifeView *)self.view;
    [tempView initSelfViewController:self];
    
    [super viewDidLoad];
}

- (void)viewDidUnload{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
