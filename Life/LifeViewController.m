#import "LifeViewController.h"
#import "LifeView.h"

@implementation LifeViewController

@synthesize barButton;

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
    [barButton setTitle:@"Go"];
    [super viewDidLoad];
}

- (void)viewDidUnload{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
