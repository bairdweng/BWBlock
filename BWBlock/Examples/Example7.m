//
//  Example7.m
//  BWBlock
//
//  Created by bairdweng on 2021/9/8.
//

#import "Example7.h"


@interface HelloObject : NSObject

@end


@implementation HelloObject


- (void)dealloc {
	NSLog(@"HelloObject被释放了");
}
@end

typedef void (^TestBlock)(void);

@interface Example7 ()

@end

@implementation Example7

- (void)start {
	TestBlock block;
	{
		HelloObject *obj = [[HelloObject alloc]init];
		block = ^{
			NSLog(@"obj=========%@",obj);
		};
	}
	NSLog(@"block被销毁啦～～");
}
@end
