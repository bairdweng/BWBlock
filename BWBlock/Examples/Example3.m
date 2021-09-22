//
//  Example3.m
//  BWBlock
//
//  Created by bairdweng on 2021/9/8.
//  局部变量是捕获进去的，所以即使在block执行之前改变了，里面读的还是之前的值

#import "Example3.h"


@interface Example3 ()

@end

@implementation Example3


- (void)start {
	NSString *text = @"默认值";
	NSLog(@"text1:%p %@",text,text);
	// 定义一个Block
	void (^testBlock)(void) = ^{
		NSLog(@"text2:%p %@",text,text);
	};
	text = @"改变值";
	testBlock();
	NSLog(@"text3:%p %@",text,text);
}
@end
