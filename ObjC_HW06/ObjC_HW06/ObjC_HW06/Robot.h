//
//  Robot.h
//  ObjC_HW06
//
//  Created by Admin on 24.09.2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Robot : NSObject

@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;
@property (nonatomic, copy) NSString *name;

- (instancetype)initWithX:(NSInteger)x y:(NSInteger)y name:(NSString *)name;
- (void)save;
+ (instancetype)load;

@end

NS_ASSUME_NONNULL_END
