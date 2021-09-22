//
//  Example8.m
//  BWBlock
//
//  Created by bairdweng on 2021/9/10.
//

#import "Example8.h"

typedef void (^Example8PersonBlock)(NSString *text);

@interface Example8Person : NSObject

@property(nonatomic, copy) Example8PersonBlock strongPersonBlock;
- (void)call;

@end

@implementation Example8Person

- (instancetype)init {
	self = [super init];
	if (self) {

	}
	return self;
}

- (void)call {
	if (self.strongPersonBlock) {
		self.strongPersonBlock(@"hello");
	}
}

- (void)dealloc {
	NSLog(@"Example8Person被释放啦～～～");	
}

@end


@interface Example8 ()

@property(nonatomic, strong) Example8Person *person;
@property(nonatomic, strong) NSString *globalText;

@end

@implementation Example8

- (void)start {
	/*
	   1. 未访问外部变量的时候，都是GlobalBlock类型，无论使用weak，strong都相安无事。
	   2. 当访问外部的auto变量的时候，采用week声明的会变成__NSStackBlock__，野指针错误
	   3. copy声明的则变成了__NSMallocBlock__
	 */
	__weak typeof(self) weakSelf = self;
	self.person.strongPersonBlock = ^(NSString *text) {
		NSLog(@"strongCall:%@  %@",text, weakSelf.globalText);
	};
	NSLog(@"strongPersonBlock:%@",[self.person.strongPersonBlock class]);//__NSStackBlock__
}

- (Example8Person *)person {
	if (!_person) {
		_person = [Example8Person new];
	}
	return _person;
}

- (NSString *)globalText {
	return @"全局字符串";
}

@end
