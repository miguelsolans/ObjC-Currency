//
//  CalculatorViewModel.h
//  Currency
//
//  Created by Miguel Solans on 09/11/2020.
//

#import <Foundation/Foundation.h>
#import "CoinModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorViewModel : NSObject

@property (nonatomic, strong) CoinModel *rateInfo;


- (instancetype) initWithRate: (CoinModel*) rate;

- (NSNumber*) fromSource: (double) source;
- (NSNumber*) fromForeign: (double) foreign;

@end

NS_ASSUME_NONNULL_END
