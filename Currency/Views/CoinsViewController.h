//
//  CoinsViewController.h
//  Currency
//
//  Created by Miguel Solans on 09/11/2020.
//

#import <UIKit/UIKit.h>
#import "CoinTableViewCell.h"
#import "CoinsViewModel.h"
#import "CalculatorViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CoinsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) CoinsViewModel *coinViewModel;
@property (weak, nonatomic) IBOutlet UITableView *coinTableView;
@property (assign, nonatomic) NSInteger index;

@end

NS_ASSUME_NONNULL_END
