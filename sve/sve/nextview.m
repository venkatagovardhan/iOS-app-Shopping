//
//  nextview.m
//  sve
//
//  Created by Vineela Mallipeddi on 2/4/17.
//  Copyright © 2017 goli. All rights reserved.
//

#import "nextview.h"
#import "contentcell.h"
#import "descriptionView.h"

@interface nextview (){
NSArray *arrayList;
    NSString *keyvalue;
    
}

@end

@implementation nextview

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    keyvalue=_selectedCategory;
    arrayList=_data;
    //NSDictionary *dictRoot = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"information" ofType:@"plist"]];
    //arrayList = [NSArray arrayWithArray:[dictRoot objectForKey:keyvalue]];
    //[arrayList enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop) {
        // Fetch Single Item
        // Here obj will return a dictionary
       //NSLog(@"person name : %@",[obj valueForKey:@"name"]);
        
   // }];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrayList.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *tableidentifier=@"contentcell";
    contentcell *cell=[tableView  dequeueReusableCellWithIdentifier:tableidentifier];
    if (cell==nil) {
        
        cell=[[contentcell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableidentifier];
    }
    if ([keyvalue isEqualToString:@"Fridge"]) {
        cell.productpic.hidden=false;
        cell.ACpic.hidden=true;
    }
    else if ([keyvalue isEqualToString:@"Airconditioner"]) {
        
        cell.ACpic.hidden=false;
        cell.productpic.hidden=true;
        
    }
    else if ([keyvalue isEqualToString:@"Washing Machine"]) {
        
        cell.productpic.hidden=false;
        cell.ACpic.hidden=true;
        
    }
    else if ([keyvalue isEqualToString:@"LED"]) {
        
        cell.ACpic.hidden=false;
        cell.productpic.hidden=true;
        
    }
    
    
    cell.productTitle.text=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"name"];
    
    cell.productPrice.text=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"price"];
     NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [[arrayList objectAtIndex:indexPath.row] valueForKey:@"image"]]];
    
    //NSString *imagename=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"image"];
    //NSLog(@"%@", imagename);
    cell.productpic.image=[UIImage imageWithData: imageData];;
    cell.ACpic.image=[UIImage imageWithData: imageData];;
                       
    
    
    //[[arrayList objectAtIndex:indexPath.row] valueForKey:@"description"];
    //cell.linkclick.tag=indexPath.row;
   // [cell.linkclick addTarget:self action:@selector(clickclicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    descriptionView *detailedinfo=[self.storyboard instantiateViewControllerWithIdentifier:@"details"];
    [self.navigationController pushViewController:detailedinfo animated:YES];
    
    detailedinfo.name=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"name"];
    detailedinfo.price=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"price"];
    detailedinfo.capacity=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"Capacity"];
   
    
    
    detailedinfo.productimage=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"image"];
    detailedinfo.energyrating=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"Energy Rating"];
    detailedinfo.model=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"Model"];
    detailedinfo.brand=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"Brand"];
    detailedinfo.control=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"Control Console"];
    detailedinfo.screen=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"Screen Size"];
    detailedinfo.Resolution=[[arrayList objectAtIndex:indexPath.row] valueForKey:@"Display Resolution"];
    detailedinfo.keyword=keyvalue;
}


@end
