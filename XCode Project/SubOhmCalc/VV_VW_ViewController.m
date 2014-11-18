//
//  VV_VW_ViewController.m
//  SubOhmCalc
//
//  Created by Fliegl on 03.11.14.
//  Copyright (c) 2014 Johannes Dürr. All rights reserved.
//

#import "VV_VW_ViewController.h"

@interface VV_VW_ViewController ()

@end

@implementation VV_VW_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    // set initial values...
    resistance = 1.5;
    voltage = 4.2;
    power = voltage / resistance; // R = V / I
    wattage = (voltage * voltage) / resistance;
    
    [self updateSlidersAndLabels];
}

- (IBAction)voltageSliderDidChange:(NSSlider *)sender {
    voltage = self.voltageSlider.floatValue;
    
    [self calculateValues:voltageChanged];
}

- (IBAction)resistanceSliderDidChange:(NSSlider *)sender {
    resistance = self.resistanceSlider.floatValue / 10;
    
    [self calculateValues:resistanceChanged];
}

- (IBAction)wattageSliderDidChange:(id)sender {
    
    wattage = self.wattageSlider.floatValue;
    
    [self calculateValues:wattageChanged];
}

-(void)calculateValues:(changeType)typeOfChange{
    
    switch (typeOfChange) {
        case voltageChanged:
            // calculate
            wattage = (voltage * voltage) / resistance;
            power = wattage / voltage;
            [self updateSlidersAndLabels];
            
            break;
            
        case resistanceChanged:
            // calculate
            wattage = (voltage * voltage) / resistance;
            voltage = wattage / power;
            [self updateSlidersAndLabels];
            
            break;
            
        case wattageChanged:
            // calculate
            voltage = wattage / power;
            [self updateSlidersAndLabels];
            
            break;
            
        default:
            break;
    }
}

-(void)updateSlidersAndLabels{
    
    self.wattageLabel.stringValue = [NSString stringWithFormat:@"%.2f W", wattage];
    self.voltageLabel.stringValue = [NSString stringWithFormat:@"%.2f V", voltage];
    self.resistanceLabel.stringValue = [NSString stringWithFormat:@"%.2f Ω", resistance];
    
    [self.wattageSlider setFloatValue:wattage];
    [self.voltageSlider setFloatValue:voltage];
    [self.resistanceSlider setFloatValue:resistance *10];
}
@end
