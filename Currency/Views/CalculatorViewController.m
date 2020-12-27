//
//  CalculatorViewController.m
//  Currency
//
//  Created by Miguel Solans on 09/11/2020.
// 


#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@end

@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Loading Calculator");
    
    NSString *imageName = self.coinViewModel.rateInfo.rateId;
    [self.flagImageView setImage:[UIImage imageNamed:[imageName lowercaseString]]];
    
    [self setTitle:self.coinViewModel.rateInfo.rateName];
    
    [self defaultInit];
}

- (void) defaultInit {
    self.resultValueLabel.text = @"0.00";
    self.valueTextField.text = @"0.00";
    
    self.destionationIdLabel.text = [self.coinViewModel.rateInfo rateId];
    self.destionationDescriptionLabel.text = [self.coinViewModel.rateInfo rateName];
    
    self.sourceIdLabel.text = @"EUR";
    self.sourceDescriptionLabel.text = @"Euro";
    
    self.changed = NO;
}

- (void) switchInit {
    self.resultValueLabel.text = @"0.00";
    self.valueTextField.text = @"0.00";
    
    self.destionationIdLabel.text = @"EUR";
    self.destionationDescriptionLabel.text = @"Euro";
    
    self.sourceIdLabel.text = [self.coinViewModel.rateInfo rateId];
    self.sourceDescriptionLabel.text = [self.coinViewModel.rateInfo rateName];
    
    self.changed = YES;
}

- (IBAction)convertButton:(id)sender {
    double value = [self.valueTextField.text doubleValue];
    NSNumber *result = @0;
    
    if(self.changed) {
        result = [self.coinViewModel fromForeign:value];
    } else {
        result = [self.coinViewModel fromSource:value];
    }
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];

    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:2];
    [formatter setRoundingMode: NSNumberFormatterRoundUp];
    
    self.resultValueLabel.text = [formatter stringFromNumber:result];
}

- (IBAction)changeButton:(id)sender {
    
    if(!self.changed) {
        // Apply Change
        [self switchInit];
    } else {
        [self defaultInit];
    }
}
@end
