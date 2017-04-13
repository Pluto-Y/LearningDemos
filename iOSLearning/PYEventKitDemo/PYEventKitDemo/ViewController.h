//
//  ViewController.h
//  PYEventKitDemo
//
//  Created by Pluto-Y on 13/04/2017.
//  Copyright © 2017 Pluto-y. All rights reserved.
//

#import <UIKit/UIKit.h>
@import EventKit;

@interface ViewController : UITableViewController

// The database with calendar events and reminders
@property (strong, nonatomic) EKEventStore *eventStore;

// Indicates whether app has access to event store.
@property (nonatomic) BOOL isAccessToEventStoreGranted;

// The data source for the table view
@property (strong, nonatomic) NSMutableArray *todoItems;

@end

