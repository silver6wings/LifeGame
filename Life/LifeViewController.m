#import "Constant.h"
#import "LifeViewController.h"
#import "LifeView.h"
#import "MenuViewController.h"

@implementation LifeViewController

@synthesize evolveStyle;
@synthesize evolveInterval;
@synthesize isMenuOpen;

@synthesize isKilled0;
@synthesize isKilled1;
@synthesize isKilled2;
@synthesize isKilled3;
@synthesize isKilled4;
@synthesize isKilled5;
@synthesize isKilled6;
@synthesize isKilled7;
@synthesize isKilled8;

@synthesize isBirth0;
@synthesize isBirth1;
@synthesize isBirth2;
@synthesize isBirth3;
@synthesize isBirth4;
@synthesize isBirth5;
@synthesize isBirth6;
@synthesize isBirth7;
@synthesize isBirth8;

@synthesize barButton;
@synthesize barMenu;
@synthesize label;
@synthesize menuViewController;

-(IBAction) barMenuClicked:(id)sender{
    if (self.menuViewController == nil) {
        self.menuViewController = [[MenuViewController alloc]initWithNibName:@"MenuViewController" bundle:nil];
        menuViewController.superViewController = self;
    }
    
    if(isMenuOpen == NO){
        [menuViewController refresh];
        [self.view insertSubview:menuViewController.view atIndex:0];
        self.barMenu.title = @"Hide Menu";
        isMenuOpen = YES;
    }else{
        [menuViewController.view removeFromSuperview];
        self.barMenu.title = @"Show Menu";
        isMenuOpen = NO;
    }   
}

//====== system ======

- (void)dealloc{
    [menuViewController release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad{
    self.evolveStyle = silver2DPlane;
    self.evolveInterval = 0.05;
    self.isMenuOpen = NO;
    
    self.isKilled0 = YES;
    self.isKilled1 = YES;
    self.isKilled2 = NO;
    self.isKilled3 = NO;
    self.isKilled4 = YES;
    self.isKilled5 = YES;
    self.isKilled6 = YES;
    self.isKilled7 = YES;
    self.isKilled8 = YES;
    
    self.isBirth0 = NO;
    self.isBirth1 = NO;
    self.isBirth2 = NO;
    self.isBirth3 = YES;
    self.isBirth4 = NO;
    self.isBirth5 = NO;
    self.isBirth6 = NO;
    self.isBirth7 = NO;
    self.isBirth8 = NO;
    

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
