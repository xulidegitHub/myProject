//
//  ViewController.m
//  信号量
//
//  Created by OUT MAN on 2020/2/15.
//  Copyright © 2020 OUT MAN. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dispatchSiganl];
    // Do any additional setup after loading the view.
}

-(void)dispatchSiganl{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //任务1
      dispatch_async(quene, ^{
          dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
          NSLog(@"run task 1");
          sleep(4);
          NSLog(@"complete task 1");
          dispatch_semaphore_signal(semaphore);
      });
    //任务2
       dispatch_async(quene, ^{

           dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
           NSLog(@"run task 2");

           sleep(1);
           NSLog(@"complete task 2");
           dispatch_semaphore_signal(semaphore);
       });
    //任务3
    dispatch_async(quene, ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"run task 3");
        sleep(1);
        NSLog(@"complete task 3");
        dispatch_semaphore_signal(semaphore);
    });


}


@end
