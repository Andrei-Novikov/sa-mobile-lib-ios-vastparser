//
//  SAVASTExtension.h
//  Pods
//
//  Created by Andrei Novikau on 7/6/16.
//
//

#import <Foundation/Foundation.h>

#import "SAJsonParser.h"
#import "SAVASTTracking.h"

typedef enum SAVASTExtensionType {
    CustomTracking = 0
} SAVASTExtensionType;

@interface SAVASTExtension : SABaseObject <SADeserializationProtocol, SASerializationProtocol>

@property (nonatomic, assign) SAVASTExtensionType type;
@property (nonatomic, strong) NSMutableArray<SAVASTTracking*> *TrackingEvents;

// @brief: this function perfroms the sum of a Extension over the current Extension
- (void) sumExtension:(SAVASTExtension*)extension;

@end
