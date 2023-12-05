use analysis_bankStock;

CREATE TABLE dimCompany(
	exchange varchar(30),
	ticker varchar(10) primary key, 
	shortName varchar(30),
	industry varchar(30),
	establishedYear varchar(30),
	noEmployees int(11),
	noShareHolders int(11), 
	foreignPercent float, 
	website varchar(30), 
	stockRating float, 
	outstandingShare float, 
	issueShare float
);

CREATE TABLE dimQuarter(
	quarter varchar(6) primary key
);

CREATE TABLE dimYear(
	year varchar(6) primary key
);

CREATE TABLE dimDate(
	date date primary key,
    	quarter varchar(6),
    	year varchar(6),
    	FOREIGN KEY (quarter) REFERENCES dimQuarter(quarter),
    	FOREIGN KEY (year) REFERENCES dimYear(year)
);

CREATE TABLE factPriceStock(
	ticker varchar(6),
	open int(11),
	high int(11),
	low int(11),
	close int(11), 
	volume int(11), 
	tradingDate date,
    FOREIGN KEY (ticker) REFERENCES dimCompany(ticker),
    FOREIGN KEY (tradingDate) REFERENCES dimDate(date)
 );
 
CREATE TABLE factIncomeStatement(
	ticker char(6),
	revenue decimal(15,4), 
	yearRevenueGrowth decimal(15,4), 
	quarterRevenueGrowth decimal(15,4), 
	costOfGoodSold decimal(15,4), 
	grossProfit decimal(15,4), 
	operationExpense decimal(15,4), 
	operationProfit decimal(15,4), 
	yearOperationProfitGrowth decimal(15,4), 
	quarterOperationProfitGrowth decimal(15,4), 
	interestExpense decimal(15,4), 
	preTaxProfit decimal(15,4), 
	postTaxProfit decimal(15,4), 
	shareHolderIncome decimal(15,4), 
	yearShareHolderIncomeGrowth decimal(15,4), 
	quarterShareHolderIncomeGrowth decimal(15,4), 
	investProfit decimal(15,4), 
	serviceProfit decimal(15,4), 
	otherProfit decimal(15,4), 
	provisionExpense decimal(15,4), 
	operationIncome decimal(15,4), 
	ebitda decimal(15,4), 
    year varchar(6), 
	quarter varchar(6),
	FOREIGN KEY (ticker) REFERENCES dimCompany(ticker),
    FOREIGN KEY (year) REFERENCES dimYear(year),
    FOREIGN KEY (quarter) REFERENCES dimQuarter(quarter)
 );
 
CREATE TABLE factBalanceSheet(
	ticker char(6), 
	shortAsset decimal(15,4), 
	cash decimal(15,4), 
	shortInvest decimal(15,4), 
	shortReceivable decimal(15,4), 
	inventory decimal(15,4), 
	longAsset decimal(15,4), 
	fixedAsset decimal(15,4), 
	asset decimal(15,4), 
	debt decimal(15,4), 
	shortDebt decimal(15,4), 
	longDebt decimal(15,4), 
	equity decimal(15,4), 
	capital decimal(15,4), 
	centralBankDeposit decimal(15,4), 
	otherBankDeposit decimal(15,4), 
	otherBankLoan decimal(15,4), 
	stockInvest decimal(15,4), 
	customerLoan decimal(15,4), 
	badLoan decimal(15,4), 
	provision decimal(15,4), 
	netCustomerLoan decimal(15,4), 
	otherAsset decimal(15,4), 
	otherBankCredit decimal(15,4), 
	oweOtherBank decimal(15,4), 
	oweCentralBank decimal(15,4), 
	valuablePaper decimal(15,4), 
	payableInterest decimal(15,4), 
	receivableInterest decimal(15,4), 
	deposit decimal(15,4), 
	otherDebt decimal(15,4), 
	fund decimal(15,4), 
	unDistributedIncome decimal(15,4), 
	minorShareHolderProfit decimal(15,4), 
	payable decimal(15,4),
    	year char(6), 
	quarter char(6),
	FOREIGN KEY (ticker) REFERENCES dimCompany(ticker),
    FOREIGN KEY (year) REFERENCES dimYear(year),
    FOREIGN KEY (quarter) REFERENCES dimQuarter(quarter)	
 );
 
CREATE TABLE factCashFlow(
	ticker char(6), 
	investCost decimal(15,4), 
	fromInvest decimal(15,4), 
	fromFinancial decimal(15,4), 
	fromSale decimal(15,4), 
	freeCashFlow decimal(15,4), 
    	year varchar(6), 
	quarter varchar(6),
	FOREIGN KEY (ticker) REFERENCES dimCompany(ticker),
    	FOREIGN KEY (year) REFERENCES dimYear(year),
    	FOREIGN KEY (quarter) REFERENCES dimQuarter(quarter)
);
CREATE TABLE factRatio(
	ticker varchar(6), 
	quarter varchar(6), 
	year varchar(6), 
	ROE decimal(15,4),
	ROA decimal(15,4),
	EPS decimal(15,4),
	BVPS decimal(15,4),
	interestMargin decimal(15,4),
	nonInterestOnToi decimal(15,4),
	badDebtPercentage decimal(15,4),
	provisionOnBadDebt decimal(15,4),
	costOfFinancing decimal(15,4),
	equityOnTotalAsset decimal(15,4),
	equityOnLoan decimal(15,4),
	costIncome decimal(15,4),
	equityOnLiability decimal(15,4),
	epsChange decimal(15,4),
	assetOnEquity decimal(15,4),
	revenueOnAsset decimal(15,4),
	preProvisionOnToi decimal(15,4),
	postTaxOnToi decimal(15,4),
	loanOnEarnAsset decimal(15,4),
	loanOnAsset decimal(15,4),
	loanOnDeposit decimal(15,4),
	depositOnEarnAsset decimal(15,4),
	badDebtOnAsset decimal(15,4),
	liquidityOnLiability decimal(15,4),
	payableOnEquity decimal(15,4),
	cancelDebt decimal(15,4),
	bookValuePerShareChange decimal(15,4),
	creditGrowth decimal(15,4),
    FOREIGN KEY (ticker) REFERENCES dimCompany(ticker),
    FOREIGN KEY (year) REFERENCES dimYear(year),
    FOREIGN KEY (quarter) REFERENCES dimQuarter(quarter)
);