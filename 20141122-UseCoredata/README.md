#学习简单的CoreData的增删改查

1. 创建项目，在创建的时候注意将 Use Core data勾选上
2. 打开.xcdatamodeld文件，新建实体User,添加两个属性，name, age，全部是string类型
3. 创建NSManagedObject Subclass, 点击菜单Editor, 选择Create NSManagedObject Subclass
4. 打开ViewController.m，在这里写增删改查的代码，代码如下：

```Objective-C
#import "ViewController.h"
#import "User.h"
#import "AppDelegate.h"
#define kUserModelName @"User"
#define kUsername @"michaeldu"

@interface ViewController ()

@property (nonatomic, strong) AppDelegate * app;

@end

@implementation ViewController

- (void)viewDidLoad {
	    [super viewDidLoad];
		    
		_app = [UIApplication sharedApplication].delegate;
	
		[self addUser];
		[self findUsers];

		[self updateUser];
		[self findUsers];
			
		[self deleteUser];
		[self findUsers];
			
}

/**
 添加一个用户
  */
  - (void)addUser{
	      User * user = [NSEntityDescription insertNewObjectForEntityForName:kUserModelName inManagedObjectContext:_app.managedObjectContext];
		  user.name = kUsername;
		  user.age = @"24";
		  [_app saveContext];
  }

  /**
   查询所有的用户
    */
	- (void)findUsers{
		    NSFetchRequest * request = [[NSFetchRequest alloc] init];
			NSEntityDescription * userDescription = [NSEntityDescription entityForName:kUserModelName inManagedObjectContext:_app.managedObjectContext];
			[request setEntity:userDescription];
				
			NSArray *users = [_app.managedObjectContext executeFetchRequest:request error:nil];
			NSLog(@"users.count = %ld", users.count);
			for (User *user in users) {
				NSLog(@"user.name = %@ and age = %@", user.name, user.age);
			}
}

/**
修改用户
	  */
	  - (void)updateUser{
		      NSFetchRequest *request = [[NSFetchRequest alloc] init];
			  NSEntityDescription *userDescription = [NSEntityDescription entityForName:kUserModelName inManagedObjectContext:_app.managedObjectContext];
			  [request setEntity:userDescription];
				  
			  NSArray *users = [_app.managedObjectContext executeFetchRequest:request error:nil];
			  for (User *user in users) {
				  if ([user.name isEqualToString:kUsername]) {
						  user.age = @"23";
						  break;
				  }
			  }
			  [_app saveContext];
}

/**
删除一个用户
	    */
		- (void)deleteUser{
			    NSFetchRequest *request = [[NSFetchRequest alloc] init];
				NSEntityDescription *userDescription = [NSEntityDescription entityForName:kUserModelName inManagedObjectContext:_app.managedObjectContext];
				[request setEntity:userDescription];
					
				NSArray *users = [_app.managedObjectContext executeFetchRequest:request error:nil];
				for (User *user in users) {
					if ([user.name isEqualToString:kUsername]) {
							[_app.managedObjectContext deleteObject:user];
									break;
					}
				}
				[_app saveContext];
}
@end
```
