//
//  RootViewController.h
//  HelpProject
//
//  Created by 许波波 on 16/6/2.
//  Copyright © 2016年 许波波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController
@property ( strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property ( strong, nonatomic) NSManagedObjectModel * ObjectModel;
@property ( strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@end
