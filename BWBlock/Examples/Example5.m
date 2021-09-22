//
//  Example5.m
//  BWBlock
//
//  Created by bairdweng on 2021/9/8.
//

#import "Example5.h"

@implementation Example5

- (void)start {
	[self globalBlock];
	[self mallocBlock];
	[self setCopyBlock];
}

- (void)globalBlock {
	// 全局类型
	void (^block)(void) =  ^{
		NSLog(@"123");
	};
	NSLog(@"block:%@",[block class]);
}

- (void)mallocBlock {
	// 堆类型
	int a = 10;
	void (^block)(void) =  ^{
		NSLog(@"====%d",a);
	};
	NSLog(@"block:%@",[block class]);
}

- (void)setCopyBlock {
	auto int a = 10;
	void (^block1)(void) =  ^{
		NSLog(@"a = %d",a);
	};
	NSLog(@"%@",[[block1 class] copy]);
}

@end
