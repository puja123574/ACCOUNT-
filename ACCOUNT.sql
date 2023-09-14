CREATE TABLE [db_source].[ACCOUNT_TG](
[ACC_Number][varchar](20) PRIMARY KEY,
[CUST_ID][numeric](5,0) NOT NULL,
[BR_CD][varchar](20)NOT NULL,
[ACC_TYPE][varchar](20)NOT NULL,
[CURRENT_BAL] [numeric](9,2)NOT NULL,
[ACC_CR_DT][date] NULL,
[ACC_Close_DT][date] NULL,
[ACC_ST][varchar](50) NOT NULL,
FOREIGN KEY ([BR_CD]) REFERENCES [db_source].[BRANCH_STG](BR_CD),
FOREIGN KEY ([CUST_ID]) REFERENCES [db_source].[CUSTOMER_STG](CUST_ID));

Bulk insert [db_source].[ACCOUNT_TG]
from 'C:\Users\pande\Downloads\ExportedData (2).xlsx'
with(
Firstrow = 2,
Fieldterminator =',',
Rowterminator ='\n'
);

CREATE TABLE [db_target].[ACCOUNT_DWH](
[ACC_Number][varchar](20) PRIMARY KEY,
[CUST_ID][numeric](5,0) NOT NULL,
[BR_CD][varchar](20)NOT NULL,
[ACC_TYPE][varchar](20)NOT NULL,
[CURRENT_BAL] [numeric](9,2)NOT NULL,
[ACC_CR_DT][date] NULL,
[ACC_Close_DT][date] NULL,
[ACC_ST][varchar](50) NOT NULL,
FOREIGN KEY ([BR_CD]) REFERENCES [db_target].[BRANCH_DWH](BR_CD),
FOREIGN KEY ([CUST_ID]) REFERENCES [db_target].[CUSTOMER_DWH](CUST_ID));