//
//  Example1.m
//  BWBlock
//
//  Created by bairdweng on 2021/9/8.
//

#import "Example1.h"
/*
   这里可以看到，如果想在block内部改变局部变量的值，需要加__block修饰。
 */
@implementation Example1

- (void)start {
	__block NSString *test = @"改变前";
	NSLog(@"test1:%p",test);
	// 定义一个Block
	void (^testBlock)(void) = ^{
		test = @"被改变了";
		NSLog(@"test2:%p",test);
	};
	testBlock();
	NSLog(@"test3:%p",test);
}

@end
