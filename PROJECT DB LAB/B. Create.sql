CREATE DATABASE FlexPhone
GO
USE Flexphone
GO

--PHONEBRAND
CREATE TABLE PhoneBrand (
	PhoneBrandID CHAR(5) PRIMARY KEY CHECK(PhoneBrandID LIKE 'PB[0-9][0-9][0-9]'),
	PhoneBrandName VARCHAR(50)NOT NULL
)

--PHONE
CREATE TABLE Phone (
	PhoneID CHAR(5) PRIMARY KEY CHECK(PhoneID LIKE 'PO[0-9][0-9][0-9]'),
	PhoneBrandID CHAR(5) FOREIGN KEY REFERENCES PhoneBrand(PhoneBrandID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PhoneName VARCHAR(50) NOT NULL,
	PhonePrice INT NOT NULL
)

CREATE TABLE MsStaff (
	StaffID CHAR(5) PRIMARY KEY CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName CHAR(50) NOT NULL,
	StaffEmail VARCHAR(50) CHECK((StaffEmail LIKE '%@bluejack.com') OR (StaffEmail LIKE '%@sunib.edu')),
	StaffDateOfBirth DATE CHECK(YEAR(StaffDateOfBirth)>=1960),
	StaffGender CHAR(10) CHECK(StaffGender IN ('Male', 'Female')),
	StaffPhoneNumber VARCHAR(20) NOT NULL,
	StaffAddress VARCHAR(50) NOT NULL,
	StaffSalary INT NOT NULL,
)

CREATE TABLE MsVendor (
	VendorID CHAR(5) PRIMARY KEY CHECK(VendorID LIKE 'VE[0-9][0-9][0-9]'),
	VendorName VARCHAR(50) NOT NULL,
	VendorEmail VARCHAR(50) CHECK((VendorEmail LIKE '%@bluejack.com') OR (VendorEmail LIKE '%@sunib.edu')),
	VendorPhoneNumber VARCHAR(20) NOT NULL,
	VendorAddress VARCHAR(50) NOT NULL,
)

CREATE TABLE MsCustomer (
	CustomerID CHAR(5) PRIMARY KEY CHECK(CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(50) CHECK(LEN(CustomerName) > 3),
	CustomerEmail VARCHAR(50) CHECK((CustomerEmail LIKE '%@bluejack.com') OR (CustomerEmail LIKE '%@sunib.edu')),
	CustomerDateOfBirth DATE NOT NULL,
	CustomerGender CHAR(10) CHECK(CustomerGender IN ('Male', 'Female')),
	CustomerPhoneNumber VARCHAR(20) NOT NULL,
	CustomerAddress VARCHAR(50) NOT NULL,
)

CREATE TABLE SalesTransactionHeader(
	SalesTransactionID CHAR(5) PRIMARY KEY CHECK(SalesTransactionID LIKE 'SH[0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CustomerID CHAR(5) FOREIGN KEY REFERENCES MsCustomer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	TransactionDate DATE NOT NULL,
)

CREATE TABLE SalesTransactionDetail(
	CustomerTransactionID CHAR(5) PRIMARY KEY CHECK (CustomerTransactionID LIKE 'CT[0-9][0-9][0-9]'),
	SalesTransactionID CHAR(5) FOREIGN KEY REFERENCES SalesTransactionHeader(SalesTransactionID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PhoneID CHAR(5) FOREIGN KEY REFERENCES Phone(PhoneID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Quantity INT NOT NULL,
)

CREATE TABLE PurchaseTransactionHeader(
	PurchaseTransactionID CHAR(5) PRIMARY KEY CHECK(PurchaseTransactionID LIKE 'PH[0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	VendorID CHAR(5) FOREIGN KEY REFERENCES MsVendor(VendorID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PhonePurchased VARCHAR(50) NOT NULL,
)

CREATE TABLE PurchaseTransactionDetail(
	StaffTransactionID CHAR(5) PRIMARY KEY CHECK (StaffTransactionID LIKE 'SR[0-9][0-9][0-9]'),
	PurchaseTransactionID CHAR(5) FOREIGN KEY REFERENCES PurchaseTransactionHeader(PurchaseTransactionID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PhoneID CHAR(5) FOREIGN KEY REFERENCES Phone(PhoneID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Quantity INT NOT NULL,
)

DROP DATABASE FlexPhone
ROLLBACK

COMMIT

