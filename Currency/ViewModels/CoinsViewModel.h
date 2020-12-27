//
//  CoinsViewModel.h
//  Currency
//
//  Created by Miguel Solans on 09/11/2020.
//

#import <Foundation/Foundation.h>
#import "CoinModel.h"
#import "ApiService.h"


NS_ASSUME_NONNULL_BEGIN

@interface CoinsViewModel : NSObject
@property (nonatomic, strong) NSMutableArray *coinsArray;
@property (nonatomic, strong) ApiService *api;

- (instancetype) initViewModel;

- (void) getSymbols;
- (void) getRates;
@end

NS_ASSUME_NONNULL_END
