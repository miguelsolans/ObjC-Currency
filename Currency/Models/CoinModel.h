//
//  CoinModel.h
//  Currency
//
//  Created by Miguel Solans on 09/11/2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CoinModel : NSObject

@property (nonatomic, strong) NSString *rateId;
@property (nonatomic, strong) NSString *rateName;
@property (nonatomic, strong) NSNumber *rateNumber;
@property (nonatomic, strong) NSString *rateDate;


- (instancetype) initWithId: (NSString*)rateId rateName: (NSString*) rateName rateNumber: (NSNumber *) rateNumber rateDate: (NSString *) rateDate;

- (instancetype) initWithDictionary: (NSDictionary *) data;

@end

NS_ASSUME_NONNULL_END
