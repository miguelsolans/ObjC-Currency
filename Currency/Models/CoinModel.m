//
//  CoinModel.m
//  Currency
//
//  Created by Miguel Solans on 09/11/2020.
//

#import "CoinModel.h"

@implementation CoinModel


- (instancetype) initWithDictionary: (NSDictionary *) data {
    self = [super init];
    
    if(self != nil) {
        self.rateId = @"EUR";
        self.rateName = @"Euro";
        self.rateNumber = @1;
        self.rateDate = @"2020-11-09";
    }
    
    return self;
}

- (instancetype)initWithId:(NSString *)rateId rateName:(NSString *)rateName rateNumber:(NSNumber *)rateNumber rateDate:(NSString *)rateDate {
    self = [super init];
    
    if(self != nil) {
        self.rateId = rateId;
        self.rateName = rateName;
        self.rateNumber = rateNumber;
        self.rateDate = rateDate;
    }
    
    return self;
}

@end
