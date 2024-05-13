USE master;
GO

IF DB_ID(N'hausarbeit_EN') IS NULL
  CREATE DATABASE hausarbeit_EN;
GO

USE hausarbeit_EN;
GO 

DROP TABLE IF EXISTS Rueckmeldung;
DROP TABLE IF EXISTS Aufgabenstellung;
DROP TABLE IF EXISTS Inhalt;
DROP TABLE IF EXISTS Kapitel;

CREATE TABLE Kapitel (
  Kapitel_id INT IDENTITY (1, 1) PRIMARY KEY, 
  Kapitel_Name nvarchar(100) not null,
);

CREATE TABLE Inhalt (
  Inhalt_id INT IDENTITY (1, 1) PRIMARY KEY, 
  Kapitel_id int not null,
  Inhalt_Text ntext not null,
  constraint fk_KapitelInhalt foreign key (Kapitel_id) references Kapitel(Kapitel_id)
);

CREATE TABLE Aufgabenstellung (
  AGS_id INT IDENTITY (1, 1) PRIMARY KEY, 
  Inhalt_id int not null,
  AGS_Text ntext not null,
  CONSTRAINT fk_InhaltAufgabenstellung FOREIGN KEY (Inhalt_id) REFERENCES Inhalt(Inhalt_id),
);

CREATE TABLE Rueckmeldung (
  Rueck_id INT IDENTITY (1, 1) PRIMARY KEY, 
  Rueck_Text ntext not null,
  AGS_id INT foreign key references Aufgabenstellung(AGS_id)
);
 

INSERT INTO Kapitel(Kapitel_Name) VALUES('Stocktaking > Inventory > Balance sheet')
INSERT INTO Kapitel(Kapitel_Name) VALUES('Equity comparison')
INSERT INTO Kapitel(Kapitel_Name) VALUES('Aktiv & passive account')
INSERT INTO Kapitel(Kapitel_Name) VALUES('Stock accounts')
INSERT INTO Kapitel(Kapitel_Name) VALUES('Ledger')
INSERT INTO Kapitel(Kapitel_Name) VALUES('Opening-/Closing balance account')
INSERT INTO Kapitel(Kapitel_Name) VALUES('Profit accounts')
INSERT INTO Kapitel(Kapitel_Name) VALUES('Profit and loss account')
INSERT INTO Kapitel(Kapitel_Name) VALUES('Linear depreciation')
INSERT INTO Kapitel(Kapitel_Name) VALUES('Value added tax')
INSERT INTO Kapitel(Kapitel_Name) VALUES('Financial accounting')


INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(1,'Inventory is a process in which the quantities and values of goods, materials, or assets of a company are recorded and verified. This typically takes place at the end of a fiscal year to create an accurate inventory count.

During inventory, all existing stocks are physically counted, verified, and compared with the records in the inventory management system. The aim is to identify and correct any discrepancies between the actual stock levels and the expected stock levels.

Inventory allows a company to verify the accuracy of its inventory records, detect potential losses or theft, and establish a basis for the financial valuation of the company.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(1,' There are different types of inventory that can be used depending on the needs and requirements of a company or organization. Here are some common types of inventory:

Point-in-Time Inventory: In this type of inventory, the stock is physically counted on a specific date or point in time. All physical inventory is recorded, and any discrepancies between the expected and actual stock levels are identified.

Continuous Inventory: In continuous inventory, the stock is continuously and regularly recorded and updated throughout the year. This can be done, for example, using barcode scanners or automated inventory systems.

Sampling Inventory: In sampling inventory, only selected stocks or subsets of the total inventory are checked. Instead of counting the entire inventory, representative samples are taken, and the results are extrapolated to the total stock.

Valuation Inventory: In valuation inventory, the stock is not physically counted, but only the financial values of the inventory are determined. This is done based on accounting records that contain information on the quantity and value of the items.

Off-Site Inventory: In off-site inventory, the physical stock is not counted at its actual location but at a different location, such as an external warehouse or supplier. This type of inventory is often used to avoid disrupting business operations or to obtain accurate inventory data when normal operations are not possible.

Digital Inventory: In digital inventory, the stock is recorded using technology and automated systems. This can be done, for example, using barcode scanners, RFID tags, or inventory management software. Digital inventory enables faster and more accurate stock recording.

Each type of inventory has its advantages and disadvantages, and the selection depends on various factors such as the size of the inventory, the nature of the items, the available resources, and the specific requirements of the company. Often, a combination of different inventory methods is used to ensure accurate and efficient inventory management.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(1,'The inventory is a statement of all assets, liabilities, and equity of a company at a specific point in time. It provides an overview of the financial position of the company and serves as the basis for accounting and financial statement preparation. The inventory includes both tangible assets such as cash, inventory, and equipment, as well as intangible assets such as patents and trademarks. On the liabilities side, the company obligations, such as loans or supplier debts, are listed, along with the equity. The inventory is typically prepared at the end of a fiscal year or at other designated times to enable an accurate inventory assessment. It serves as the basis for evaluating the company and calculating metrics such as working capital or net worth.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(1,'A balance sheet is a financial summary that presents the assets, liabilities, and equity of a company at a specific point in time. It provides an overview of the financial position and value of a company. The balance sheet consists of two main parts: the asset side and the liability side.

On the asset side, the company assets are listed, such as cash, receivables, inventory, real estate, and investments. These represent what the company owns and their value.

On the liability side, the company debts and equity are listed. Debts can include obligations to suppliers, loans, or other liabilities. Equity represents the owners stake in the company.

The balance sheet equation states that the sum of the asset side must equal the sum of the liability side. This means that a company assets are financed by debts and equity.

The balance sheet is an important tool for companies, investors, creditors, and other stakeholders to assess the financial health and stability of a company. It provides information about liquidity, indebtedness, and the value of a company and serves as a basis for financial decisions and analysis.
')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(2,'The equity comparison is a simple and effective method to assess the success of a company. It involves comparing the amount at the beginning of the period with the amount at the end of the period. If the equity increases, it is referred to as equity growth, and if it decreases, it is called equity reduction. It is not permitted to consider personal income or withdrawals as an increase or decrease in equity.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(2,'The calculation of asset changes by comparing operating assets is a significant component in determining taxes. Business owners who are responsible for accounting must have a comprehensive overview of their operating assets. For self-employed individuals who keep voluntary books, it is sufficient to perform a simplified and not fully comprehensive comparison of operating assets.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(3,'The ledger accounts are derived from the double-entry bookkeeping system based on the company balance sheet. Each item in the balance sheet must have its own ledger account. The accounts are referred to as either asset or liability accounts, depending on whether they originate from the asset side or the liability side of the balance sheet. The values of the fixed assets and current assets are reflected in the active ledger accounts, while the sources of capital are shown in the passive ledger accounts.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(3,'Active accounts such as buildings, machinery, and fleet have an impact on a companys fixed assets and current assets and are listed on the asset side of a balance sheet as ledger accounts. Companies record amounts on the debit side of the ledger accounts when they enter the accounts. Companies can increase their fleet by reaching the asset or debit side of the ledger account, while a sale would affect the liability or credit side of the account.

To summarize the concept, the debit side of active accounts is used for recording entries, while the credit side is used for recording exits. The initial balance of an active account is located on the asset side, while the ending balance is on the liability side.

Passive accounts on the liability side of the balance sheet include accounts such as bank liabilities or savings deposits, which affect a companys equity. Unlike active accounts, companies record an entry on the credit or liability side and record an exit on the asset or debit side of the ledger for passive ledger accounts.

For passive ledger accounts, the initial and ending balances are found on the liability side, while for active ledger accounts, the ending balance is on the asset side.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(3,'An example illustrates the entry on a ledger account:
A company purchases a car for 15,000 euros and makes the payment through a bank transfer from its bank account.
In double-entry bookkeeping, every entry on a ledger account on the debit side must correspond to a matching entry on the credit side, resulting in two accounts.

As a result of the purchase, the asset balance on the asset side of the Fleet ledger account increases by 15,000 euros, while the bank balance on the asset side of the Bank ledger account decreases by 15,000 euros.

Whenever an entry is made on a ledger account on the debit side, a corresponding credit entry is made on another account. It is necessary to specify the appropriate contra account for each entry.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(3,' As part of the year-end inventory, companies are required, according to the provisions of the Commercial Code, to determine the closing balances of the ledger accounts in order to present them in the balance sheet.
Since the closing balance is derived from the difference between the debit and credit sides, this process is also referred to as balancing.
The difference between the debit and credit sides forms the closing balance of the asset accounts, while the closing balance of the liability accounts is derived from the difference between the credit and debit sides.
It is important to avoid discrepancies in inventory in advance.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(4,'The general ledger, also known as the journal, records all events in the company in an orderly manner.
The basis for this is documents such as invoices or receipts.
The chronological listing is intended to facilitate the authorities ability to conduct any investigations more easily.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(4,'Before the digitalization era, accounting actually consisted of several physical books.
This aspect of electronic bookkeeping has been somewhat neglected, but various books are still managed through contemporary software solutions.
This includes primarily the general ledger, the main ledger, and numerous subsidiary ledgers.

The purpose of the general ledger is to list all business events in chronological order.
It includes opening, ongoing, preparatory, and closing entries.
The idea of organizing business transactions chronologically makes it much easier for authorities to conduct audits.
Typically, the characteristics of a business event need to be recorded in the general ledger:

Date
Document number
Credit account
Debit account
Amount
Transaction description')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(4,'In order to create the general ledger, it is necessary to keep records of documents for all business events.
These documents can include customer invoices, bank statements, or cash receipts, for example.
It is crucial that each business event listed in the general ledger can be supported by sufficient evidence.
If there is no invoice or receipt for a listed document number, the entry will not be accepted by the tax authorities.
The individual business events are then transferred from the general ledger to the main ledger.
As the name suggests, the general ledger serves as the foundation for accounting.
The business transactions are allocated to individual general ledger accounts - balance sheet accounts and income statement accounts.
This is important for compliance with regulations, as the individual events must be not only chronologically organized but also categorized properly.
Ultimately, the main ledger consists of the general ledger accounts listed in the chart of accounts.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(5,' The accounting process consists of the general ledger.
The general ledger transfers business events from the general journal to establish proper organization of all transactions on general ledger accounts.

Double-entry bookkeeping includes the general ledger, where all business events are carefully and appropriately documented.
This is facilitated by the general journal, which still maintains the chronological order of all business events.
For the general ledger to serve as the basis of the balance sheet, it must adhere to the principle of closure.
')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(5,'The general ledger consists of ledger accounts that categorize specific business transactions based on their cause.
This is facilitated by the general journal, where all events are documented in their chronological order.
There are three different methods to carry out the transfer:

Maintenance and closure of the general ledger
Usually, the general ledger is structured according to templates provided by industry account frameworks, standard account frameworks, or common account frameworks.
The balance sheet is automatically generated after all ledger accounts and the general ledger have been closed.
Closing the general ledger also directly generates the income statement.

Therefore, the legislator requires that the principle of closure be considered in the general ledger.
Officially, this means achieving a balance between debits and credits.
It is necessary for the total of all debit entries to precisely match the total of all credit entries.
Material closure is also important, which means that the general ledger effectively documents all business events within a specific time period.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(6,'
The closing balance sheet is a summary of the financial position of a company at a specific point in time, listing all assets, liabilities, and equity.
It is also referred to as the final balance sheet, closing statement, or closing account.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(6,'The opening balance sheet is a statement prepared at the beginning of a new fiscal year or at the inception of a company.
It serves as a starting point for the accounting process and provides an overview of the financial position of the company at that particular time.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(7,'There are many different terms in the field of finance and accounting, and this can quickly lead to confusion. It is crucial to understand the exact meaning of a term and its application.

It is possible that you have already heard of the term profit account in accounting. An income statement account or a profit and loss account, is used to track the revenues, expenses, gains, and losses of a business over a specific period of time, usually a fiscal year.

When booking transactions in an Erfolgskonto, there are a few key points to consider')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(7,'income statement accounts are sub-accounts of the equity account and are part of double-entry bookkeeping. The equity account is considered a liability.

The recording of profits and losses at the end of the year is done through double-entry bookkeeping. All companies, except for small businesses and self-employed individuals, are required to maintain double-entry bookkeeping. According to the Commercial Code, small businesses are defined as those whose turnover in the previous year was below €17,500 and whose turnover for the upcoming fiscal year is not expected to exceed €60,000.

There are two main categories in double-entry bookkeeping: balance sheet accounts and income statement accounts. income statement accounts record revenues and expenses, while balance sheet accounts describe the assets of a company, such as properties, and its liabilities.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(7,' 
Now lets go into more detail about the differences between the two accounts:
How can you determine which business transaction is recorded in which account?

Balance sheet accounts (Bestandskonten) are used for all events that change the assets of a company. This can include the acquisition of equipment or the payment of a bill via bank transfer. Therefore, balance sheet accounts record non-profitable business transactions, meaning that all transactions that do not have an impact on the companys profit are recorded in balance sheet accounts.

On the other hand, business events that do not affect the assets and are profitable are reported in income statement accounts (Erfolgskonten). The profit of a company is influenced by successful transactions.

Another significant difference is that the income statement is carried forward each year with the ending balance of the previous fiscal year, while the income statement is prepared each year and starts from 0.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(7,'We distinguish between revenue accounts (Ertragskonten) and expense accounts (Aufwandskonten) within the income statement accounts.

All positive changes in value are recorded in revenue accounts, while all negative changes in value are recorded in expense accounts. Therefore, revenues increase the equity, while expenses decrease it.

Rental income is an example of a transaction recorded in a revenue account, while the consumption of raw materials is recorded in an expense account.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(7,'In double-entry bookkeeping, every business transaction is recorded on both an individual account and another account. One can also use the terms "must" and "own".

For careful and accurate bookkeeping, it is crucial to define and understand the terms.

The use and origin of assets are described by the debit (Soll). Due to the fact that income statement accounts are considered as passive accounts, all gains are recorded on the ownership side and all expenses in the plan side.

Debit (Soll) always appears on the left side, and credit (Haben) on the right side.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(7,'
The balances of both accounts need to be calculated first. All debit balances in the expense account are added to obtain the balance.
All credit balances in the revenue account are added to obtain the balance.
Here, we refer to the journal entries "Revenue accounts to Income Statement account" and "Income Statement accounts to Expense accounts".

Next, we create the balance of the Income Statement account and transfer it to the Owners Equity account.
The balance of the Income Statement account indicates whether the company has made a profit or a loss.
In the field, the term "annual surplus" or "annual deficit" is also used.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(8,'
There is a possibility that the structure and format of the Income Statement may vary.
It can be prepared either in account format or in a layered format.
In the account format, a distinction is made between the debit and credit sides (expenses/revenues).
If a balance arises on the debit side, a profit is generated.
However, if a positive result appears on the financial side, it indicates a loss.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(8,'The Income Statement compares all costs and revenues for a specific period, which can be a quarter or the entire fiscal year. As it is an account on the liability side of the balance sheet, revenues are recorded as credits, while expenses are recorded as debits.
At the end of the specified period, the profit or loss from the Income Statement is calculated and then transferred to the equity account.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(8,'The Income Statement does not provide a clear breakdown of operating income in the business sense, as it is not required to separate expenses and revenues into non-operating and operating, as well as one-time and regular, period-specific and non-period-specific categories.

It is necessary to present not only the data of the previous fiscal year according to HGB (German Commercial Code) and IFRS (International Financial Reporting Standards) but also the values of the previous year and even the values of the last three years according to US GAAP (Generally Accepted Accounting Principles). If a position is not filled in the current year, it is listed as vacant. It is of great importance that the amounts are comparable. If this is not the case, an explanation must be provided in the notes to the financial statements.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(8,'Depreciation is the allocation of the cost of an asset over its useful life in accounting, representing its "wear and tear" or decrease in value. The expenses related to the acquisition and production of these assets are spread over the years of use of the fixed assets through depreciation. As a result, the profit is reduced by the depreciation expense, as stipulated in the German Commercial Code (HGB).')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(8,'Every fiscal year, according to Section 242 of the German Commercial Code (HGB), the merchant must present a statement of expenses and revenues. When it comes to the formal structure, international accounting standards such as the International Financial Reporting Standards (IFRS) and the United States Generally Accepted Accounting Principles (US-GAAP) provide detailed rules.

Many companies prepare a monthly income statement (GuV) and a complete balance sheet, often just a few days after the end of the month. This allows business owners to have a current insight into the progress of their fiscal year. It helps to avoid surprises at the end of the fiscal year and catch errors early on. Furthermore, it allows for the appropriate allocation of specific events relevant to the finances to individual months, such as major repairs, bad debt expenses, or business closures.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(9,'An entrepreneur is required to pay value-added tax (VAT) on their revenues. In everyday life, it is more commonly known as the sales tax, although this term is imprecise. The input tax, from the buyers perspective, refers to the same tax.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(9,'
Entrepreneurs pay taxes on their revenues. It is necessary to explicitly state the taxes on receipts and invoices. In Germany, there are two tax rates: 19% or 7%. The tax must be remitted by the company to the tax authority. The value-added tax (VAT) represents a liability to the tax authority.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(9,'The same tax as the value-added tax
From a different perspective
Tax that an entrepreneur pays when purchasing goods or services from another entrepreneur
The VAT of the selling company = Input tax (Vorsteuer) of the buying company
The buyer who has to pay the input tax can reclaim it from the tax authority
Input tax represents a receivable from the tax authority.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(10,'epreciation according to the Income Tax Act (EStG)
Depreciation is legally required. According to the Income Tax Act (Einkommensteuergesetz), the acquisition costs and production costs of assets used for income generation and expected to be used for more than one year must be evenly spread over their useful life.

It is necessary for the costs of acquiring and producing depreciable assets to reach a certain threshold.
It is evident that straight-line depreciation is the statutory norm, as the deduction is evenly distributed over the useful life.
It is no longer allowed to use declining balance depreciation, which used to be common, for assets acquired after the year 2010.

Depreciation according to the German Commercial Code (HGB)
The valuation principles of the German Commercial Code (Handelsgesetzbuch, HGB) for assets listed in the financial statements also indicate that companies must make scheduled depreciations.

Therefore, depreciation reduces a companys profit even if no acquisition costs or production costs were incurred in a particular year.
In contrast, the principle of depreciation increases profit in the year of purchase. The costs of acquiring the item cannot be fully recognized in that year.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(10,'
Depreciation is also meaningful in business management, as it allows the company to set aside funds each year for the production or purchase costs of new assets, in case the depreciated assets are no longer usable.
Depreciation can also be used to determine the decline in value of fixed assets and current assets in accounting.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(10,'In tax and financial accounting, straight-line depreciation is a common method of depreciation, where the reduction in value is recorded annually with constant amounts.
Direct depreciation is an accounting method in which the asset account is reduced directly by the depreciation amount.
The method of performance depreciation is used to depreciate assets whose performance varies significantly based on experience.
Scheduled depreciation is the depreciation over a predetermined useful life, which is partially based on legal requirements.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(10,'In general, there are two main types of depreciation: linear depreciation and declining balance depreciation.
Linear depreciation means that the depreciation amount remains constant over time.
On the other hand, declining balance depreciation results in decreasing depreciation amounts each year.
This is because the depreciation rate is based on the remaining book value, which decreases every year due to previous depreciation.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(10,'Direct and indirect depreciation methods
In accounting, there are two types of depreciation methods: direct depreciation and indirect depreciation.
Direct depreciation involves reducing the asset item on the liability side.
In contrast, indirect depreciation involves aggregating all depreciations and presenting them as a valuation allowance on the asset and liability sides.

Performance-based depreciation
Depreciation based on performance depends on the usage of an asset.
Performance-based depreciation is particularly beneficial for capital goods that fluctuate significantly in their usage.
For example, it is commonly used for vehicles.

Extraordinary depreciation
Extraordinary depreciation captures losses in value within a company that were not caused by regular usage.

Specifics of unexpected depreciation
Although there are generally no differences in accounting between extraordinary and regular depreciation of assets, there are some specifics.
It is possible to make extraordinary depreciation for both fixed assets and current assets.
Partial write-offs are considered extraordinary depreciation in tax law.

Imputed depreciation
Imputed depreciation does not refer to the accounting depreciation, but rather to the actual loss in value of tangible fixed assets.
The purpose of imputed depreciation is to account for actual costs incurred by a company that do not appear in the calculation of profits and losses.')
INSERT INTO Inhalt(Kapitel_id ,Inhalt_Text) VALUES(10,'If uncertain about the useful life of certain assets, one can refer to depreciation tables.
These tables are produced by the Federal Ministry of Finance. However, they are not binding and merely serve as a guideline.
The useful life indicated in these tables may vary for each individual situation and may deviate from what the entrepreneur determines.')


INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(1,'What is the purpose of inventory and why is it important for companies?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(1,'Which types of inventory procedures are used?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(1,'What possible measures can be taken to improve the efficiency and accuracy of inventory?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(1,'How is the accuracy and completeness of inventory ensured?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(1,'Which assets are included in the inventory?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(1,'Which liabilities are listed in the inventory?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(1,'Is the inventory regularly updated and adjusted?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(1,'What possible information does the inventory provide about the financial situation of the company?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(1,'What is a balance sheet and what information does it provide about a company?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(1,'Which assets are listed in the balance sheet?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(1,'Which liabilities and equity positions are included in the balance sheet?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(1,'How is the structure of the balance sheet built and what are its components?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(2,'What is the equity comparison and what information does it provide about the financial position of a company?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(2,'What is an increase or decrease in equity called?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(2,'How has equity changed compared to the previous year/period, and what are the reasons for these changes?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(3,'What types of inventory accounts are there, and how do they differ from each other?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(3,'Where are entries on inventory accounts recorded?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(3,'How are closing balances on inventory accounts recorded?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(3,'How are inventory accounts linked to other accounts in accounting, such as the cash account or the sales account?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(4,'What is the general ledger and what function does it serve in accounting?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(4,'Which types of accounts are maintained in the general ledger, and how do they differ from each other?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(4,'How are entries potentially recorded in the general ledger, and how is documentation carried out?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(4,'How is the general ledger linked to other accounts in accounting?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(5,'What is the trial balance, and what function does it serve in accounting?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(5,'How are entries recorded and documented in the trial balance?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(5,'How can possible errors in the trial balance be identified and corrected?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(6,'What is an opening balance sheet, and what information does it contain?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(6,'What is a closing balance sheet, and what information does it contain?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(7,'What are income statement accounts, and what role do they play in accounting?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(7,'What types of income statement accounts are there, and how are they categorized?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(7,'How are revenues and expenses allocated to the respective income statement accounts?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(7,'How are profits and losses treated and recorded in income statement accounts?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(7,'What are the implications of income statement accounts on the income statement?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(8,'What is the income statement, and what function does it serve in accounting?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(8,'Which types of income and expenses are recorded in the income statement?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(8,'How is the profit or loss of a company determined in the income statement?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(8,'What information does the income statement provide for financial analysis and reporting?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(8,'How is the profit or loss of a company determined in the income statement?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(9,'What are depreciation and why are they important in accounting?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(9,'What types of depreciation are there?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(9,'What are the implications of depreciation on the income statement and balance sheet of a company?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(9,'How can depreciation be optimized for tax planning?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(10,'What types of VAT rates are there, and how are they applied?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(10,'What is input VAT, and how is it linked to output VAT?')
INSERT INTO Aufgabenstellung(Inhalt_id, AGS_Text) VALUES(10,'How can VAT and input VAT be used in financial analysis to evaluate the financial performance of a company?')


INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(1,'The inventory is important for companies for several reasons.

Compliance with legal requirements: In many countries, companies are legally required to conduct an inventory. This serves to comply with tax regulations, accounting standards, and commercial regulations.
Identification of theft or inventory errors: The inventory helps identify any theft or inventory errors that may have occurred. It also helps in avoiding overstocks or shortages by efficiently managing the inventory.
Basis for financial reporting and analysis: The inventory provides data that is incorporated into the companys financial statements. This data is used for financial reporting and is relied upon by investors, creditors, and other stakeholders to assess the companys financial position and performance.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(2,'There are various types of inventory procedures used in companies. The selection of the appropriate procedure depends on the type of business, the size of the inventory, and the legal requirements. Here are some common inventory procedures:

Periodic inventory: In periodic inventory, the inventory is physically counted at specific intervals, such as monthly, quarterly, or annually.
Perpetual inventory: In perpetual inventory, the inventory is continuously and constantly monitored and updated throughout the year. This allows for regular and ongoing inventory tracking.
Cycle counting: Cycle counting involves counting a portion of the inventory on a regular basis, typically on a cycle or rotational basis. This helps ensure that the entire inventory is counted over a specified period of time.
ABC analysis: ABC analysis categorizes inventory items based on their value and importance. This helps prioritize inventory management efforts and focus on high-value items.
Just-in-time (JIT) inventory: JIT inventory management aims to minimize inventory levels by receiving goods from suppliers only when needed for production or customer orders. This reduces holding costs and improves efficiency.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(3,'The accuracy and completeness of the inventory can be ensured through various measures. Here are some ways:
Thorough preparation and planning
Use of inventory procedures
Careful physical inventory counting
Utilization of technological aids
Controls and plausibility checks
Independent verification
Documentation')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(4,'To improve the efficiency and accuracy of the inventory, companies can take various measures, including:
Thorough preparation and planning
Use of technological tools
Clear labeling and organization of the inventory
Regular audits
Documentation and traceability')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(5,'The inventory of a company typically includes various assets. These can vary depending on the type of business and industry, but typically include the following categories of assets:

Tangible assets: This includes buildings, land, machinery, vehicles, office furniture, and other physical assets used in the business operations.
Inventories: This includes raw materials, work-in-progress, and finished goods intended for sale or used in production.
Receivables: This category encompasses outstanding invoices and amounts owed to the company by customers and other individuals or businesses.
Investments and securities: This includes the companys investments in other companies, stocks, bonds, or other types of securities.
Cash and cash equivalents: This includes cash on hand, bank balances, checks, and other short-term liquid assets of the company.
Intellectual property: This category includes patents, trademarks, copyrights, and other intangible assets owned by the company that have financial value.
Other assets')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(6,'On the liabilities side of the balance sheet, you may find:
Current liabilities: This includes obligations that are due within one year or less, such as accounts payable, outstanding invoices, short-term loans or borrowings, and liabilities related to employee wages and salaries.
Long-term liabilities: This includes obligations that are due over a period of more than one year, such as long-term loans, mortgages, or bonds.
Provisions: These are liabilities that result from future obligations, such as provisions for warranties, pension obligations, tax provisions, or legal obligations.
Liabilities to employees: This includes liabilities related to employee wages, social security contributions, vacation entitlements, or other compensation obligations to employees.
Liabilities to other companies or individuals: This includes liabilities owed to suppliers, service providers, creditors, banks, or other creditors, such as outstanding invoices, loans, or lease obligations.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(7,'Yes, the inventory is typically updated and adjusted regularly.
Updating the inventory is important to ensure that the listed assets and liabilities are accurate and up to date.
The frequency of updating can vary depending on factors such as the nature of the business, the size of the company, and applicable legal requirements.

In general, there are certain occasions or events that require inventory updates:
Acquisition or sale of assets
Inventory or stocktaking
Changes in liabilities
Value adjustments

During these events, it is necessary to review and adjust the inventory to reflect any changes in assets, liabilities, or valuation. This helps maintain the accuracy and relevance of the inventory information for financial reporting, decision-making, and compliance purposes.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(8,'Assets
Liabilities
Equity
Liquidity
Asset Structure
Performance
Value Development
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(9,'A balance sheet is an important component of a companys financial statements and provides an overview of its financial position at a specific point in time. The asset side shows the companys assets, while the liability and equity side represents its liabilities and equity.

Balance Sheet Structure: The balance sheet structure shows the breakdown of assets, liabilities, and equity into various categories or sub-accounts. This allows for a more detailed analysis of the companys financial position and asset structure.
Liquidity: The balance sheet provides insights into the companys liquidity, which refers to its ability to meet short-term obligations. Indicators such as cash balance, short-term receivables, and short-term liabilities provide information about the companys liquidity position.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(10,'Fixed Assets: This includes buildings, land, machinery, vehicles, and other physical assets used in the business operations.
Intangible Assets: This encompasses intellectual property such as patents, licenses, trademarks, copyrights, software, and other non-physical assets that have an economic benefit to the company.
Inventory: Raw materials, work-in-progress, finished goods, merchandise, and other inventories held for production of goods or for sale.
Receivables: These are outstanding amounts that the company is yet to receive from customers or other parties.
Cash and Cash Equivalents: Cash, bank balances, checks, and other short-term, highly liquid assets that can be readily converted into cash.
Investments: Long-term investments.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(11,'Current Liabilities: Liabilities that are due within one year, such as accounts payable, creditors, short-term loans, credit card liabilities, and other short-term obligations.
Long-term Liabilities: Liabilities that are due for repayment after one year or more, such as long-term loans, bonds, mortgages, and other long-term obligations to creditors.
Equity
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(12,'The balance sheet is a financial statement that reflects the companys assets, liabilities, and equity positions at a specific point in time. The balance sheet structure consists of two main parts: the asset side (also known as the asset section) and the liability and equity side (also known as the capital section).
Asset Side: Fixed Assets: This is where long-term assets are recorded. Current Assets: This includes short-term assets.
Liability and Equity Side: Liabilities: This is where both short-term and long-term liabilities are recorded. Equity: This includes the capital contributed by the owners or shareholders of the company.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(13,'The equity comparison is an analytical method that involves comparing the equity of a company at different points in time to identify changes and trends in the companys financial position. It provides information about the financial stability, profitability, and growth potential of a company.

Information provided by equity comparison:

Changes in equity
Capital structure
Profitability
Growth potential
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(14,'An increase in equity is referred to as equity inflow or equity increase, while a decrease in equity is referred to as equity outflow or equity decrease.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(15,'The change in equity can have various reasons, including:

Profits or losses
Capital contributions or withdrawals
Capital increases or decreases
Dividend distributions
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(16,'Here are some common types of inventory accounts:

Inventory account
Raw material inventory account
Finished goods inventory account
Work-in-progress inventory account
Supplies inventory account
Material inventory account
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(17,'additions to inventory accounts are recorded on the debit side of the account.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(18,'reductions in inventory accounts are typically recorded on the credit side of the account.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(19,'Inventory accounts are linked to other accounts in accounting through interactions in transactions and entries.
Linkage with the cash account
Linkage with the sales account
Linkage with the supplier account
Linkage with the manufacturing account
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(20,'The general ledger is a central accounting document used to record and track business transactions in double-entry bookkeeping.

Documentation of business transactions
Evidence of account movements
Control instrument
Basis for financial statement preparation
Evidence for tax and legal purposes
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(21,'In the general ledger, various types of accounts are maintained, which differ from each other based on their function and purpose.
Inventory accounts
Income statement accounts
Auxiliary accounts
Private accounts: Private accounts are used to record transactions between the company and its owners or shareholders.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(22,'Entries in the general ledger are made to update the various accounts and document the financial transactions of a company. The recording of entries in the general ledger typically follows the "double-entry" principle of double-entry bookkeeping, where each transaction requires at least two entries - a debit entry and a credit entry.
The process of recording entries in the general ledger includes the following steps: identifying the transaction, making the debit and credit entries, making the offsetting entry, and documenting the transaction.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(23,'The general ledger is linked to other accounts in accounting through entries.
The linkage is accomplished through the principle of double-entry bookkeeping, where each transaction requires at least two entries - a debit entry and a credit entry.
Debit to Credit.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(24,'The general ledger is a central accounting document in which all business transactions of a company are systematically recorded. It serves as a kind of account overview and contains all the accounts of the company.
The general ledger has several important functions:

Account management
Documentation
Monitoring
Preparation of financial statements
Error identification and correction
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(25,'When recording a transaction in the general ledger, the following information is typically documented:

Date
Account number
Description
Amount
The entries are recorded according to the double-entry bookkeeping system, where each entry is assigned both a debit and a credit amount. These entries represent the exchange between the various accounts in the general ledger and keep the account balances up to date.

The documented journal entries in the general ledger serve to capture and track all the financial transactions of a company.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(26,'To identify and correct possible errors in the general ledger, the following measures can be taken:

Reconciliation of accounts
Control calculations
Review of the booking processes
Use of account reconciliation systems
Internal control measures
The specific steps for correction depend on the nature of the error. Typically, incorrect entries are reversed and replaced with correct entries. It is important to document all changes and corrections in a traceable manner and to record the reasons for the corrections.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(27,'An opening balance sheet is a balance sheet that is prepared at the beginning of a fiscal year or when starting a new business. It serves as the starting point for accounting for a specific period and reflects the financial position of the company at the beginning of that period.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(28,'A closing balance sheet is a balance sheet that is prepared at the end of a fiscal year or a specific accounting period. It summarizes the financial activities and transactions of the company during that period and provides information about the financial position of the company at the end of the period.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(29,'Profit and loss accounts are accounts in accounting used to record the revenues and expenses of a company during a specific business period. They are used to determine the profit or loss of the company and enable a detailed analysis of income and expenses.
The role of profit and loss accounts is to track and categorize the financial impacts of business activities. They allow a company to allocate its revenues, costs, and expenses to different accounts to obtain a better overview of its financial performance.
Profit and loss accounts can be divided into various categories:
Revenue accounts
Expense accounts
Profit and loss accounts
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(30,'evenue accounts: These accounts record the income or revenue from the sale of goods or the provision of services.
Sales revenue: Records the revenue from the sale of goods or services.
Interest income: Records interest income from investments or loans.
Commission income: Records commissions earned from the sale of products or services.

Expense accounts: These accounts record the costs and expenses incurred in the course of business operations.
Personnel costs: Records salaries, wages, social security contributions, and other costs related to personnel.
Material costs: Records the costs of purchasing or manufacturing materials.
Rental expenses: Records the costs of renting premises or equipment.
Advertising expenses: Records the costs of marketing and advertising activities.
Depreciation: Records the decrease in value of fixed assets over their useful life.
Interest expenses: Records the costs of borrowed funds or other financing costs.

Profit and loss accounts: These accounts are used at the end of the fiscal year to determine the profit or loss of the company.
Profit: Records the overall profit of the company.
Loss: Records the overall loss of the company.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(31,'Revenues:
Sales revenue
Interest income
Commission income

Expenses:
Personnel costs
Material costs
Rental expenses
Advertising expenses
Depreciation
Interest expenses
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(32,'Profits and losses are treated and recorded in the profit and loss accounts to capture the financial performance of a company.

Profits:
Profit from operating activities
Other gains

Losses:
Losses from operating activities
Other losses

The recording of profits and losses typically occurs at the end of an accounting period, such as the end of a fiscal year. Profits are debited and losses are credited to the respective profit and loss account.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(33,'Profit and loss accounts have a direct impact on the income statement of a company. The income statement is an important financial document that presents the revenues (income) and expenses (costs) of a company for a specific period, usually a fiscal year.
Sales revenue: Higher sales result in higher revenues and potentially higher profits.
Expense accounts: Higher expenses lead to lower revenues and potentially lower profits or even losses.
Profit and loss account: The balance of the profit and loss account directly affects the profit or loss reported in the income statement.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(34,'The profit and loss account (also known as the income statement or statement of earnings) is a central account in a companys accounting system. It is used to record all the revenues (income) and expenses (costs) of a company for a specific period, usually a fiscal year. The profit and loss account serves the following functions:
Recording of revenues
Recording of expenses
Determination of profit or loss
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(35,'Revenues:
Sales revenue
Interest income
Dividend income
Rental income
Commissions

Expenses:
Personnel costs
Material costs
Rent and leasing expenses
Marketing and advertising expenses
Interest expenses
Taxes
Depreciation')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(36,'The basic formula for the income statement is:
Profit/Loss = Revenues - Expenses

The basic steps to determine profit or loss are:
Summing up revenues
Summing up expenses
Determining profit or loss
By subtracting total expenses from total revenues, the profit or loss is calculated. If revenues exceed expenses, there is a profit. If expenses exceed revenues, there is a loss.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(37,'Profit or loss
Sales revenue
Costs and expenses
Gross profit
Operating income
Taxes and net income
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(38,'Depreciation is an important accounting practice that allows for the recognition of the decrease in value of assets over their useful lives.
Here are the reasons why depreciation is important in accounting:

Bilancial Accuracy
Timely Cost Allocation
Profit Determination
Tax Implications
Investment Decisions
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(39,'Linear depreciation: In linear depreciation, the decrease in value of an asset is distributed evenly over its useful life. This means that the same amount of depreciation expense is recognized in each accounting period.
Declining balance depreciation: Declining balance depreciation allows for a higher depreciation expense at the beginning of the assets useful life, with a gradual reduction in subsequent years. This method recognizes that assets often lose value more rapidly in their early years of use.
Unit-of-production depreciation: Unit-of-production depreciation captures the decrease in value of an asset based on its actual usage or production output. Under this method, the depreciation expense is directly tied to the assets usage, such as the number of units produced or hours of operation.
-
In the income statement, depreciations are recorded as expenses. They decrease the profit of a company since they reflect the decrease in value of assets over their useful life.
In the balance sheet, depreciations affect the asset values. The book value of an asset is reduced by the amount of depreciation. As a result, the balance sheet reflects the actual value of the asset at a given point in time.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(40,'Choice of depreciation method
Utilization of special depreciation
Identification of tax-favored assets
Timing of investments')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(41,'Standard tax rate: The standard tax rate is the general tax rate applied to most goods and services. It varies from country to country and can, for example, be 19%, 20%, or 21%.
Reduced tax rate: A reduced tax rate is often applied to certain goods and services considered essential or in the public interest. These may include items such as food, books, medication, or public transportation. The reduced tax rate is generally lower than the standard tax rate.
Zero tax rate: Some countries impose a zero tax rate on certain goods and services, meaning no sales tax is charged for these products. Examples of items that may fall under the zero tax rate include exported goods or certain financial services.
Special tax rates: In some cases, special tax rates may apply to specific industries or products. For example, tobacco products, alcohol, fuels, or luxury goods may have higher tax rates.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(42,'The application of sales tax rates is done by the seller or service provider, who calculates the sales tax in the sale price or invoice issued to the customer. The seller is obligated to remit the collected sales tax to the relevant tax authority. The customer, who acquires the products or services, pays the corresponding tax amount as part of the purchase price.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(43,'Input tax, also known as VAT input or pre-tax, is the amount of value-added tax paid by a company for purchases and business expenses. It represents the VAT charged on the purchase price of goods or services. The input tax can be offset by the company as a prepayment against the VAT liability it receives from its customers.
The calculation of the VAT amount that a company must remit to the tax authorities is typically done by taking the difference between the VAT collected from its customers and the input tax paid for its own purchases. If the input tax exceeds the amount of VAT collected, an excess amount is obtained, which is refunded to the company.
')
INSERT INTO Rueckmeldung(AGS_id,Rueck_Text) VALUES(44,'Liquiditätsanalyse: The analysis of VAT payments and input tax refunds can provide insights into the liquidity situation of a company. If a company makes regular high VAT payments, it can impact its liquidity.
Steuerplanung: By effectively utilizing input tax refunds, a company can reduce its tax burden and improve its financial performance.
Kostenanalyse: The analysis of input tax can provide insights into the cost structure of a company.
Compliance and risk management: This helps to avoid financial risks such as penalties and interest.')