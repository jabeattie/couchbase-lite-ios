//
//  main.m
//  PerfTest
//
//  Created by Jens Alfke on 1/30/17.
//  Copyright © 2017 Couchbase. All rights reserved.
//

#import <CouchbaseLite/CouchbaseLite.h>
#import "TunesPerfTest.h"

#define kDatabaseName @"perfdb"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString* resourceDir = [@(argv[0]) stringByDeletingLastPathComponent];
        [PerfTest setResourceDirectory: resourceDir];
        NSLog(@"Reading resources from %@", resourceDir);

        CBLDatabaseOptions* options = [CBLDatabaseOptions defaultOptions];
        options.directory = [NSTemporaryDirectory() stringByAppendingPathComponent: @"CouchbaseLite"];

        NSLog(@"Starting test...");
        TunesPerfTest* test = [[TunesPerfTest alloc] initWithDatabaseOptions: options];
        [test run];
    }
    return 0;
}
