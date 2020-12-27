//
//  CalculatorViewController.h
//  Currency
//
//  Created by Miguel Solans on 09/11/2020.
//

#import <UIKit/UIKit.h>
#import "CalculatorViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorViewController : UIViewController

@property (nonatomic, strong) CalculatorViewModel *coinViewModel;


// Source
@property (weak, nonatomic) IBOutlet UITextField *valueTextField;
@property (weak, nonatomic) IBOutlet UILabel *sourceDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceIdLabel;


// Destionation
@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;
@property (weak, nonatomic) IBOutlet UILabel *destionationDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *destionationIdLabel;


// Result
@property (weak, nonatomic) IBOutlet UILabel *resultValueLabel;

@property (nonatomic) BOOL changed;

- (IBAction)changeButton:(id)sender;
- (IBAction)convertButton:(id)sender;

@end

NS_ASSUME_NONNULL_END
