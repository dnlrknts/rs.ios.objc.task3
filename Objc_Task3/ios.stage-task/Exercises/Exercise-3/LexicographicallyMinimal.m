#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *result = [NSMutableString new];
    NSRange charAt0 = NSMakeRange(0, 1);
    while (string1.length > 0 || string2.length > 0) {
        if (string1.length == 0) {
            [result appendString:string2];
            break;
        }
        else if (string2.length == 0) {
            [result appendString:string1];
            break;
        }
        
        NSString *firstCharString1 = [string1 substringWithRange:charAt0];
        NSString *firstCharString2 = [string2 substringWithRange:charAt0];
        NSComparisonResult compareChars = [firstCharString1 compare:firstCharString2];
        if (compareChars == NSOrderedAscending || compareChars == NSOrderedSame) {
            [result appendString:firstCharString1];
            string1 = [string1 substringFromIndex:1];
        }
        else {
            [result appendString:firstCharString2];
            string2 = [string2 substringFromIndex:1];
        }
    }
    return result;
}

@end
