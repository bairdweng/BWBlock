//
//  ViewController.m
//  BWBlock
//
//  Created by bairdweng on 2021/8/27.
//

#import "ViewController.h"
#import "ExampleHeader.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, strong) NSArray *items;
@end

@implementation ViewController


- (void)viewDidLoad {
	[super viewDidLoad];
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"test_cell"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test_cell" forIndexPath:indexPath];
	cell.textLabel.text = self.items[indexPath.row];
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.items.count;
}

- (NSArray *)items {
	return @[
		@"1. __block的作用",
		@"2. 全局变量",
		@"3. 局部变量在block执行前改变",
		@"4. 静态变量",
		@"5. Block类型",
		@"6. MRC下Stack类型",
		@"7. block延迟对象的释放",
		@"8. block为什么使用Copy"
	];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	NSString *className = [NSString stringWithFormat:@"Example%ld",indexPath.row + 1];
	BaseExample *examp = (BaseExample *)[NSClassFromString(className) new];
	if (![examp isKindOfClass:[BaseExample class]]) {
		return;
	}
	[examp start];
}

@end
