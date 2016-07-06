//
//  SAVASTExtension.m
//  Pods
//
//  Created by Andrei Novikau on 7/6/16.
//
//

#import "SAVASTExtension.h"

@implementation SAVASTExtension

- (id) init {
    if (self = [super init]) {
        
    }
    return self;
}

- (id) initWithJsonDictionary:(NSDictionary *)jsonDictionary {
    if (self = [super initWithJsonDictionary:jsonDictionary]) {
        _type = (SAVASTExtensionType)[[jsonDictionary safeObjectForKey:@"type"] integerValue];
        _TrackingEvents = [[[NSArray alloc] initWithJsonArray:[jsonDictionary safeObjectForKey:@"TrackingEvents"] andIterator:^id(id item) {
            return [[SAVASTTracking alloc] initWithJsonDictionary:(NSDictionary*)item];
        }] mutableCopy];
    }
    return self;
}

- (NSDictionary*) dictionaryRepresentation {
    return @{
             @"type": @(_type),
             @"TrackingEvents": [_TrackingEvents dictionaryRepresentation]
    };
}

- (void) sumExtension:(SAVASTExtension*)extension {
    // perform a "Sum" operation
    [_TrackingEvents addObjectsFromArray:extension.TrackingEvents];
}

@end
