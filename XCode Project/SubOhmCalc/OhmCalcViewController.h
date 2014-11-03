//
//  OhmCalcViewController.h
//  Vape Tool
//
//  Created by Fliegl on 03.11.14.
//  Copyright (c) 2014 Johannes Dürr. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface OhmCalcViewController : NSViewController{
    
    float ohm;
    float voltage;
    float ampere;
    float wattage;
    
}


@property (weak) IBOutlet NSSlider *ohmSlider;
@property (weak) IBOutlet NSSlider *voltageSlider;

@property (weak) IBOutlet NSTextField *ohmLabel;
@property (weak) IBOutlet NSTextField *voltageLabel;
@property (weak) IBOutlet NSTextField *ampereLabel;
@property (weak) IBOutlet NSTextField *wattLabel;




- (IBAction)ohmSliderDidChange:(id)sender;
- (IBAction)voltageSliderDidChange:(id)sender;

@end
