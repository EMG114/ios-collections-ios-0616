//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

/**
 
 * Define your methods here.
 
 */



-(NSArray *)arrayBySortingArrayAscending: (NSArray *)theArray{
    
   
    NSSortDescriptor *sortByNilAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending: YES];
    
    theArray =[theArray sortedArrayUsingDescriptors: @[sortByNilAsc]];
    NSLog(@"%@", theArray);
   
    return theArray;
    

}

-(NSArray *)arrayBySortingArrayDescending: (NSArray *)theArray{
    
    
    
    NSSortDescriptor *sortByNilAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending: NO];
    
    theArray =[theArray sortedArrayUsingDescriptors: @[sortByNilAsc]];
    NSLog(@"%@", theArray);
    
    return theArray;
    
}

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray: (NSArray *)theArray {
    
    NSMutableArray *swapArray = [theArray mutableCopy];
    [swapArray exchangeObjectAtIndex: 0 withObjectAtIndex:swapArray.count -1];
    return swapArray;
}
    


-(NSArray *)arrayByReversingArray: (NSArray *)theArray {
    NSArray *reverseArray = [[theArray reverseObjectEnumerator] allObjects];
    return reverseArray;
}


-(NSString *)stringInBasicLeetFromString: (NSString *)theString{
    
    NSMutableString *mutString = [[NSMutableString alloc] init];
    NSDictionary *leet = @{
                           @"a" : @"4",
                           @"s" : @"5",
                           @"i" : @"1",
                           @"l" : @"1",
                           @"e" : @"3",
                           @"t" : @"7"
                           };
    for (NSUInteger i = 0; i < theString.length; i++)
    {
        NSString *character = [NSString stringWithFormat:@"%c",[theString characterAtIndex:i]];
        
        if ([[leet allKeys] containsObject:character])
        {
            [mutString appendString:leet[character]];
        }
        else
        {
            [mutString appendString:character];
        }
        
    }
    return mutString;

}

-(NSArray *)splitArrayIntoNegativesAndPositives: (NSArray *)theArray{
    NSMutableArray *split = [[NSMutableArray alloc] init];
    NSPredicate *positives = [NSPredicate predicateWithFormat: @"self >= 0"];
    NSPredicate *negatives = [NSPredicate predicateWithFormat: @"self < 0"];
    [split addObject:[theArray filteredArrayUsingPredicate:negatives]];
    [split addObject:[theArray filteredArrayUsingPredicate:positives]];
    
    return split;
}

-(NSArray *)namesOfHobbitsInDictionary: (NSDictionary *)theDictionary{
    
    NSMutableArray *hobbits = [[NSMutableArray alloc] init];
    
    for (NSString *key in theDictionary)
    {
        if ([theDictionary[key] isEqualToString:@"hobbit"])
        {
            [hobbits addObject:key];
        }
    }
    
    return [NSArray arrayWithArray:hobbits];

}

-(NSArray *)stringsBeginningWithAInArray: (NSArray *)theArray{
    
    NSPredicate *beginsWithAPredicate = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
    NSArray *beginsWithA = [theArray filteredArrayUsingPredicate:beginsWithAPredicate];
    
    return beginsWithA;
}

-(NSInteger)sumOfIntegersInArray: (NSArray *)theArray{
    
    NSInteger sum = 0;
    
    for (NSNumber *total in theArray)
    {
        sum += [total integerValue];
    }
    
    return sum;
    
}

- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)theArray {
   
    NSMutableArray *plurals = [[NSMutableArray alloc] init];
    for (NSString *string in theArray) {
        if ([string hasSuffix:@"nd"] || [string hasSuffix:@"ee"] || [string hasSuffix:@"le"]) {
            [plurals addObject:[string stringByAppendingString:@"s"]];
        } else if ([string hasSuffix:@"oot"]) {
            [plurals addObject:[string stringByReplacingOccurrencesOfString:@"oot" withString:@"eet"]];
        } else if ([string hasSuffix:@"us"]){
            [plurals addObject:[string stringByReplacingOccurrencesOfString:@"us" withString:@"i"]];
        } else if ([string hasSuffix:@"um"]){
            [plurals addObject:[string stringByReplacingOccurrencesOfString:@"um" withString:@"a"]];
        } else if ([string hasSuffix:@"box"]){
            [plurals addObject:[string stringByAppendingString:@"es"]];
        } else {
            [plurals addObject:[string stringByAppendingString:@"en"]];
        }
    }
    return plurals;
}

- (NSDictionary *)countsOfWordsInString:(NSString *)theString {
   
    NSArray *punctuation = @[@".", @",", @"-", @";"];
    for (NSUInteger i = 0; i < [punctuation count]; i++) {
        theString =[theString stringByReplacingOccurrencesOfString:punctuation[i] withString:@""];
    }
    theString =[theString lowercaseString];
    NSArray *stringAsArray = [theString componentsSeparatedByString:@" "];
    
 
    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] init];
    for (NSString *word in stringAsArray) {
        if ([myDictionary objectForKey:word] == nil) {
            myDictionary[word] = @(1);
        } else {
            NSUInteger intHowManyTimesISeeYou = [myDictionary[word] integerValue];
            intHowManyTimesISeeYou++;
            myDictionary[word] = @(intHowManyTimesISeeYou);
        }
        

    }
    return myDictionary;
}

- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)theArray {
    
    NSMutableDictionary *artistAndSongsDictionary = [[NSMutableDictionary alloc] init];
    for (NSString *atristSongPeer in theArray) {
        NSArray *currentAtristSongPeer = [atristSongPeer componentsSeparatedByString:@" - "];
        NSString *key = currentAtristSongPeer[0];
        NSString *value = currentAtristSongPeer[1];
        if (artistAndSongsDictionary[key] == nil) {
            artistAndSongsDictionary[key] = [NSMutableArray arrayWithObjects:value, nil];
        } else {
            [artistAndSongsDictionary[key] addObject:value];
        }
    }
    for (NSString *artist in [artistAndSongsDictionary allKeys]) {
        NSSortDescriptor *lowestToHighest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
        artistAndSongsDictionary[artist] = [artistAndSongsDictionary[artist] sortedArrayUsingDescriptors:@[lowestToHighest]];
    }
    NSLog(@"%@", artistAndSongsDictionary);
    return artistAndSongsDictionary;
}


@end
