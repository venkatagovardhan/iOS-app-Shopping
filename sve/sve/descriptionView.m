//
//  descriptionView.m
//  sve
//
//  Created by Vineela Mallipeddi on 2/13/17.
//  Copyright © 2017 goli. All rights reserved.
//

#import "descriptionView.h"
#import "nextview.h"

@interface descriptionView ()
@property (weak, nonatomic) IBOutlet UIImageView *itempic;
@property (weak, nonatomic) IBOutlet UILabel *itemName;
@property (weak, nonatomic) IBOutlet UILabel *itemPrice;
@property (weak, nonatomic) IBOutlet UILabel *itemBrand;
@property (weak, nonatomic) IBOutlet UILabel *itemModel;
@property (weak, nonatomic) IBOutlet UILabel *itemRating;
@property (weak, nonatomic) IBOutlet UILabel *itemCapacity;
@property (weak, nonatomic) IBOutlet UIImageView *acimage;
@property (weak, nonatomic) IBOutlet UILabel *console;
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UILabel *size;
@property (weak, nonatomic) IBOutlet UILabel *display;
@property (weak, nonatomic) IBOutlet UILabel *capacitylabel;

@end

@implementation descriptionView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([_keyword isEqualToString:@"Fridge"]) {
        _itempic.hidden=false;
        _acimage.hidden=true;
        _console.hidden=true;
        _size.hidden=true;
        _display.hidden=true;
        _itemRating.text=_energyrating;
        _itemCapacity.text=_capacity;
    }
    else if ([_keyword isEqualToString:@"Airconditioner"]) {
        
        _acimage.hidden=false;
        _itempic.hidden=true;
        _console.hidden=true;
        _size.hidden=true;
        _display.hidden=true;
        _itemRating.text=_energyrating;
        _itemCapacity.text=_capacity;
    }
    else if ([_keyword isEqualToString:@"Washing Machine"]) {
        
        _itempic.hidden=false;
        _acimage.hidden=true;
        _console.hidden=false;
        _rating.hidden=true;
        _size.hidden=true;
        _display.hidden=true;
        _itemRating.text=_control;
        _itemCapacity.text=_capacity;
        
    }
    else if ([_keyword isEqualToString:@"LED"]) {
        
        _acimage.hidden=false;
        _itempic.hidden=true;
        _console.hidden=true;
        _capacitylabel.hidden=true;
        _rating.hidden=true;
        _itemCapacity.text=_Resolution;
        _itemRating.text=_screen;
        
    }
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: _productimage]];
    _itempic.image=[UIImage imageWithData: imageData];
    
    _acimage.image=[UIImage imageWithData: imageData];
    _itemName.text=_name;
    _itemBrand.text=_brand;
    _itemModel.text=_model;
    _itemPrice.text=_price;
    
    
    
    
    
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

@end
