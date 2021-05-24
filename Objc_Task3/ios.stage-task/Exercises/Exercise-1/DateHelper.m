#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    NSDictionary *months = @{
        @1: @"January",
        @2: @"February",
        @3: @"March",
        @4: @"April",
        @5: @"May",
        @6: @"June",
        @7: @"July",
        @8: @"August",
        @9: @"September",
        @10: @"October",
        @11: @"November",
        @12: @"December"
    };
    return [months objectForKey:[NSNumber numberWithInteger:monthNumber]];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    NSDate *dateObj = [dateFormatter dateFromString:date];
    [dateFormatter setDateFormat:@"dd"];
    NSString *dayString = [dateFormatter stringFromDate:dateObj];
    return [dayString integerValue];    
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale: [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"]];
    [dateFormatter setDateFormat:@"E"];
    return [[dateFormatter stringFromDate:date] capitalizedString];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDateComponents *currentDate = [calender components:NSCalendarUnitWeekOfYear fromDate:[NSDate now]];
    NSDateComponents *givenDate = [calender components:NSCalendarUnitWeekOfYear fromDate:date];
    return [currentDate weekOfYear] == [givenDate weekOfYear];
}

@end
