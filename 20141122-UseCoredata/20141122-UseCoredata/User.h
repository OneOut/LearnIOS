//
//  User.h
//  20141122-UseCoredata
//
//  Created by 杜承玖 on 14/11/22.
//  Copyright (c) 2014年 redianying. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * age;

@end
