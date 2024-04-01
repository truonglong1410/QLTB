CREATE DATABASE QLThietBi;

USE QLThietBi;

CREATE TABLE AssetGroup (
  ID BIGINT PRIMARY KEY,
  Code NVARCHAR(MAX),
  Name NVARCHAR(MAX),
  Description NVARCHAR(MAX),
  CreatedDate TIMESTAMP,
  CreatedBy NVARCHAR(MAX),
  UpdatedDate TIMESTAMP,
  UpdatedBy NVARCHAR(MAX)
);

CREATE TABLE AssetAttributes (
  ID BIGINT PRIMARY KEY,
  [Key] NVARCHAR(MAX),
  Value NVARCHAR(MAX),
  CreatedDate TIMESTAMP,
  CreatedBy NVARCHAR(MAX),
  UpdatedDate TIMESTAMP,
  UpdatedBy NVARCHAR(MAX)
);

CREATE TABLE Assets (
  ID BIGINT PRIMARY KEY,
  SKU BIGINT,
  Name NVARCHAR(MAX),
  PurchaseDate DATETIME,
  Price MONEY,
  Description TEXT,
  GroupID BIGINT,
  CreatedBy NVARCHAR(MAX),
  CreatedDate TIMESTAMP,
  UpdateBy NVARCHAR(MAX),
  UpdateDate TIMESTAMP,
  FOREIGN KEY (GroupID) REFERENCES AssetGroup(ID)
);

CREATE TABLE Transactions (
  ID BIGINT PRIMARY KEY,
  AssetID BIGINT,
  UserID BIGINT,
  Notes NVARCHAR(MAX),
  DateOfDelivery DATETIME,
  StatusOfAsset NVARCHAR(MAX),
  FOREIGN KEY (AssetID) REFERENCES Assets(ID),
  FOREIGN KEY (UserID) REFERENCES Users(ID)
);

CREATE TABLE AssetValues (
  ID BIGINT PRIMARY KEY,
  AssetID BIGINT,
  AttributeID BIGINT,
  Value NVARCHAR(MAX),
  CreatedDate TIMESTAMP,
  CreatedBy NVARCHAR(MAX),
  UpdatedDate TIMESTAMP,
  UpdatedBy NVARCHAR(MAX),
  FOREIGN KEY (AssetID) REFERENCES Assets(ID),
  FOREIGN KEY (AttributeID) REFERENCES AssetAttributes(ID)
);

CREATE TABLE Users (
  ID BIGINT PRIMARY KEY,
  Username NVARCHAR(MAX),
  Pass NVARCHAR(MAX),
  Email NVARCHAR(MAX),
  Firstname NVARCHAR(MAX),
  Lastname NVARCHAR(MAX),
  ActivationKey NVARCHAR(MAX),
  Status NVARCHAR(MAX),
  DateRegistered DATETIME,
  LastLogin DATETIME,
  UpdatedBy NVARCHAR(MAX),
  UpdatedDate TIMESTAMP
);

CREATE TABLE UserRoles (
  ID BIGINT PRIMARY KEY,
  UserID BIGINT,
  RoleID BIGINT,
  FOREIGN KEY (UserID) REFERENCES Users(ID),
  FOREIGN KEY (RoleID) REFERENCES URoles(ID)
);

CREATE TABLE UserMeta (
  ID BIGINT PRIMARY KEY,
  UserID BIGINT,
  [Key] NVARCHAR(MAX),
  [Value] NVARCHAR(MAX),
  FOREIGN KEY (UserID) REFERENCES Users(ID)
);

CREATE TABLE URoles (
  ID BIGINT PRIMARY KEY,
  Code NVARCHAR(MAX),
  Name NVARCHAR(MAX),
  Status NVARCHAR(MAX),
  Description NVARCHAR(MAX),
  CreatedDate TIMESTAMP,
  CreatedBy NVARCHAR(MAX),
  UpdatedDate TIMESTAMP,
  UpdatedBy NVARCHAR(MAX)
);
