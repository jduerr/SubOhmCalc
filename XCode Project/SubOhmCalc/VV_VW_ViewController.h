//
//  VV_VW_ViewController.h
//  SubOhmCalc
//
//  Created by Fliegl on 03.11.14.
//  Copyright (c) 2014 Johannes Dürr. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface VV_VW_ViewController : NSViewController{
    float voltage, resistance, wattage, power;
}

typedef enum changeType{
    wattageChanged = 1,
    voltageChanged,
    resistanceChanged
}changeType;

@property (weak) IBOutlet NSSlider *voltageSlider;
@property (weak) IBOutlet NSSlider *resistanceSlider;
@property (weak) IBOutlet NSSlider *wattageSlider;

@property (weak) IBOutlet NSTextField *voltageLabel;
@property (weak) IBOutlet NSTextField *wattageLabel;
@property (weak) IBOutlet NSTextField *resistanceLabel;


- (IBAction)voltageSliderDidChange:(NSSlider *)sender;
- (IBAction)resistanceSliderDidChange:(NSSlider *)sender;
- (IBAction)wattageSliderDidChange:(id)sender;












@end
