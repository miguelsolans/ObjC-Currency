//
//  ApiService.h
//  Currency
//
//  Created by Miguel Solans on 09/11/2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ApiService : NSObject


- (void)get:(NSString*) url handler:(void (^)(NSDictionary* response, NSError* error)) block;

@end

NS_ASSUME_NONNULL_END
