//
//  LiquidCalcViewController.h
//  SubOhmCalc
//
//  Created by Fliegl on 03.11.14.
//  Copyright (c) 2014 Johannes Dürr. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface LiquidCalcViewController : NSViewController{
    
    float water, glycerin, propyl, arom1, arom2, arom3, overallAroma, overallAmount;
    
}


@property (weak) IBOutlet NSSlider *amountSlider;
@property (weak) IBOutlet NSSlider *propylSlider;
@property (weak) IBOutlet NSSlider *glycerinSlider;
@property (weak) IBOutlet NSSlider *waterSlider;
@property (weak) IBOutlet NSSlider *overallAromaSlider;

@property (weak) IBOutlet NSTextField *overallLabel;
@property (weak) IBOutlet NSTextField *labelGlycerin_ml;
@property (weak) IBOutlet NSTextField *labelPropyl_ml;
@property (weak) IBOutlet NSTextField *labelWater_ml;
@property (weak) IBOutlet NSTextField *label_overallAroma_ml;

@property (weak) IBOutlet NSTextField *labelGlycerin_percentage;
@property (weak) IBOutlet NSTextField *labelPropyl_percentage;
@property (weak) IBOutlet NSTextField *labelWater_percentage;
@property (weak) IBOutlet NSTextField *labelOverallAroma_percentage;


- (IBAction)amountSliderChanged:(id)sender;
- (IBAction)propylSliderChanged:(id)sender;
- (IBAction)glycerinSliderChanged:(id)sender;
- (IBAction)waterSliderChanged:(id)sender;
- (IBAction)overallAromaSliderChanged:(id)sender;
- (IBAction)arom1SliderChanged:(id)sender;
- (IBAction)arom2SliderChanged:(id)sender;
- (IBAction)arom3SliderChanged:(id)sender;




@end
