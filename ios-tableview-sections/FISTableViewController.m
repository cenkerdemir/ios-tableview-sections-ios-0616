//
//  FISTableViewController.m
//  ios-tableview-sections
//
//  Created by Tom OMalley on 5/28/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISTableViewController.h"

@interface FISTableViewController ()

@end

@implementation FISTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FISStudent *student1 = [[FISStudent alloc] init];
    student1.name = @"JOKER";
    student1.favoriteThings = @[@"Sleep",@"Jokes",@"Fake shoes"];
    student1.favoriteFood = @"joker food";
    student1.favoriteColor = @"joker color";
    student1.favoriteMusicalArtist = @"joker's band";
    student1.favoriteGame = @"joker's game";
    
    
    FISStudent *student2 = [[FISStudent alloc] init];
    student2.name = @"BATMAN";
    student2.favoriteThings = @[@"Batmobile",@"Catwoman",@"Farts"];
    
    FISStudent *student3 = [[FISStudent alloc] init];
    student3.name = @"ROBIN";
    student3.favoriteThings = @[@"Batman",@"Silicon Valley Show",@"Objective-c"];
    
    FISStudent *student4 = [[FISStudent alloc] init];
    student4.name = @"HELLBOY";
    student4.favoriteThings = @[@"Red Color",@"Cigar",@"Mr.robot"];
    
    self.students = @[student1, student2, student3, student4];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return (NSInteger)[self.students count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return (NSInteger)[((FISStudent *)(self.students[(NSUInteger)section])).favoriteThings count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"expandingCell" forIndexPath:indexPath];
    // Configure the cell...
    
    NSArray *favoriteThings = [[self.students objectAtIndex:(NSUInteger)indexPath.section] favoriteThings];
    
    cell.textLabel.text = [favoriteThings objectAtIndex:(NSUInteger)indexPath.row];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%li", indexPath.row];
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    return [self.students[(NSUInteger)section] name];

}

-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 2;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
