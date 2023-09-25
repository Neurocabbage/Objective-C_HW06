//
//  ViewController.m
//  ObjC_HW06
//
//  Created by Admin on 24.09.2023.
//

#import "ViewController.h"
#import "Robot.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Создаем робот
    Robot *robot = [[Robot alloc] initWithX:10 y:20 name:@"Robot1"];
    
    // Сохраняем робот в UserDefaults
    [robot save];
    
    // Загружаем робот из UserDefaults
    Robot *loadedRobot = [Robot load];
    
    // Отображаем информацию о роботе в TextView
    self.textView.text = [NSString stringWithFormat:@"Name: %@\nCoordinates: (%ld, %ld)", loadedRobot.name, (long)loadedRobot.x, (long)loadedRobot.y];
}


@end
