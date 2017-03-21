//
//  contentcell.h
//  sve
//
//  Created by Vineela Mallipeddi on 2/12/17.
//  Copyright © 2017 goli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface contentcell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *productpic;
@property (weak, nonatomic) IBOutlet UILabel *productTitle;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UIImageView *ACpic;

@end
