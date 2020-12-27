//
//  CoinsViewModel.m
//  Currency
//
//  Created by Miguel Solans on 09/11/2020.
//

#import "CoinsViewModel.h"

@implementation CoinsViewModel

- (instancetype) initViewModel {
    self = [super init];
    
    if(self != nil) {
        self.coinsArray = [[NSMutableArray alloc] init];
        self.api = [[ApiService alloc] init];
        [self getSymbols];
    }
    
    NSLog(@"View Model Initialized");
    
    return self;
}

- (void) getSymbols {
    
    NSLog(@"Get /Symbols");
    
    NSString *apiKey = [[NSProcessInfo processInfo] environment][@"api_key"];
    
    NSString *urlStr = [NSString stringWithFormat:@"http://data.fixer.io/api/symbols?access_key=%@", apiKey];
    NSLog(@"Fetching: %@", urlStr);
    
    [self.api get:urlStr handler:^(NSDictionary * _Nonnull response, NSError * _Nonnull error) {
        // If error
        if(error) {
            NSLog(@"Error Ocurred fetching data");
        } else {
            NSLog(@"Passed to ViewModel");
            
            NSDictionary *symbols = response[@"symbols"];
            
            for(id key in symbols) {
                CoinModel *coin = [[CoinModel alloc] init];
                coin.rateId = key;
                coin.rateName = symbols[key];
                
                [self.coinsArray addObject:coin];
            }
            
            [self getRates];
            
        }
    }];
    
}

- (void) getRates {
    NSLog(@"Get /Rates");
    
    NSString *apiKey = [[NSProcessInfo processInfo] environment][@"api_key"];
    
    NSString *urlStr = [NSString stringWithFormat:@"http://data.fixer.io/api/symbols?access_key=%@", apiKey];
    NSLog(@"Fetching: %@", urlStr);
    
    [self.api get:urlStr handler:^(NSDictionary * _Nonnull response, NSError * _Nonnull error) {
        // If error
        if(error) {
            NSLog(@"Error Ocurred fetching data");
        } else {
            NSLog(@"Passed to ViewModel");
            
            NSDictionary *rates = response[@"rates"];
            
            for(id key in rates) {
                
                for(CoinModel *coin in self.coinsArray) {
                    if([coin.rateId isEqualToString:key]) {
                        
                        coin.rateDate = response[@"date"];
                        coin.rateNumber = rates[key];
                    }
                    
                }
            }
            [[NSNotificationCenter defaultCenter] postNotificationName:@"dataReady" object:@{}];

        }
    }];
}

@end
