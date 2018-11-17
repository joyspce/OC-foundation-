//
//  ITTableViewController.m
//  好友列表
//
//  Created by jyz on 2018/11/17.
//

#import "ITTableViewController.h"
#import "ITGroup.h"
#import "ITFriends.h"
#import "ITTableViewCell.h"
@interface ITTableViewController ()
@property (nonatomic, strong) NSArray *groupArr;
@end

@implementation ITTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
// MARK: - Models Lazy Loading
- (NSArray *)groupArr {
    if (_groupArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@".plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *modelArr = [NSMutableArray array];
        for (NSDictionary *dictionary in arr) {
            ITGroup *model = [ITGroup groupWithDict:dictionary];
            [modelArr addObject:model];
        }
        _groupArr = modelArr;
    }
    return _groupArr;
}
// MARK: - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groupArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ITGroup *group = self.groupArr[section];
    return group.friends.count;
}
// MARK: - Table view delegate
- (ITTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ITGroup *group = self.groupArr[indexPath.section];
    ITFriends *friend = group.friends[indexPath.row];
    static NSString *ID = @"friendCell";
    ITTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ITTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.model = friend;
    return cell;
}
@end
