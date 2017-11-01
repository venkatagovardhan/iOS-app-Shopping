//
//  ViewController.m
//  sve
//
//  Created by Vineela Mallipeddi on 1/30/17.
//  Copyright © 2017 goli. All rights reserved.
//

#import "ViewController.h"
#import "nextview.h"

@interface ViewController (){
    NSArray *array;
    NSString *URLString;
    NSString *protype;
    
}
@property (weak, nonatomic) IBOutlet UIImageView *fridge;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getCountryInfo{
    
    
    NSURL *url = [NSURL URLWithString:URLString];
    
    
    
    [self downloadDataFromURL:url withCompletionHandler:^(NSData *data) {
        
        // Check if any data returned.
        
        if (data != nil) {
            
            //  NSLog(@"Data is %@",data);
            
            // Convert the returned data into a dictionary.
            
            NSError *error;
            
           NSArray *returnedArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            
            
            
            if (error != nil) {
                
                NSLog(@"%@", [error localizedDescription]);
                
            }
            
            else{
                NSDictionary *dict = [returnedArray objectAtIndex:0];
               
                //NSLog(@"%@",returnedDict);
                array = [dict  valueForKey:@"items"];
               
                //NSString *name=[array valueForKey:@"title"];
                
                [self getdataout];
                
                
                
                //NSLog(@"Returned Dictionary is %@",[array valueForKey:@"name"]);
                //NSLog(@"%lu",(unsigned long)array.count);
                
                
                
            }
            
            
            
        }
        
    }];
    
    
    
    
}
-(void)downloadDataFromURL:(NSURL *)url withCompletionHandler:(void (^)(NSData *))completionHandler{
    
    // Instantiate a session configuration object.
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    
    
    // Instantiate a session object.
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    
    
    // Create a data task object to perform the data downloading.
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        
        
        if (error != nil) {
            
            // If any error occurs then just display its description on the console.
            
            NSLog(@"%@", [error localizedDescription]);
            
        }
        
        else{
            
            // If no error occurs, check the HTTP status code.
            
            NSInteger HTTPStatusCode = [(NSHTTPURLResponse *)response statusCode];
            
            
            
            // If it's other than 200, then show it on the console.
            
            if (HTTPStatusCode != 200) {
                
                NSLog(@"HTTP status code = %ld", (long)HTTPStatusCode);
                
            }
            
            
            
            // Call the completion handler with the returned data on the main thread.
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
                completionHandler(data);
                
            }];
            
        }
        
    }];
    
    
    
    // Resume the task.
    
    [task resume];
    
}
-(void)getdataout{
    NSLog(@"total news %lu",(unsigned long)array.count);
    
    
    nextview *nvc=[self.storyboard instantiateViewControllerWithIdentifier:@"next"];
    [self.navigationController pushViewController:nvc animated:YES];
    nvc.data=array;
    nvc.selectedCategory=protype;
    
    
}

- (IBAction)button:(id)sender {
    URLString = @"https://api.mongolab.com/api/1/databases/sve/collections/Fridge?apiKey=API_KEy" ;
    [self getCountryInfo];
    protype=@"Fridge";
}
- (IBAction)Airconditioner:(id)sender {
    URLString = @"https://api.mongolab.com/api/1/databases/sve/collections/Airconditioner?apiKey=API_KEy" ;
    [self getCountryInfo];
    protype=@"Airconditioner";
    
}
- (IBAction)WashingMachine:(id)sender {
    URLString = @"https://api.mongolab.com/api/1/databases/sve/collections/Washing_Machine?apiKey=API_KEy" ;
    [self getCountryInfo];
    protype=@"Washing Machine";
}
- (IBAction)LED:(id)sender {
    URLString = @"https://api.mongolab.com/api/1/databases/sve/collections/LED?apiKey=API_KEy" ;
    [self getCountryInfo];
    protype=@"LED";
}

@end
