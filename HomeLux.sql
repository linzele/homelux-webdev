CREATE DATABASE HOMELUX;
USE HOMELUX;

DROP TABLE IF EXISTS UserProfiles, UserAccounts, Properties, SavedListings, Reviews, Ratings;

CREATE TABLE UserProfiles(
	roleName VARCHAR(30) PRIMARY KEY,
    roleDesc TEXT,
	viewListing BOOL ,
    saveListing BOOL,
    searchListing BOOL,
    createListing BOOL,
    updateListing BOOL,
    suspendListing BOOL,
    rateAgent BOOL,
    reviewAgent BOOL,
    viewRatings BOOL,
    viewReviews BOOL,
    login BOOL
);

CREATE TABLE UserAccounts(
	username VARCHAR(255) PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    hashedPW VARCHAR(255) NOT NULL,
    roleName VARCHAR(30),
    isSuspended BOOL DEFAULT FALSE,
    
    FOREIGN KEY (roleName) REFERENCES UserProfiles(roleName)
);

CREATE TABLE Properties(
 agentUsername VARCHAR(255) NOT NULL,
    sellerUsername VARCHAR(255) NOT NULL,
    
    address VARCHAR(255) NOT NULL,
    postalCode VARCHAR(255) NOT NULL,
    unitNumber VARCHAR(255) NOT NULL,
        
    descriptions TEXT,
    thumbnail VARCHAR(255),
    bedrooms INT NOT NULL,
    bathrooms INT NOT NULL,
    
    sqft DECIMAL(10,2) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    pricePerSqft DECIMAL (10, 2),
    
    isSold BOOL NOT NULL,
    
    PRIMARY KEY (postalCode, unitNumber),
    FOREIGN KEY (sellerUsername) REFERENCES UserAccounts(username),
    FOREIGN KEY (agentUsername) REFERENCES UserAccounts(username)
);

CREATE TABLE SavedListings(
    username VARCHAR(255),
    postalCode VARCHAR (255),
    unitNumber VARCHAR (255),
    PRIMARY KEY (username, postalCode, unitNumber),
    FOREIGN KEY (username) REFERENCES UserAccounts(username),
    FOREIGN KEY (postalCode, unitNumber) REFERENCES Properties(postalCode, unitNumber)
);

CREATE TABLE Reviews(
    reviewID INT AUTO_INCREMENT PRIMARY KEY,
    agentUsername VARCHAR(255) NOT NULL,
    reviewer VARCHAR(255),
    reviewDescription TEXT,
    reviewDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (agentUsername) REFERENCES UserAccounts(username),
    FOREIGN KEY (reviewer) REFERENCES UserAccounts(username)
);

CREATE TABLE Ratings(
    ratingID INT AUTO_INCREMENT PRIMARY KEY,
    agentUsername VARCHAR(255) NOT NULL,
    rater VARCHAR(255),
    stars INT NOT NULL CHECK (stars BETWEEN 1 AND 5),
	ratingDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (agentUsername) REFERENCES UserAccounts(username),
    FOREIGN KEY (rater) REFERENCES UserAccounts(username)
);

INSERT INTO UserProfiles (roleName, roleDesc, viewListing, saveListing, searchListing, createListing, updateListing, suspendListing, rateAgent, reviewAgent, viewRatings, viewReviews, login)VALUES
('buyer', 'Can view, save, search listings, and review agents', TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, TRUE),
('seller', 'Can create, update, and remove their listings', TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, TRUE),
('agent', 'Can manage listings and reviewed by others', TRUE, FALSE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, TRUE),
('admin', 'Can do everything', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE);

SELECT * FROM UserProfiles;
SELECT * FROM UserAccounts;
SELECT * FROM Properties;
SELECT * FROM SavedListings;
SELECT * FROM Reviews;
SELECT * FROM Ratings;

/* Insert into UA */
INSERT INTO UserAccounts (username, email, hashedPW, roleName, isSuspended) VALUES

('joseph', 'joseph@example.com', 'joseph', 'buyer', FALSE),
('perry', 'perry@example.com', 'perry', 'seller', FALSE),
('ben', 'ben@example.com', 'ben', 'agent', FALSE),
('buyer1', 'buyer1@example.com', 'hashedPW1', 'buyer', FALSE),
('buyer2', 'buyer2@example.com', 'hashedPW2', 'buyer', FALSE),
('buyer3', 'buyer3@example.com', 'hashedPW3', 'buyer', FALSE),
('buyer4', 'buyer4@example.com', 'hashedPW4', 'buyer', FALSE),
('buyer5', 'buyer5@example.com', 'hashedPW5', 'buyer', FALSE),
('buyer6', 'buyer6@example.com', 'hashedPW6', 'buyer', FALSE),
('buyer7', 'buyer7@example.com', 'hashedPW7', 'buyer', FALSE),
('buyer8', 'buyer8@example.com', 'hashedPW8', 'buyer', FALSE),
('buyer9', 'buyer9@example.com', 'hashedPW9', 'buyer', FALSE),
('buyer10', 'buyer10@example.com', 'hashedPW10', 'buyer', FALSE),
('buyer11', 'buyer11@example.com', 'hashedPW11', 'buyer', FALSE),
('buyer12', 'buyer12@example.com', 'hashedPW12', 'buyer', FALSE),
('buyer13', 'buyer13@example.com', 'hashedPW13', 'buyer', FALSE),
('buyer14', 'buyer14@example.com', 'hashedPW14', 'buyer', FALSE),
('buyer15', 'buyer15@example.com', 'hashedPW15', 'buyer', FALSE),
('buyer16', 'buyer16@example.com', 'hashedPW16', 'buyer', FALSE),
('buyer17', 'buyer17@example.com', 'hashedPW17', 'buyer', FALSE),
('buyer18', 'buyer18@example.com', 'hashedPW18', 'buyer', FALSE),
('buyer19', 'buyer19@example.com', 'hashedPW19', 'buyer', FALSE),
('buyer20', 'buyer20@example.com', 'hashedPW20', 'buyer', FALSE),
('buyer21', 'buyer21@example.com', 'hashedPW21', 'buyer', FALSE),
('buyer22', 'buyer22@example.com', 'hashedPW22', 'buyer', FALSE),
('buyer23', 'buyer23@example.com', 'hashedPW23', 'buyer', FALSE),
('buyer24', 'buyer24@example.com', 'hashedPW24', 'buyer', FALSE),
('buyer25', 'buyer25@example.com', 'hashedPW25', 'buyer', FALSE),
('seller1', 'seller1@example.com', 'hashedPW26', 'seller', FALSE),
('seller2', 'seller2@example.com', 'hashedPW27', 'seller', FALSE),
('seller3', 'seller3@example.com', 'hashedPW28', 'seller', FALSE),
('seller4', 'seller4@example.com', 'hashedPW29', 'seller', FALSE),
('seller5', 'seller5@example.com', 'hashedPW30', 'seller', FALSE),
('seller6', 'seller6@example.com', 'hashedPW31', 'seller', FALSE),
('seller7', 'seller7@example.com', 'hashedPW32', 'seller', FALSE),
('seller8', 'seller8@example.com', 'hashedPW33', 'seller', FALSE),
('seller9', 'seller9@example.com', 'hashedPW34', 'seller', FALSE),
('seller10', 'seller10@example.com', 'hashedPW35', 'seller', FALSE),
('seller11', 'seller11@example.com', 'hashedPW36', 'seller', FALSE),
('seller12', 'seller12@example.com', 'hashedPW37', 'seller', FALSE),
('seller13', 'seller13@example.com', 'hashedPW38', 'seller', FALSE),
('seller14', 'seller14@example.com', 'hashedPW39', 'seller', FALSE),
('seller15', 'seller15@example.com', 'hashedPW40', 'seller', FALSE),
('seller16', 'seller16@example.com', 'hashedPW41', 'seller', FALSE),
('seller17', 'seller17@example.com', 'hashedPW42', 'seller', FALSE),
('seller18', 'seller18@example.com', 'hashedPW43', 'seller', FALSE),
('seller19', 'seller19@example.com', 'hashedPW44', 'seller', FALSE),
('seller20', 'seller20@example.com', 'hashedPW45', 'seller', FALSE),
('seller21', 'seller21@example.com', 'hashedPW46', 'seller', FALSE),
('seller22', 'seller22@example.com', 'hashedPW47', 'seller', FALSE),
('seller23', 'seller23@example.com', 'hashedPW48', 'seller', FALSE),
('seller24', 'seller24@example.com', 'hashedPW49', 'seller', FALSE),
('seller25', 'seller25@example.com', 'hashedPW50', 'seller', FALSE),
('agent1', 'agent1@example.com', 'hashedPW51', 'agent', FALSE),
('agent2', 'agent2@example.com', 'hashedPW52', 'agent', FALSE),
('agent3', 'agent3@example.com', 'hashedPW53', 'agent', FALSE),
('agent4', 'agent4@example.com', 'hashedPW54', 'agent', FALSE),
('agent5', 'agent5@example.com', 'hashedPW55', 'agent', FALSE),
('agent6', 'agent6@example.com', 'hashedPW56', 'agent', FALSE),
('agent7', 'agent7@example.com', 'hashedPW57', 'agent', FALSE),
('agent8', 'agent8@example.com', 'hashedPW58', 'agent', FALSE),
('agent9', 'agent9@example.com', 'hashedPW59', 'agent', FALSE),
('agent10', 'agent10@example.com', 'hashedPW60', 'agent', FALSE),
('agent11', 'agent11@example.com', 'hashedPW61', 'agent', FALSE),
('agent12', 'agent12@example.com', 'hashedPW62', 'agent', FALSE),
('agent13', 'agent13@example.com', 'hashedPW63', 'agent', FALSE),
('agent14', 'agent14@example.com', 'hashedPW64', 'agent', FALSE),
('agent15', 'agent15@example.com', 'hashedPW65', 'agent', FALSE),
('agent16', 'agent16@example.com', 'hashedPW66', 'agent', FALSE),
('agent17', 'agent17@example.com', 'hashedPW67', 'agent', FALSE),
('agent18', 'agent18@example.com', 'hashedPW68', 'agent', FALSE),
('agent19', 'agent19@example.com', 'hashedPW69', 'agent', FALSE),
('agent20', 'agent20@example.com', 'hashedPW70', 'agent', FALSE),
('agent21', 'agent21@example.com', 'hashedPW71', 'agent', FALSE),
('agent22', 'agent22@example.com', 'hashedPW72', 'agent', FALSE),
('agent23', 'agent23@example.com', 'hashedPW73', 'agent', FALSE),
('agent24', 'agent24@example.com', 'hashedPW74', 'agent', FALSE),
('agent25', 'agent25@example.com', 'hashedPW75', 'agent', FALSE),
('buyer26', 'buyer26@example.com', 'hashedPW76', 'buyer', FALSE),
('buyer27', 'buyer27@example.com', 'hashedPW77', 'buyer', FALSE),
('buyer28', 'buyer28@example.com', 'hashedPW78', 'buyer', FALSE),
('buyer29', 'buyer29@example.com', 'hashedPW79', 'buyer', FALSE),
('buyer30', 'buyer30@example.com', 'hashedPW80', 'buyer', FALSE),
('seller26', 'seller26@example.com', 'hashedPW81', 'seller', FALSE),
('seller27', 'seller27@example.com', 'hashedPW82', 'seller', FALSE),
('seller28', 'seller28@example.com', 'hashedPW83', 'seller', FALSE),
('seller29', 'seller29@example.com', 'hashedPW84', 'seller', FALSE),
('seller30', 'seller30@example.com', 'hashedPW85', 'seller', FALSE),
('agent26', 'agent26@example.com', 'hashedPW86', 'agent', FALSE),
('agent27', 'agent27@example.com', 'hashedPW87', 'agent', FALSE),
('agent28', 'agent28@example.com', 'hashedPW88', 'agent', FALSE),
('agent29', 'agent29@example.com', 'hashedPW89', 'agent', FALSE),
('agent30', 'agent30@example.com', 'hashedPW90', 'agent', FALSE);


/* Insert into Properties */


INSERT INTO Properties (
    agentUsername,
    sellerUsername,
    address,
    postalCode,
    unitNumber,
    descriptions,
    thumbnail,
    bedrooms,
    bathrooms,
    sqft,
    price,
    pricePerSqft,
    isSold
) VALUES

('lincoln', 'janice', '123 Maple Street', '12345', 'Unit 1A', 'Charming 2-bedroom condo in the heart of the city.', 'thumbnail1.jpg', 2, 1, 950.00, 350000.00, 368.42, FALSE),
('ben', 'ada', '456 Oak Avenue', '67890', 'Unit 2B', 'Spacious 3-bedroom apartment with a beautiful view.', 'thumbnail2.jpg', 3, 2, 1200.00, 480000.00, 400.00, FALSE),
('agent26', 'janice', '789 Pine Lane', '11223', 'Unit 3C', 'Modern 1-bedroom loft with high ceilings and great amenities.', 'thumbnail3.jpg', 1, 1, 750.00, 300000.00, 400.00, FALSE),
('agent27', 'ada', '321 Cedar Road', '44556', 'Unit 4D', 'Cozy 2-bedroom house with a large backyard.', 'thumbnail4.jpg', 2, 1, 1100.00, 275000.00, 250.00, FALSE),
('agent28', 'janice', '654 Birch Boulevard', '77889', 'Unit 5E', 'Luxurious 4-bedroom villa with a private pool.', 'thumbnail5.jpg', 4, 3, 2500.00, 1250000.00, 500.00, FALSE),
('agent29', 'ada', '100 Elm Street', '22334', 'Unit 6A', 'Bright 2-bedroom apartment with city views.', 'thumbnail6.jpg', 2, 1, 900.00, 360000.00, 400.00, FALSE),
('agent30', 'janice', '200 Maple Avenue', '22334', 'Unit 7B', 'Renovated 3-bedroom house with a modern kitchen.', 'thumbnail7.jpg', 3, 2, 1500.00, 600000.00, 400.00, FALSE),
('lincoln', 'ada', '300 Oak Boulevard', '33445', 'Unit 8C', 'Spacious 4-bedroom home with a large garden.', 'thumbnail8.jpg', 4, 3, 2000.00, 800000.00, 400.00, FALSE),
('ben', 'janice', '400 Pine Road', '33445', 'Unit 9D', 'Cozy 1-bedroom apartment in a quiet neighborhood.', 'thumbnail9.jpg', 1, 1, 700.00, 280000.00, 400.00, FALSE),
('agent26', 'ada', '500 Cedar Drive', '44556', 'Unit 10E', 'Modern 2-bedroom loft with high ceilings.', 'thumbnail10.jpg', 2, 1, 950.00, 380000.00, 400.00, FALSE),
('agent27', 'janice', '600 Birch Lane', '55667', 'Unit 11A', 'Luxurious 3-bedroom condo with a private balcony.', 'thumbnail11.jpg', 3, 2, 1300.00, 520000.00, 400.00, FALSE),
('agent28', 'ada', '700 Spruce Street', '55667', 'Unit 12B', 'Charming 2-bedroom house with a white picket fence.', 'thumbnail12.jpg', 2, 1, 1100.00, 440000.00, 400.00, FALSE),
('agent29', 'janice', '800 Redwood Avenue', '66778', 'Unit 13C', 'Spacious 4-bedroom villa with a pool.', 'thumbnail13.jpg', 4, 3, 2500.00, 1000000.00, 400.00, FALSE),
('agent30', 'ada', '900 Ash Boulevard', '66778', 'Unit 14D', 'Modern 1-bedroom apartment with a city view.', 'thumbnail14.jpg', 1, 1, 800.00, 320000.00, 400.00, FALSE),
('lincoln', 'janice', '1000 Poplar Road', '77889', 'Unit 15E', 'Cozy 3-bedroom townhouse with a garage.', 'thumbnail15.jpg', 3, 2, 1400.00, 560000.00, 400.00, FALSE),
('ben', 'ada', '1100 Fir Lane', '77889', 'Unit 16A', 'Bright 2-bedroom apartment with a modern interior.', 'thumbnail16.jpg', 2, 1, 1000.00, 400000.00, 400.00, FALSE),
('agent26', 'janice', '1200 Palm Street', '88990', 'Unit 17B', 'Spacious 3-bedroom house with a large backyard.', 'thumbnail17.jpg', 3, 2, 1600.00, 640000.00, 400.00, FALSE),
('agent27', 'ada', '1300 Willow Avenue', '88990', 'Unit 18C', 'Modern 4-bedroom villa with ocean views.', 'thumbnail18.jpg', 4, 3, 3000.00, 1200000.00, 400.00, FALSE),
('agent28', 'janice', '1400 Cypress Boulevard', '99001', 'Unit 19D', 'Cozy 1-bedroom loft with lots of light.', 'thumbnail19.jpg', 1, 1, 650.00, 260000.00, 400.00, FALSE),
('agent29', 'ada', '1500 Aspen Road', '99001', 'Unit 20E', 'Renovated 2-bedroom apartment in a prime location.', 'thumbnail20.jpg', 2, 1, 850.00, 340000.00, 400.00, FALSE),
('agent30', 'janice', '1600 Alder Lane', '11112', 'Unit 21A', 'Spacious 3-bedroom house with modern amenities.', 'thumbnail21.jpg', 3, 2, 1700.00, 680000.00, 400.00, FALSE),
('lincoln', 'ada', '1700 Beech Street', '11112', 'Unit 22B', 'Luxurious 4-bedroom condo with a rooftop terrace.', 'thumbnail22.jpg', 4, 3, 2200.00, 880000.00, 400.00, FALSE),
('ben', 'janice', '1800 Chestnut Avenue', '22223', 'Unit 23C', 'Cozy 2-bedroom townhouse with a patio.', 'thumbnail23.jpg', 2, 1, 1050.00, 420000.00, 400.00, FALSE),
('agent26', 'ada', '1900 Dogwood Boulevard', '22223', 'Unit 24D', 'Modern 3-bedroom loft with an open floor plan.', 'thumbnail24.jpg', 3, 2, 1500.00, 600000.00, 400.00, FALSE),
('agent27', 'janice', '2000 Elder Road', '33334', 'Unit 25E', 'Spacious 4-bedroom house with a garden.', 'thumbnail25.jpg', 4, 3, 2400.00, 960000.00, 400.00, FALSE),
('agent28', 'ada', '2100 Elm Lane', '33334', 'Unit 26A', 'Bright 1-bedroom apartment with city views.', 'thumbnail26.jpg', 1, 1, 700.00, 280000.00, 400.00, FALSE),
('agent29', 'janice', '2200 Maple Street', '44445', 'Unit 27B', 'Cozy 2-bedroom condo in a quiet area.', 'thumbnail27.jpg', 2, 1, 900.00, 360000.00, 400.00, FALSE),
('agent30', 'ada', '2300 Oak Avenue', '44445', 'Unit 28C', 'Spacious 3-bedroom apartment with a modern kitchen.', 'thumbnail28.jpg', 3, 2, 1300.00, 520000.00, 400.00, FALSE),
('lincoln', 'janice', '2400 Pine Boulevard', '55556', 'Unit 29D', 'Modern 4-bedroom home with a pool.', 'thumbnail29.jpg', 4, 3, 2500.00, 1000000.00, 400.00, FALSE),
('ben', 'ada', '2500 Cedar Road', '55556', 'Unit 30E', 'Bright 1-bedroom loft with high ceilings.', 'thumbnail30.jpg', 1, 1, 800.00, 320000.00, 400.00, FALSE),
('agent26', 'janice', '2600 Birch Lane', '66667', 'Unit 31A', 'Luxurious 3-bedroom villa with a large garden.', 'thumbnail31.jpg', 3, 2, 2000.00, 800000.00, 400.00, FALSE),
('agent27', 'ada', '2700 Spruce Street', '66667', 'Unit 32B', 'Cozy 2-bedroom house in a friendly neighborhood.', 'thumbnail32.jpg', 2, 1, 1100.00, 440000.00, 400.00, FALSE),
('agent28', 'janice', '2800 Redwood Avenue', '77778', 'Unit 33C', 'Spacious 4-bedroom apartment with a modern interior.', 'thumbnail33.jpg', 4, 3, 1800.00, 720000.00, 400.00, FALSE),
('agent29', 'ada', '2900 Ash Boulevard', '77778', 'Unit 34D', 'Bright 3-bedroom condo with city views.', 'thumbnail34.jpg', 3, 2, 1500.00, 600000.00, 400.00, FALSE),
('agent30', 'janice', '3000 Poplar Road', '88889', 'Unit 35E', 'Modern 2-bedroom loft with a rooftop terrace.', 'thumbnail35.jpg', 2, 1, 900.00, 360000.00, 400.00, FALSE),
('lincoln', 'ada', '3100 Fir Lane', '88889', 'Unit 36A', 'Spacious 3-bedroom house with a private pool.', 'thumbnail36.jpg', 3, 2, 1600.00, 640000.00, 400.00, FALSE),
('ben', 'janice', '3200 Palm Street', '99990', 'Unit 37B', 'Cozy 1-bedroom apartment in the city center.', 'thumbnail37.jpg', 1, 1, 700.00, 280000.00, 400.00, FALSE),
('agent26', 'ada', '3300 Willow Avenue', '99990', 'Unit 38C', 'Bright 2-bedroom condo with a balcony.', 'thumbnail38.jpg', 2, 1, 1000.00, 400000.00, 400.00, FALSE),
('agent27', 'janice', '3400 Cypress Boulevard', '11123', 'Unit 39D', 'Luxurious 4-bedroom house with modern amenities.', 'thumbnail39.jpg', 4, 3, 2200.00, 880000.00, 400.00, FALSE),
('agent28', 'ada', '3500 Aspen Road', '11123', 'Unit 40E', 'Spacious 3-bedroom apartment with city views.', 'thumbnail40.jpg', 3, 2, 1500.00, 600000.00, 400.00, FALSE),
('agent29', 'janice', '3600 Alder Lane', '22234', 'Unit 41A', 'Modern 2-bedroom loft with an open floor plan.', 'thumbnail41.jpg', 2, 1, 900.00, 360000.00, 400.00, FALSE),
('agent30', 'ada', '3700 Beech Street', '22234', 'Unit 42B', 'Bright 3-bedroom house with a garden.', 'thumbnail42.jpg', 3, 2, 1300.00, 520000.00, 400.00, FALSE),
('lincoln', 'janice', '3800 Chestnut Avenue', '33345', 'Unit 43C', 'Luxurious 4-bedroom villa with ocean views.', 'thumbnail43.jpg', 4, 3, 2500.00, 1000000.00, 400.00, FALSE),
('ben', 'ada', '3900 Dogwood Boulevard', '33345', 'Unit 44D', 'Cozy 2-bedroom apartment in a quiet neighborhood.', 'thumbnail44.jpg', 2, 1, 800.00, 320000.00, 400.00, FALSE),
('agent26', 'janice', '4000 Elder Road', '44456', 'Unit 45E', 'Spacious 3-bedroom condo with a modern kitchen.', 'thumbnail45.jpg', 3, 2, 1400.00, 560000.00, 400.00, FALSE),
('agent27', 'ada', '4100 Elm Lane', '44456', 'Unit 46A', 'Modern 4-bedroom house with a rooftop terrace.', 'thumbnail46.jpg', 4, 3, 2200.00, 880000.00, 400.00, FALSE),
('agent28', 'janice', '4200 Maple Street', '55567', 'Unit 47B', 'Bright 1-bedroom apartment with city views.', 'thumbnail47.jpg', 1, 1, 700.00, 280000.00, 400.00, FALSE),
('agent29', 'ada', '4300 Oak Avenue', '55567', 'Unit 48C', 'Spacious 2-bedroom house with a large backyard.', 'thumbnail48.jpg', 2, 1, 1100.00, 440000.00, 400.00, FALSE),
('agent30', 'janice', '4400 Pine Boulevard', '66678', 'Unit 49D', 'Modern 3-bedroom apartment in a prime location.', 'thumbnail49.jpg', 3, 2, 1300.00, 520000.00, 400.00, FALSE),
('lincoln', 'ada', '4500 Cedar Road', '66678', 'Unit 50E', 'Cozy 4-bedroom house with modern amenities.', 'thumbnail50.jpg', 4, 3, 1800.00, 720000.00, 400.00, FALSE),
('lincoln', 'janice', '4600 Birch Lane', '66666', 'Unit 51A', 'Cozy 2-bedroom condo in a quiet neighborhood.', 'thumbnail51.jpg', 2, 1, 900.00, 360000.00, 400.00, FALSE),
('lincoln', 'ada', '4700 Spruce Street', '66666', 'Unit 52B', 'Spacious 3-bedroom townhouse with modern amenities.', 'thumbnail52.jpg', 3, 2, 1500.00, 600000.00, 400.00, FALSE),
('lincoln', 'janice', '4800 Redwood Avenue', '77777', 'Unit 53C', 'Modern 4-bedroom home with a large backyard.', 'thumbnail53.jpg', 4, 3, 2500.00, 1000000.00, 400.00, FALSE),
('lincoln', 'ada', '4900 Ash Boulevard', '77777', 'Unit 54D', 'Cozy 1-bedroom loft with a modern kitchen.', 'thumbnail54.jpg', 1, 1, 700.00, 280000.00, 400.00, FALSE),
('lincoln', 'janice', '5000 Poplar Road', '88888', 'Unit 55E', 'Bright 2-bedroom house with a garden.', 'thumbnail55.jpg', 2, 1, 1100.00, 440000.00, 400.00, FALSE),
('lincoln', 'ada', '5100 Fir Lane', '88888', 'Unit 56A', 'Spacious 3-bedroom apartment in the city center.', 'thumbnail56.jpg', 3, 2, 1500.00, 600000.00, 400.00, FALSE),
('lincoln', 'janice', '5200 Palm Street', '99999', 'Unit 57B', 'Modern 4-bedroom condo with a rooftop terrace.', 'thumbnail57.jpg', 4, 3, 2200.00, 880000.00, 400.00, FALSE),
('lincoln', 'ada', '5300 Willow Avenue', '99999', 'Unit 58C', 'Cozy 1-bedroom apartment with a modern interior.', 'thumbnail58.jpg', 1, 1, 650.00, 260000.00, 400.00, FALSE),
('lincoln', 'janice', '5400 Cypress Boulevard', '10110', 'Unit 59D', 'Bright 2-bedroom condo with city views.', 'thumbnail59.jpg', 2, 1, 1000.00, 400000.00, 400.00, FALSE),
('lincoln', 'ada', '5500 Aspen Road', '10110', 'Unit 60E', 'Spacious 3-bedroom house with a large backyard.', 'thumbnail60.jpg', 3, 2, 1600.00, 640000.00, 400.00, FALSE),
('lincoln', 'janice', '5600 Alder Lane', '11121', 'Unit 61A', 'Modern 4-bedroom villa with a private pool.', 'thumbnail61.jpg', 4, 3, 3000.00, 1200000.00, 400.00, FALSE),
('lincoln', 'ada', '5700 Beech Street', '11121', 'Unit 62B', 'Cozy 1-bedroom loft with high ceilings.', 'thumbnail62.jpg', 1, 1, 800.00, 320000.00, 400.00, FALSE),
('lincoln', 'janice', '5800 Chestnut Avenue', '22232', 'Unit 63C', 'Bright 2-bedroom apartment with modern amenities.', 'thumbnail63.jpg', 2, 1, 900.00, 360000.00, 400.00, FALSE),
('lincoln', 'ada', '5900 Dogwood Boulevard', '22232', 'Unit 64D', 'Spacious 3-bedroom house with a garage.', 'thumbnail64.jpg', 3, 2, 1500.00, 600000.00, 400.00, FALSE),
('lincoln', 'janice', '6000 Elder Road', '33343', 'Unit 65E', 'Modern 4-bedroom condo with a garden.', 'thumbnail65.jpg', 4, 3, 2300.00, 920000.00, 400.00, FALSE),
('venus', 'seller1', '9600 Maple Street', '88877', 'Unit 101', 'Cozy 2-bedroom apartment with modern amenities.', 'thumbnail101.jpg', 2, 1, 950.00, 380000.00, 400.00, FALSE),
('venus', 'seller2', '9700 Oak Avenue', '88877', 'Unit 102', 'Spacious 3-bedroom house with a large backyard.', 'thumbnail102.jpg', 3, 2, 1600.00, 640000.00, 400.00, FALSE),
('venus', 'seller3', '9800 Pine Boulevard', '77766', 'Unit 103', 'Modern 4-bedroom villa with a rooftop terrace.', 'thumbnail103.jpg', 4, 3, 2500.00, 1000000.00, 400.00, FALSE),
('venus', 'seller4', '9900 Cedar Road', '77766', 'Unit 104', 'Cozy 1-bedroom apartment in a quiet neighborhood.', 'thumbnail104.jpg', 1, 1, 700.00, 280000.00, 400.00, FALSE),
('venus', 'seller5', '10000 Birch Lane', '66655', 'Unit 105', 'Bright 2-bedroom house with a garden.', 'thumbnail105.jpg', 2, 1, 1100.00, 440000.00, 400.00, FALSE),
('venus', 'seller6', '10100 Spruce Street', '66655', 'Unit 106', 'Spacious 3-bedroom apartment with city views.', 'thumbnail106.jpg', 3, 2, 1500.00, 600000.00, 400.00, FALSE),
('venus', 'seller7', '10200 Redwood Avenue', '55544', 'Unit 107', 'Modern 4-bedroom condo with a rooftop terrace.', 'thumbnail107.jpg', 4, 3, 2200.00, 880000.00, 400.00, FALSE),
('venus', 'seller8', '10300 Ash Boulevard', '55544', 'Unit 108', 'Cozy 1-bedroom loft with high ceilings.', 'thumbnail108.jpg', 1, 1, 800.00, 320000.00, 400.00, FALSE),
('venus', 'seller9', '10400 Poplar Road', '44433', 'Unit 109', 'Bright 2-bedroom condo in a prime location.', 'thumbnail109.jpg', 2, 1, 950.00, 380000.00, 400.00, FALSE),
('venus', 'seller10', '10500 Fir Lane', '44433', 'Unit 110', 'Spacious 3-bedroom house with modern amenities.', 'thumbnail110.jpg', 3, 2, 1300.00, 520000.00, 400.00, FALSE),
('lincoln', 'ada', '6100 Elm Lane', '33343', 'Unit 66A', 'Cozy 1-bedroom apartment with city views.', 'thumbnail66.jpg', 1, 1, 700.00, 280000.00, 400.00, FALSE),
('lincoln', 'janice', '6200 Maple Street', '44454', 'Unit 67B', 'Bright 2-bedroom condo in a prime location.', 'thumbnail67.jpg', 2, 1, 950.00, 380000.00, 400.00, FALSE),
('lincoln', 'ada', '6300 Oak Avenue', '44454', 'Unit 68C', 'Spacious 3-bedroom apartment with modern amenities.', 'thumbnail68.jpg', 3, 2, 1300.00, 520000.00, 400.00, FALSE),
('lincoln', 'janice', '6400 Pine Boulevard', '55565', 'Unit 69D', 'Modern 4-bedroom house with a large garden.', 'thumbnail69.jpg', 4, 3, 2400.00, 960000.00, 400.00, FALSE),
('lincoln', 'ada', '6500 Cedar Road', '55565', 'Unit 70E', 'Cozy 1-bedroom loft with a modern kitchen.', 'thumbnail70.jpg', 1, 1, 700.00, 280000.00, 400.00, FALSE),
('lincoln', 'janice', '6600 Birch Lane', '66676', 'Unit 71A', 'Bright 2-bedroom apartment with a private balcony.', 'thumbnail71.jpg', 2, 1, 1000.00, 400000.00, 400.00, FALSE),
('lincoln', 'ada', '6700 Spruce Street', '66676', 'Unit 72B', 'Spacious 3-bedroom house with a garage.', 'thumbnail72.jpg', 3, 2, 1600.00, 640000.00, 400.00, FALSE),
('lincoln', 'janice', '6800 Redwood Avenue', '77787', 'Unit 73C', 'Modern 4-bedroom villa with a rooftop terrace.', 'thumbnail73.jpg', 4, 3, 2500.00, 1000000.00, 400.00, FALSE),
('lincoln', 'ada', '6900 Ash Boulevard', '77787', 'Unit 74D', 'Cozy 1-bedroom apartment in a quiet area.', 'thumbnail74.jpg', 1, 1, 750.00, 300000.00, 400.00, FALSE),
('lincoln', 'janice', '7000 Poplar Road', '88898', 'Unit 75E', 'Bright 2-bedroom house with modern amenities.', 'thumbnail75.jpg', 2, 1, 1100.00, 440000.00, 400.00, FALSE),
('lincoln', 'ada', '7100 Fir Lane', '88898', 'Unit 76A', 'Spacious 3-bedroom apartment with city views.', 'thumbnail76.jpg', 3, 2, 1500.00, 600000.00, 400.00, FALSE),
('lincoln', 'janice', '7200 Palm Street', '99909', 'Unit 77B', 'Modern 4-bedroom condo with a private garden.', 'thumbnail77.jpg', 4, 3, 2200.00, 880000.00, 400.00, FALSE),
('lincoln', 'ada', '7300 Willow Avenue', '99909', 'Unit 78C', 'Cozy 1-bedroom apartment in the city center.', 'thumbnail78.jpg', 1, 1, 650.00, 260000.00, 400.00, FALSE),
('lincoln', 'janice', '7400 Cypress Boulevard', '10121', 'Unit 79D', 'Bright 2-bedroom loft with high ceilings.', 'thumbnail79.jpg', 2, 1, 950.00, 380000.00, 400.00, FALSE),
('lincoln', 'ada', '7500 Aspen Road', '10121', 'Unit 80E', 'Spacious 3-bedroom townhouse with a garage.', 'thumbnail80.jpg', 3, 2, 1500.00, 600000.00, 400.00, FALSE),
('lincoln', 'janice', '7600 Alder Lane', '11132', 'Unit 81A', 'Modern 4-bedroom house with a large garden.', 'thumbnail81.jpg', 4, 3, 2500.00, 1000000.00, 400.00, FALSE),
('lincoln', 'ada', '7700 Beech Street', '11132', 'Unit 82B', 'Cozy 1-bedroom loft with modern amenities.', 'thumbnail82.jpg', 1, 1, 700.00, 280000.00, 400.00, FALSE),
('lincoln', 'janice', '7800 Chestnut Avenue', '22243', 'Unit 83C', 'Bright 2-bedroom apartment with a balcony.', 'thumbnail83.jpg', 2, 1, 1000.00, 400000.00, 400.00, FALSE),
('lincoln', 'ada', '7900 Dogwood Boulevard', '22243', 'Unit 84D', 'Spacious 3-bedroom house with a private pool.', 'thumbnail84.jpg', 3, 2, 1700.00, 680000.00, 400.00, FALSE),
('lincoln', 'janice', '8000 Elder Road', '33354', 'Unit 85E', 'Modern 4-bedroom condo with city views.', 'thumbnail85.jpg', 4, 3, 2300.00, 920000.00, 400.00, FALSE),
('lincoln', 'ada', '8100 Elm Lane', '33354', 'Unit 86A', 'Cozy 1-bedroom apartment in a quiet neighborhood.', 'thumbnail86.jpg', 1, 1, 700.00, 280000.00, 400.00, FALSE),
('lincoln', 'janice', '8200 Maple Street', '44465', 'Unit 87B', 'Bright 2-bedroom condo with a modern kitchen.', 'thumbnail87.jpg', 2, 1, 950.00, 380000.00, 400.00, FALSE),
('lincoln', 'ada', '8300 Oak Avenue', '44465', 'Unit 88C', 'Spacious 3-bedroom apartment with a large backyard.', 'thumbnail88.jpg', 3, 2, 1600.00, 640000.00, 400.00, FALSE),
('lincoln', 'janice', '8400 Pine Boulevard', '55576', 'Unit 89D', 'Modern 4-bedroom house with a private garden.', 'thumbnail89.jpg', 4, 3, 2400.00, 960000.00, 400.00, FALSE),
('lincoln', 'ada', '8500 Cedar Road', '55576', 'Unit 90E', 'Cozy 1-bedroom loft with city views.', 'thumbnail90.jpg', 1, 1, 700.00, 280000.00, 400.00, FALSE),
('lincoln', 'janice', '8600 Birch Lane', '66687', 'Unit 91A', 'Bright 2-bedroom condo in the city center.', 'thumbnail91.jpg', 2, 1, 900.00, 360000.00, 400.00, FALSE),
('lincoln', 'ada', '8700 Spruce Street', '66687', 'Unit 92B', 'Spacious 3-bedroom house with a modern kitchen.', 'thumbnail92.jpg', 3, 2, 1300.00, 520000.00, 400.00, FALSE),
('lincoln', 'janice', '8800 Redwood Avenue', '77798', 'Unit 93C', 'Modern 4-bedroom villa with a large garden.', 'thumbnail93.jpg', 4, 3, 2500.00, 1000000.00, 400.00, FALSE),
('lincoln', 'ada', '8900 Ash Boulevard', '77798', 'Unit 94D', 'Cozy 1-bedroom apartment in a prime location.', 'thumbnail94.jpg', 1, 1, 650.00, 260000.00, 400.00, FALSE),
('lincoln', 'janice', '9000 Poplar Road', '88809', 'Unit 95E', 'Bright 2-bedroom house with modern amenities.', 'thumbnail95.jpg', 2, 1, 1100.00, 440000.00, 400.00, FALSE),
('lincoln', 'janice', '9100 Fir Lane', '99920', 'Unit 96A', 'Spacious 3-bedroom apartment with a beautiful view.', 'thumbnail96.jpg', 3, 2, 1450.00, 580000.00, 400.00, FALSE),
('lincoln', 'ada', '9200 Palm Street', '99920', 'Unit 97B', 'Modern 4-bedroom house with a rooftop garden.', 'thumbnail97.jpg', 4, 3, 2100.00, 840000.00, 400.00, FALSE),
('lincoln', 'janice', '9300 Willow Avenue', '10122', 'Unit 98C', 'Cozy 2-bedroom loft with updated kitchen.', 'thumbnail98.jpg', 2, 1, 900.00, 360000.00, 400.00, FALSE),
('lincoln', 'ada', '9400 Cypress Boulevard', '10122', 'Unit 99D', 'Bright 1-bedroom apartment in a prime location.', 'thumbnail99.jpg', 1, 1, 750.00, 300000.00, 400.00, FALSE),
('lincoln', 'janice', '9500 Aspen Road', '11133', 'Unit 100E', 'Spacious 3-bedroom townhouse with a garage.', 'thumbnail100.jpg', 3, 2, 1600.00, 640000.00, 400.00, FALSE);




/* UPDATE UserAccounts SET roleName='admin' WHERE username = 'admin'; */
/* drop database HOMELUX; */