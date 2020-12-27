//
//  CalculatorViewModel.m
//  Currency
//
//  Created by Miguel Solans on 09/11/2020.
//

#import "CalculatorViewModel.h"

@implementation CalculatorViewModel

- (instancetype)initWithRate:(CoinModel *)rate {
    self = [super init];
    
    if(self != nil) {
        self.rateInfo = rate;
    }
    return self;
}


//    De euro para outra moeda
//  euro x moeda
//    o contrário divide-se
- (NSNumber*) fromSource: (double) source {
    double rateNumber = [self.rateInfo.rateNumber doubleValue];
    return [NSNumber numberWithDouble: (source * rateNumber)];
}

- (NSNumber*) fromForeign: (double) foreign {
    double rateNumber = [self.rateInfo.rateNumber doubleValue];
    
    return [NSNumber numberWithDouble: (foreign / rateNumber)];
}


@end
