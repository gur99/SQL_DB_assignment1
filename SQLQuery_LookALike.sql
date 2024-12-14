
-- -- CREATE TABLE tblItemType(
-- --     typeName NVARCHAR(40) NOT NULL,
-- --     PRIMARY KEY (typeName) 
-- -- )

-- -- CREATE TABLE tblBrand(
-- --     brandName VARCHAR(40) NOT NULL,
-- --     brandId INT IDENTITY(1,1),
-- --     PRIMARY KEY (brandId)
-- -- )

-- -- CREATE TABLE tblUser(
-- --     userId INT IDENTITY(1,1),
-- --     nickName NVARCHAR(40) UNIQUE,
-- --     email NVARCHAR(40) NOT NULL,
-- --     passwrd NVARCHAR(40) NOT NULL,
-- --     firstName NVARCHAR(40) NOT NULL,
-- --     surName NVARCHAR(40) NOT NULL,
-- --     profilePic VARBINARY,
-- --     phoneNumber VARCHAR(40),
-- --     birthDate DATE, 
-- --     -- age>=18
-- --     PRIMARY KEY (userId)
-- -- )


-- -- CREATE TABLE tblClothingItem(
-- --     userId INT FOREIGN KEY REFERENCES tblUser(userId),
-- --     itemId INT IDENTITY(1,1),
-- --     typeName NVARCHAR(40) FOREIGN KEY REFERENCES tblItemType(typeName),
-- --     brandId INT FOREIGN KEY REFERENCES tblBrand(brandId),
-- --     itemName NVARCHAR(40),
-- --     picture VARBINARY,
-- --     ColorCode CHAR(7) NOT NULL CHECK (ColorCode LIKE '#[0-9A-Fa-f]{6}'),
-- --     -- season VARCHAR(10) NOT NULL CHECK(season in('summer','winter','spring','fall')) ,
-- --     size VARCHAR(3) NOT NULL CHECK (size in('s','m','l','xl','xxl','os')),
-- --     purchasedPrice FLOAT NOT NULL,
-- --     isFavorit BIT DEFAULT(0),
-- --     usageStatus INT NOT NULL CHECK(usageStatus in (1,2,3)), 
-- --     PRIMARY KEY (userId,itemId)
-- -- )

-- -- CREATE TABLE tblSeasons(
-- --     userId INT FOREIGN KEY REFERENCES tblUser(userId)on delete cascade on update cascade,
-- --     season VARCHAR(10) NOT NULL CHECK(season in('summer','winter','spring','fall')),

-- --     PRIMARY KEY(userId,season)
-- -- )

-- -- CREATE TABLE tblDeliveryMessage(
-- --     deliveryId INT IDENTITY(1,1),
-- --     creationDate DATE NOT NULL DEFAULT(GETDATE()),
-- --     pickUpAddress NVARCHAR(40) NOT NULL,
-- --     messageStatus BIT NOT NULL DEFAULT(0),
-- --     pickUpDate DATE,
-- --     userId INT NOT NULL,
-- --     itemId INT NOT NULL,
-- --     -- Cant be before creationDate
-- --     CONSTRAINT FK_tblDeliveryMessage_ClothingItem FOREIGN KEY (userId, itemId)
-- --         REFERENCES tblClothingItem(userId, itemId),

-- --     PRIMARY KEY(deliveryId)
-- -- )
-- -- CREATE TABLE tblPublish(
-- --     deliveryId INT FOREIGN KEY REFERENCES tblDeliveryMessage(deliveryId),
-- --     userId INT FOREIGN KEY REFERENCES tblUser(userId),

-- --     PRIMARY KEY(deliveryId)
-- -- )

-- -- CREATE TABLE tblFollow(
-- --     userId INT FOREIGN KEY REFERENCES tblUser(userId),
-- --     followerId INT FOREIGN KEY REFERENCES tblUser(userId),

-- --     PRIMARY KEY (userId,followerId)
-- -- )



-- -- CREATE TABLE tblManualLook(
-- --     lookId INT IDENTITY(1,1),
-- --     creationDate DATE NOT NULL,
-- --     share BIT DEFAULT(0),
-- --     note NVARCHAR(40),

-- --     PRIMARY KEY(lookId)
-- -- )

-- -- CREATE TABLE tblRecommendedLook(
-- --     lookId INT IDENTITY(1,1),
-- --     creationDate DATE NOT NULL,
-- --     share BIT DEFAULT(0),
-- --     rate INT NOT NULL CHECK(rate in(1,2,3,4,5)),
-- --     feedback NVARCHAR(40),
-- --     PRIMARY KEY(lookId)
-- -- )

-- -- CREATE TABLE tblBelongs(
-- --     manualLookId INT,
-- --     recommendedLookId INT,
-- --     itemId INT,
-- --     userId INT,

-- -- CONSTRAINT FK_ClothingItem FOREIGN KEY (userId,itemId)
-- --         REFERENCES tblClothingItem(userId,itemId),

-- -- CONSTRAINT FK_BelongsRecommendedLook FOREIGN KEY (recommendedLookId)
-- --         REFERENCES tblRecommendedLook(lookId),

-- -- CONSTRAINT FK_BelongsManualLook FOREIGN KEY (manualLookId)
-- --         REFERENCES tblRecommendedLook(lookId),
               
-- --     PRIMARY KEY(manualLookId,recommendedLookId,itemId,userId)
-- -- )

-- -- CREATE TABLE tblBusinessUser(
-- --     userId INT IDENTITY(1,1),
-- --     nickName NVARCHAR(40) NOT NULL,
-- --     email NVARCHAR(40) NOT NULL,
-- --     passwrd NVARCHAR(40) NOT NULL,
-- --     firstName NVARCHAR(40) NOT NULL,
-- --     surName NVARCHAR(40) NOT NULL,
-- --     profilePic VARBINARY,
-- --     phoneNumber VARCHAR(40),
-- --     birthDate DATE, 
-- --     -- age>=18
-- --     instagramLink NVARCHAR(40),

-- --     PRIMARY KEY (userId)
-- -- )


-- -- CREATE TABLE tblPopUpEvent(
-- --     eventId INT IDENTITY(1,1),
-- --     userId INT FOREIGN KEY REFERENCES tblBusinessUser(userId),
-- --     eventName NVARCHAR (40),
-- --     openingDate DATE,
-- --     finishingDate  DATE,
-- --     -- Event cannot be less than 1 day
-- --     collectingAddress NVARCHAR(40),

-- --     PRIMARY KEY(eventId)
-- -- )

-- -- CREATE TABLE tblForSale(
-- --     eventId INT FOREIGN KEY REFERENCES tblPopUpEvent(eventId),
-- --     itemId INT ,
-- --     userId INT ,
-- --     price FLOAT NOT NULL,
-- --     isSold BIT NOT NULL DEFAULT(0),

-- --     CONSTRAINT FK_clothingItem_ForSale FOREIGN KEY (userId,itemId)
-- --     REFERENCES tblClothingItem(userId,itemId),

-- --     PRIMARY KEY (eventId,itemId,userId)
-- -- )

-- CREATE TABLE tblPurchase(
--     eventId INT FOREIGN KEY REFERENCES tblPopUpEvent(eventId),
--     itemId INT,
--     userId INT,
--     buyerUserId INT FOREIGN KEY REFERENCES tblUser(userId),
    
-- CONSTRAINT FK_ClothingItem_Purchase FOREIGN KEY(userId,itemId) 
-- REFERENCES tblClothingItem(userId,itemId),

--     PRIMARY KEY (eventId,itemId,userId)
-- )
-- --------------------------------------------------------------------------------------