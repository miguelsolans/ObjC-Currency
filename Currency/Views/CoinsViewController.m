//
//  CoinsViewController.m
//  Currency
//
//  Created by Miguel Solans on 09/11/2020.
//

#import "CoinsViewController.h"
#import "CalculatorViewModel.h"

@interface CoinsViewController ()

@end

@implementation CoinsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.coinViewModel = [[CoinsViewModel alloc] initViewModel];
    
    [self.coinTableView registerNib:[UINib nibWithNibName:@"CoinTableViewCell" bundle:nil] forCellReuseIdentifier:@"CoinTableViewCell"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataReady:) name:@"dataReady" object:nil];

    
    // Do any additional setup after loading the view.
}

- (void) dataReady: (NSNotification *)n {
    [self.coinTableView reloadData];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *cellId = @"CoinTableViewCell";
    
    CoinTableViewCell *cell = (CoinTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellId owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
    cell.codeLabel.text = [[self.coinViewModel.coinsArray objectAtIndex:indexPath.row] rateId];
    cell.dateLabel.text = [[self.coinViewModel.coinsArray objectAtIndex:indexPath.row] rateDate];
    cell.descriptionLabel.text = [[self.coinViewModel.coinsArray objectAtIndex:indexPath.row] rateName];
    
    NSString *rate = [NSString stringWithFormat:@"%@", [[self.coinViewModel.coinsArray objectAtIndex:indexPath.row] rateId]];
    cell.rateLabel.text = rate;
    
    
    NSString *imageName = [[self.coinViewModel.coinsArray objectAtIndex:indexPath.row] rateId];
    [cell.flagImageView setImage:[UIImage imageNamed:[imageName lowercaseString]]];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.coinViewModel.coinsArray.count;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.index = indexPath.row;
    
    // Segue...
    [self performSegueWithIdentifier:@"calculatorSegue" sender:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"Preparing for Segue");
    
    if([segue.identifier isEqualToString:@"calculatorSegue"]) {
        CalculatorViewController *calculatorViewController = [segue destinationViewController];
        
        CalculatorViewModel *calcViewModel = [[CalculatorViewModel alloc] initWithRate:[self.coinViewModel.coinsArray objectAtIndex:self.index]];
        calculatorViewController.coinViewModel = calcViewModel;
    }
}

@end
