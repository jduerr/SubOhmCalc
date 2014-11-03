//
//  OhmCalcViewController.m
//  Vape Tool
//
//  Created by Fliegl on 03.11.14.
//  Copyright (c) 2014 Johannes Dürr. All rights reserved.
//

#import "OhmCalcViewController.h"

@implementation NSView (HS)

-(instancetype)insertVibrancyViewBlendingMode:(NSVisualEffectBlendingMode)mode
{
    Class vibrantClass=NSClassFromString(@"NSVisualEffectView");
    if (vibrantClass)
    {
        NSVisualEffectView *vibrant=[[vibrantClass alloc] initWithFrame:self.bounds];
        [vibrant setAutoresizingMask:NSViewWidthSizable|NSViewHeightSizable];
        [vibrant setBlendingMode:mode];
        [self addSubview:vibrant positioned:NSWindowBelow relativeTo:nil];
        
        return vibrant;
    }
    
    return nil;
}

@end

@interface OhmCalcViewController ()

@end

@implementation OhmCalcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    [self setTitle:@"Ohm Calculator"];
    
    ohm = .5;
    voltage = 4.2;
    ampere = 0;
    wattage = 0;
    
    [self.voltageSlider setFloatValue:voltage];
    [self.ohmSlider setFloatValue:ohm];
    
    
    
    [self calculate];
    
    
}

- (IBAction)ohmSliderDidChange:(id)sender {
    NSLog(@"ohm did change\n");
    ohm = [(NSSlider*)sender floatValue];
    

    [self calculate];
    
    
}

- (IBAction)voltageSliderDidChange:(id)sender {
    NSLog(@"voltage did change\n");
    voltage = [(NSSlider*)sender floatValue];
    

    [self calculate];
}


- (void)calculate{
    
    wattage = voltage * voltage / ohm;
    self.wattLabel.stringValue = [NSString stringWithFormat:@"%.2f Watts",wattage];
    
    ampere = wattage / voltage;
    self.ampereLabel.stringValue =[NSString stringWithFormat:@"%.2f Ampere",ampere];
    
    
    self.ohmLabel.stringValue = [NSString stringWithFormat:@"%.2f Ohms",ohm ];
    self.voltageLabel.stringValue = [NSString stringWithFormat:@"%.2f Volts",voltage ];
    
}


@end
