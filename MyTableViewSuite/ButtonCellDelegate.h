//
//  ButtonCellDelegate.h
//  MyTableViewSuite
//
//  Created by Romy on 6/26/15.
//  Copyright © 2015 Romy. All rights reserved.
//

@import UIKit;

@protocol ButtonCellDelegate <NSObject>

- (void)didClickOnCellAtIndex:(NSIndexPath*)indexPath;
- (void)didClickOnCellAtIndex:(NSIndexPath *)indexPath withLabelStringData:(NSString *)labelString;

@end
