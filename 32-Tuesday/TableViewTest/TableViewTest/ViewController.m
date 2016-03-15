//
//  ViewController.m
//  TableViewTest
//
//  Created by Phil Wright on 3/15/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *namesArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUI)
                                                 name:@"GotData"
                                               object:nil];
    
    self.namesArray = [[NSMutableArray alloc] init];
    
    
    // 1
    NSString *urlString = @"https://api.spotify.com/v1/search?q=dokken&type=artist";
    
    // 2 Make it from string to NSURL
    NSURL *url = [NSURL URLWithString:urlString];
    
    // 3 (notice the url property we are sending)
    NSURLSessionDataTask *task = [[NSURLSession sharedSession]
                                  dataTaskWithURL:url
                                  completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                      
                                      // 4: Handle response here
                                      
                                      NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                                      
                                      //NSLog(@"%@",jsonDict);
                                      
                                      NSDictionary *artistsDict = jsonDict[@"artists"];
                                      
                                      if (artistsDict  != nil) {
                                          //NSLog(@"%@",artistsDict);
                                          
                                          NSArray *itemsArray = artistsDict[@"items"];
                                          
                                          if(itemsArray != nil) {
                                              
                                              //NSLog(@"%@",itemsArray);
                                              
                                              for(NSDictionary *item in itemsArray) {
                                                  
                                                  NSString *name = [item objectForKey:@"name"];
                                                  
                                                  [self.namesArray addObject:name];
                                                  
                                                  NSLog(@"name == %@", name);
                                                  
                                                  [[NSNotificationCenter defaultCenter] postNotificationName:@"GotData" object:nil];
                                                  
                                              }
                                              
                                          }
                                          
                                          
                                          
                                      }
                                      
                                      
                                      
                                  }];
    
    // 5
    [task resume];
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.namesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NameCell"];
    
    NSString *name = self.namesArray[indexPath.row];
    
    cell.textLabel.text = name;
    
    return cell;
    
}

-(void)updateUI {
    NSLog(@"updateUI Called");
    
    [self.tableView reloadData];
}

@end
