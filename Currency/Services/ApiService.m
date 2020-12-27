//
//  ApiService.m
//  Currency
//
//  Created by Miguel Solans on 09/11/2020.
//

#import "ApiService.h"
// #import "AFNetworking.h"
#import <AFNetworking/AFNetworking.h>


@implementation ApiService

- (void)get:(NSString *)path handler:(void (^)(NSDictionary *response, NSError *error)) block {
    
    NSURL *url = [NSURL URLWithString:path];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    
    NSURLSessionTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if(error) {
            NSLog(@"!!! Error Fetching !!!");
            block(nil, responseObject);
            
        } else {
            NSLog(@"API Response /200. Passing data...");
            NSDictionary *responseDict = (NSDictionary*)responseObject;
            
            block(responseDict, nil);
        }
    }];
    
    [dataTask resume];
    
}
@end
