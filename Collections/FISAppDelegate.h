//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 
 * Declare your methods here.
 
 */

-(NSArray *)arrayBySortingArrayAscending: (NSArray *)theArray;

-(NSArray *)arrayBySortingArrayDescending: (NSArray *)theArray;

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray: (NSArray *)theArray;

-(NSArray *)arrayByReversingArray: (NSArray *)theArray;

-(NSString *)stringInBasicLeetFromString: (NSString *)theString;

-(NSArray *)splitArrayIntoNegativesAndPositives: (NSArray *)theArray;

-(NSArray *)namesOfHobbitsInDictionary: (NSDictionary *)theDictionary;

-(NSArray *)stringsBeginningWithAInArray: (NSArray *)theArray;

-(NSInteger)sumOfIntegersInArray: (NSArray *)theArray;

-(NSArray *)arrayByPluralizingStringsInArray: (NSArray *)theArray;

-(NSDictionary *)countsOfWordsInString: (NSString *)theString;

-(NSDictionary *)songsGroupedByArtistFromArray: (NSArray *)theArray;









@end
