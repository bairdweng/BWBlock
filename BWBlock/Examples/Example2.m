//
//  Example2.m
//  BWBlock
//
//  Created by bairdweng on 2021/9/8.
//
/*
   全局变量是指针传递，所以可以直接对内存里面的值进行改变
 */

#import "Example2.h"

@interface Example2 ()

@property(nonatomic, copy) NSString *text;

@end

@implementation Example2

- (instancetype)init {
	self = [super init];
	if (self) {
		self.text = @"我是改变之前的文字";
	}
	return self;
}

- (void)start {
	NSLog(@"test1:%p %@",self.text,self.text);
	// 定义一个Block
	void (^testBlock)(void) = ^{
		self.text = @"我被改变啦我被改变啦我被改变啦";
		NSLog(@"test3:%p %@",self.text,self.text);
	};
	testBlock();
	NSLog(@"test2:%p %@",self.text,self.text);
}
@end
