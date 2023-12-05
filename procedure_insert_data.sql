use analysis_bankStock;

-- Insert dimCompany
DELIMITER //
CREATE PROCEDURE insertDimCompany()
BEGIN
	INSERT INTO analysis_bankStock.dimCompany
	SELECT * FROM analysis_stock.companyOverview
    WHERE industry = 'Banks';
END //
DELIMITER ;

CALL insertDimCompany();

-- Insert dimYear
DELIMITER //
CREATE PROCEDURE insertDimYear()
BEGIN
	INSERT INTO analysis_bankStock.dimYear
    SELECT DISTINCT i.year FROM analysis_stock.incomeStatement i 
		INNER JOIN analysis_stock.companyOverview o
		ON i.ticker = o.ticker
		WHERE o.industry = 'Banks'
    UNION 
    SELECT DISTINCT b.year FROM analysis_stock.balanceSheet b
		INNER JOIN analysis_stock.companyOverview o
		ON b.ticker = o.ticker
		WHERE o.industry = 'Banks'
    UNION
    SELECT DISTINCT c.year FROM analysis_stock.cashFlow c
		INNER JOIN analysis_stock.companyOverview o
		ON c.ticker = o.ticker
		WHERE o.industry = 'Banks'
    UNION
    SELECT DISTINCT r.year FROM analysis_stock.ratio r
		INNER JOIN analysis_stock.companyOverview o
		ON r.ticker = o.ticker
		WHERE o.industry = 'Banks'
    UNION
    SELECT DISTINCT YEAR(p.tradingDate) FROM analysis_stock.priceStock p 
		INNER JOIN analysis_stock.companyOverview o
		ON p.ticker = o.ticker
		WHERE o.industry = 'Banks';
END //
DELIMITER ;

CALL insertDimYear();

-- Insert dimQuarter
DELIMITER //
CREATE PROCEDURE insertDimQuarter()
BEGIN
	INSERT INTO analysis_bankStock.dimQuarter
    SELECT DISTINCT i.quarter FROM analysis_stock.incomeStatement i 
		INNER JOIN analysis_stock.companyOverview o
		ON i.ticker = o.ticker
		WHERE o.industry = 'Banks'
    UNION 
    SELECT DISTINCT b.quarter FROM analysis_stock.balanceSheet b
		INNER JOIN analysis_stock.companyOverview o
		ON b.ticker = o.ticker
		WHERE o.industry = 'Banks'
    UNION
    SELECT DISTINCT c.quarter FROM analysis_stock.cashFlow c
		INNER JOIN analysis_stock.companyOverview o
		ON c.ticker = o.ticker
		WHERE o.industry = 'Banks'
    UNION
    SELECT DISTINCT r.quarter FROM analysis_stock.ratio r
		INNER JOIN analysis_stock.companyOverview o
		ON r.ticker = o.ticker
		WHERE o.industry = 'Banks'
    UNION
    SELECT DISTINCT QUARTER(p.tradingDate) FROM analysis_stock.priceStock p 
		INNER JOIN analysis_stock.companyOverview o
		ON p.ticker = o.ticker
		WHERE o.industry = 'Banks';
END //
DELIMITER ;

CALL insertDimQuarter();

-- Insert dimDate
DELIMITER //
CREATE PROCEDURE insertDimDate()
BEGIN
	INSERT INTO analysis_bankStock.dimDate
    SELECT DISTINCT p.tradingDate, QUARTER(p.tradingDate), YEAR(p.tradingDate)
    FROM analysis_stock.priceStock p 
		INNER JOIN analysis_stock.companyOverview o
		ON p.ticker = o.ticker
		WHERE o.industry = 'Banks';
END//
DELIMITER ;

CALL insertDimDate();

-- Insert factIncomeStatement
DELIMITER //
CREATE PROCEDURE insertFactIncomeStatement()
BEGIN
	INSERT INTO analysis_bankStock.factIncomeStatement
    SELECT a.ticker, revenue, yearRevenueGrowth, quarterRevenueGrowth, costOfGoodSold, grossProfit, operationExpense,
			operationProfit, yearOperationProfitGrowth, quarterOperationProfitGrowth, interestExpense, preTaxProfit,
			postTaxProfit, shareHolderIncome, yearShareHolderIncomeGrowth, quarterShareHolderIncomeGrowth, investProfit,
			serviceProfit, otherProfit, provisionExpense, operationIncome, ebitda, year, quarter
	FROM analysis_stock.incomeStatement a
    INNER JOIN analysis_stock.companyOverview b
    ON a.ticker = b.ticker
    WHERE b.industry = 'Banks';
END//
DELIMITER ;

CALL insertFactIncomeStatement();

-- Insert factBalanceSheet
DELIMITER //
CREATE PROCEDURE insertFactBalanceSheet()
BEGIN
	INSERT INTO analysis_bankStock.factBalanceSheet
    SELECT a.ticker, shortAsset, cash, shortInvest, shortReceivable, inventory, longAsset, fixedAsset,
			asset, debt, shortDebt, longDebt, equity, capital, centralBankDeposit, otherBankDeposit,
			otherBankLoan, stockInvest, customerLoan, badLoan, provision, netCustomerLoan, otherAsset,
			otherBankCredit, oweOtherBank, oweCentralBank, valuablePaper, payableInterest, receivableInterest,
			deposit, otherDebt, fund, unDistributedIncome, minorShareHolderProfit, payable, year, quarter
    FROM analysis_stock.balanceSheet a
    INNER JOIN analysis_stock.companyOverview b
    ON a.ticker = b.ticker
    WHERE b.industry = 'Banks';
END //
DELIMITER ;

CALL insertFactBalanceSheet();

-- Insert factCashFlow
DELIMITER //
CREATE PROCEDURE insertFactCashFlow()
BEGIN
	INSERT INTO analysis_bankStock.factCashFlow
    SELECT a.ticker, investCost, fromInvest, fromFinancial, fromSale, freeCashFlow, year, quarter
    FROM analysis_stock.cashFlow a
    INNER JOIN analysis_stock.companyOverview b
    ON a.ticker = b.ticker
    WHERE b.industry = 'Banks';
END //
DELIMITER ;

CALL insertFactCashFlow();

-- Insert factRatio
DELIMITER //
CREATE PROCEDURE insertFactRatio()
BEGIN
	INSERT INTO analysis_bankStock.factRatio
    SELECT a.ticker, quarter, year, ROE, ROA, EPS, BVPS, interestMargin, nonInterestOnToi, badDebtPercentage,
		provisionOnBadDebt, costOfFinancing, equityOnTotalAsset, equityOnLoan, costIncome, equityOnLiability,
		epsChange, assetOnEquity, revenueOnAsset, preProvisionOnToi, postTaxOnToi, loanOnEarnAsset,
		loanOnAsset, loanOnDeposit, depositOnEarnAsset, badDebtOnAsset, liquidityOnLiability, payableOnEquity,
		cancelDebt, bookValuePerShareChange, creditGrowth
    FROM analysis_stock.ratio a
    INNER JOIN analysis_stock.companyOverview b
    ON a.ticker = b.ticker
    WHERE b.industry = 'Banks';
END //
DELIMITER ;

CALL insertFactRatio();

-- Insert factPriceStock
DELIMITER //
CREATE PROCEDURE insertFactPriceStock()
BEGIN
	INSERT INTO analysis_bankStock.factPriceStock
    SELECT a.ticker, open, high, low, close, volume, tradingDate
    FROM analysis_stock.priceStock a
    INNER JOIN analysis_stock.companyOverview b
    ON a.ticker = b.ticker
    WHERE b.industry = 'Banks';
END //
DELIMITER ;

CALL insertFactPriceStock();