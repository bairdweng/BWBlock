//
//  Example4.m
//  BWBlock
//
//  Created by bairdweng on 2021/9/8.
//

#import "Example4.h"

@implementation Example4
- (void)start {
	static NSString *test = @"hello";
	NSLog(@"a1:%p %@",test,test);
	void (^block)(void) =  ^{
		NSLog(@"a2:%p %@",test,test);
	};
	test = @"hello2";
	block();
	NSLog(@"a3:%p %@",test,test);
}
@end
