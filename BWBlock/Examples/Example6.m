//
//  Example6.m
//  BWBlock
//
//  Created by bairdweng on 2021/9/8.
//

#import "Example6.h"

@implementation Example6

- (void)start {
	auto int a = 10;
	void (^block1)(void) =  ^{
		NSLog(@"a = %d",a);
	};
	NSLog(@"%@",[[block1 class] copy]);
}

@end
