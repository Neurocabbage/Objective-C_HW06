//
//  Robot.m
//  ObjC_HW06
//
//  Created by Admin on 24.09.2023.
//

#import "Robot.h"

@implementation Robot

- (instancetype)initWithX:(NSInteger)x y:(NSInteger)y name:(NSString *)name {
    self = [super init];
    if (self) {
        _x = x;
        _y = y;
        _name = [name copy];
    }
    return self;
}

- (void)save {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSError *error = nil;
    NSData *robotData = [NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:YES error:&error];
    if (error) {
            NSLog(@"Ошибка при архивации объекта: %@", error);
            return;
        }
    [defaults setObject:robotData forKey:self.name];
    [defaults synchronize];
}

+ (instancetype)load {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *robotData = [defaults objectForKey:NSStringFromClass([self class])];

    NSError *error = nil;
    Robot *robot = [NSKeyedUnarchiver unarchivedObjectOfClass:[self class] fromData:robotData error:&error];
    if (error) {
        NSLog(@"Ошибка при распаковке объекта: %@", error);
        return nil;
    }
    return robot;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeInteger:self.x forKey:@"x"];
    [coder encodeInteger:self.y forKey:@"y"];
    [coder encodeObject:self.name forKey:@"name"];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        _x = [coder decodeIntegerForKey:@"x"];
        _y = [coder decodeIntegerForKey:@"y"];
        _name = [coder decodeObjectForKey:@"name"];
    }
    return self;
}

@end
