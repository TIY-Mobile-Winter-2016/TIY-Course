


@import Foundation;

@interface APLTimeZoneWrapper : NSObject

@property (nonatomic, copy) NSString *localeName;
@property (nonatomic) NSTimeZone *timeZone;

- (instancetype)initWithTimeZone:(NSTimeZone *)aTimeZone nameComponents:(NSArray *)nameComponents;

@end
