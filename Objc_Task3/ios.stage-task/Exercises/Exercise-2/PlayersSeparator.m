#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    NSInteger counter = 0;
    
    if (nil == ratingArray || ratingArray.count < 3) {
        return counter;
    }
    
    for (int i = 0; i < [ratingArray count] - 2; i++) {
        for (int j = i; j < [ratingArray count] - 1; j++) {
            for (int k = j; k < [ratingArray count]; k++) {
                if ((ratingArray[i].doubleValue < ratingArray[j].doubleValue &&
                     ratingArray[j].doubleValue < ratingArray[k].doubleValue) ||
                    (ratingArray[i].doubleValue > ratingArray[j].doubleValue &&
                     ratingArray[j].doubleValue > ratingArray[k].doubleValue)) {
                    counter += 1;
                }
            }
        }
    }
    return counter;
}

@end
