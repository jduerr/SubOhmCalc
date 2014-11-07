//
//  LiquidCalcViewController.m
//  SubOhmCalc
//
//  Created by Fliegl on 03.11.14.
//  Copyright (c) 2014 Johannes Dürr. All rights reserved.
//

#import "LiquidCalcViewController.h"

@interface LiquidCalcViewController ()

@end

@implementation LiquidCalcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    overallAmount = 0;
    overallAroma = 0;
    water = 0;
    propyl = 0;
    glycerin = 0;
    
    
    [self.amountSlider setFloatValue:overallAmount];
    [self.overallAromaSlider setFloatValue:overallAroma];
    [self.glycerinSlider setFloatValue:glycerin];
    [self.waterSlider setFloatValue:water];
    [self.propylSlider setFloatValue:propyl];
    
    
    
    
}

- (IBAction)amountSliderChanged:(id)sender {
    
    [self setNewValues];
    [self fillUpRest];
    [self calculateBaseLiquid];
    
}

- (IBAction)propylSliderChanged:(id)sender {
    while (![self checkIfAmountPossible]) {
        if (self.glycerinSlider.integerValue > 0) {
            [self.glycerinSlider setIntegerValue:self.glycerinSlider.integerValue-1];
        }
        if (self.waterSlider.integerValue > 0) {
            [self.waterSlider setIntegerValue:self.waterSlider.integerValue-1];
        }
    }
    [self setNewValues];
}

- (IBAction)glycerinSliderChanged:(id)sender {
    while (![self checkIfAmountPossible]) {
        if (self.propylSlider.integerValue > 0) {
            [self.propylSlider setIntegerValue:self.propylSlider.integerValue-1];
        }
        if (self.waterSlider.integerValue > 0) {
            [self.waterSlider setIntegerValue:self.waterSlider.integerValue-1];
        }
    }
    [self setNewValues];
}

- (IBAction)waterSliderChanged:(id)sender {
    while (![self checkIfAmountPossible]) {
        if (self.glycerinSlider.integerValue > 0) {
            [self.glycerinSlider setIntegerValue:self.glycerinSlider.integerValue-1];
        }
        if (self.propylSlider.integerValue > 0) {
            [self.propylSlider setIntegerValue:self.propylSlider.integerValue-1];
        }
    }
    [self setNewValues];
}

- (IBAction)overallAromaSliderChanged:(id)sender {
    while (![self checkIfAmountPossible]) {
        if (self.glycerinSlider.integerValue > 0) {
            [self.glycerinSlider setIntegerValue:self.glycerinSlider.integerValue-1];
        }
        if (self.waterSlider.integerValue > 0) {
            [self.waterSlider setIntegerValue:self.waterSlider.integerValue-1];
        }
        if (self.propylSlider.integerValue > 0) {
            [self.propylSlider setIntegerValue:self.propylSlider.integerValue-1];
        }
    }
    [self setNewValues];
}

- (IBAction)arom1SliderChanged:(id)sender {
}

- (IBAction)arom2SliderChanged:(id)sender {
}

- (IBAction)arom3SliderChanged:(id)sender {
}


-(void)calculateBaseLiquid{
    
    overallAmount = self.amountSlider.floatValue;  // 100 % !
    
    glycerin = overallAmount / 100 * self.glycerinSlider.floatValue;
    propyl = overallAmount / 100 * self.propylSlider.floatValue;
    water = overallAmount /100 * self.waterSlider.floatValue;
    overallAroma = overallAmount / 100 * self.overallAromaSlider.floatValue;
    
    // update the labels!
    self.overallLabel.stringValue = [NSString stringWithFormat:@"%.2f ml",overallAmount];
    self.labelGlycerin_ml.stringValue = [NSString stringWithFormat:@"%.2f ml",glycerin];
    self.labelWater_ml.stringValue = [NSString stringWithFormat:@"%.2f ml",water];
    self.labelPropyl_ml.stringValue = [NSString stringWithFormat:@"%.2f ml",propyl];
    self.label_overallAroma_ml.stringValue = [NSString stringWithFormat:@"%.2f ml",overallAroma];
    
    self.labelGlycerin_percentage.stringValue = [NSString stringWithFormat:@"%.0i %%",self.glycerinSlider.intValue];
    self.labelPropyl_percentage.stringValue = [NSString stringWithFormat:@"%.0i %%",self.propylSlider.intValue];
    self.labelWater_percentage.stringValue = [NSString stringWithFormat:@"%.0i %%",self.waterSlider.intValue];
    self.labelOverallAroma_percentage.stringValue = [NSString stringWithFormat:@"%.0i %%",self.overallAromaSlider.intValue];
}


-(BOOL)checkIfAmountPossible{
    BOOL rVal = FALSE;
    
    if ((self.propylSlider.integerValue + self.glycerinSlider.integerValue + self.waterSlider.integerValue + self.overallAromaSlider.integerValue) <= 100) {
        rVal = TRUE;
    }
    return rVal;
}

-(void)checkAmounts{
    if ((self.propylSlider.integerValue + self.glycerinSlider.integerValue + self.waterSlider.integerValue + self.overallAromaSlider.integerValue) == 100) {
        NSLog(@"\n100 Prozent\n");
    }
}

-(void)setNewValues{
    
    overallAroma = self.overallAromaSlider.floatValue;
    water = self.waterSlider.floatValue;
    propyl = self.propylSlider.floatValue;
    glycerin = self.glycerinSlider.floatValue;
    
    while ((self.propylSlider.integerValue + self.glycerinSlider.integerValue + self.waterSlider.integerValue + self.overallAromaSlider.integerValue) < 100) {
        [self fillUpRest];
    }
    
}

-(void)fillUpRest{
    if ((self.propylSlider.integerValue + self.glycerinSlider.integerValue + self.waterSlider.integerValue + self.overallAromaSlider.integerValue) < 100) {
        
        static uint8_t fillUpCounter = 0;
        
        switch (fillUpCounter) {
            case 0:
                [self.glycerinSlider setIntegerValue:self.glycerinSlider.integerValue +1];
                fillUpCounter = 1;
                break;
            case 1:
                [self.waterSlider setIntegerValue:self.waterSlider.integerValue +1];
                fillUpCounter = 2;
                break;
            case 2:
                [self.propylSlider setIntegerValue:self.propylSlider.integerValue +1];
                fillUpCounter = 0;
                break;
                
            default:
                break;
        }
        
    }
    [self calculateBaseLiquid];
}






@end






























