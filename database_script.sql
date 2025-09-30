CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    age INT,
    gender CHAR(1),
    weight_kg FLOAT,
    height_cm FLOAT,
    phone_number VARCHAR(20),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE EmergencyContacts (
    contact_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    emergency_phone_number VARCHAR(20) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Devices (
    device_id SERIAL PRIMARY KEY,
    serial_number VARCHAR(255) UNIQUE NOT NULL,
    user_id INT,
    firmware_version VARCHAR(50),
    last_sync_at TIMESTAMP,
    status VARCHAR(50) DEFAULT 'Active',
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE GlucoseReadings (
    reading_id SERIAL PRIMARY KEY,
    device_id INT,
    timestamp TIMESTAMP NOT NULL,
    estimated_glucose_mg_dL FLOAT NOT NULL,
    raw_ppg_voltage FLOAT,
    heart_rate_bpm INT,
    hrv_value FLOAT,
    is_calibrated BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (device_id) REFERENCES Devices(device_id)
);

CREATE TABLE Alerts (
    alert_id SERIAL PRIMARY KEY,
    user_id INT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    alert_type VARCHAR(50) NOT NULL,
    message TEXT,
    is_acknowledged BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- 50 sample users
INSERT INTO Users (full_name, age, gender, weight_kg, height_cm, phone_number, email, password_hash)
VALUES
('Ahmed Ali', 40, 'M', 85.5, 175.2, '01012345678', 'ahmed.ali@example.com', 'hashed_pass_1'),
('Fatima Omar', 33, 'F', 62.0, 168.0, '01198765432', 'fatima.omar@example.com', 'hashed_pass_2'),
('Mohamed Khaled', 47, 'M', 90.0, 180.5, '01234567890', 'mohamed.khaled@example.com', 'hashed_pass_3'),
('Sara Hassan', 30, 'F', 58.0, 165.1, '01098765432', 'sara.hassan@example.com', 'hashed_pass_4'),
('Youssef Eid', 37, 'M', 75.2, 178.0, '01123456789', 'youssef.eid@example.com', 'hashed_pass_5'),
('Leila Saad', 45, 'F', 70.0, 170.0, '01298765432', 'leila.saad@example.com', 'hashed_pass_6'),
('Tarek Mahmoud', 50, 'M', 92.5, 185.0, '01055554444', 'tarek.mahmoud@example.com', 'hashed_pass_7'),
('Nada Ibrahim', 27, 'F', 55.0, 160.0, '01188887777', 'nada.ibrahim@example.com', 'hashed_pass_8'),
('Omar Fares', 43, 'M', 88.0, 176.5, '01211112222', 'omar.fares@example.com', 'hashed_pass_9'),
('Rana Amin', 32, 'F', 65.5, 172.0, '01077778888', 'rana.amin@example.com', 'hashed_pass_10'),
('Hany Salem', 55, 'M', 100.0, 182.0, '01166665555', 'hany.salem@example.com', 'hashed_pass_11'),
('Mariam Gamal', 28, 'F', 60.5, 164.5, '01255556666', 'mariam.gamal@example.com', 'hashed_pass_12'),
('Farid Kamal', 36, 'M', 78.9, 179.0, '01044443333', 'farid.kamal@example.com', 'hashed_pass_13'),
('Dalia Shawky', 29, 'F', 59.5, 166.0, '01133334444', 'dalia.shawky@example.com', 'hashed_pass_14'),
('Karim Wahid', 42, 'M', 81.0, 177.0, '01277778888', 'karim.wahid@example.com', 'hashed_pass_15'),
('Aya Refaat', 35, 'F', 63.5, 171.0, '01022221111', 'aya.refaat@example.com', 'hashed_pass_16'),
('Amir Adel', 38, 'M', 77.0, 174.0, '01111112222', 'amir.adel@example.com', 'hashed_pass_17'),
('Nour Yasser', 31, 'F', 68.0, 173.0, '01299990000', 'nour.yasser@example.com', 'hashed_pass_18'),
('Hamza Hosny', 46, 'M', 95.0, 183.0, '01088889999', 'hamza.hosny@example.com', 'hashed_pass_19'),
('Shahd Ahmed', 34, 'F', 57.0, 162.0, '01155554444', 'shahd.ahmed@example.com', 'hashed_pass_20'),
('Moaz Samir', 39, 'M', 84.0, 176.0, '01266667777', 'moaz.samir@example.com', 'hashed_pass_21'),
('Salma Reda', 32, 'F', 61.0, 167.0, '01011113333', 'salma.reda@example.com', 'hashed_pass_22'),
('Walid Fouad', 49, 'M', 91.5, 184.0, '01144446666', 'walid.fouad@example.com', 'hashed_pass_23'),
('Heba Magdy', 27, 'F', 56.5, 161.5, '01288889999', 'heba.magdy@example.com', 'hashed_pass_24'),
('Rami Abdel', 44, 'M', 79.5, 175.5, '01099998888', 'rami.abdel@example.com', 'hashed_pass_25'),
('Dina Essam', 41, 'F', 64.0, 169.0, '01122224444', 'dina.essam@example.com', 'hashed_pass_26'),
('Sherif Gamal', 52, 'M', 98.0, 186.0, '01255557777', 'sherif.gamal@example.com', 'hashed_pass_27'),
('Noura Adel', 26, 'F', 54.0, 159.0, '01033336666', 'noura.adel@example.com', 'hashed_pass_28'),
('Amr Said', 45, 'M', 80.0, 177.5, '01177779999', 'amr.said@example.com', 'hashed_pass_29'),
('Farah Yasser', 34, 'F', 67.0, 173.5, '01211114444', 'farah.yasser@example.com', 'hashed_pass_30'),
('Mostafa Adel', 40, 'M', 87.0, 178.5, '01055558888', 'mostafa.adel@example.com', 'hashed_pass_31'),
('Ghada Hassan', 31, 'F', 60.0, 165.5, '01188886666', 'ghada.hassan@example.com', 'hashed_pass_32'),
('Samy Fouad', 48, 'M', 89.5, 181.0, '01222225555', 'samy.fouad@example.com', 'hashed_pass_33'),
('Rana Sherif', 29, 'F', 58.5, 163.0, '01099991111', 'rana.sherif@example.com', 'hashed_pass_34'),
('Yassen Ibrahim', 36, 'M', 82.0, 179.5, '01133335555', 'yassen.ibrahim@example.com', 'hashed_pass_35'),
('Salwa Karim', 35, 'F', 66.5, 172.5, '01266668888', 'salwa.karim@example.com', 'hashed_pass_36'),
('Hassan Ali', 43, 'M', 93.0, 182.5, '01077771111', 'hassan.ali@example.com', 'hashed_pass_37'),
('Nesma Gabr', 30, 'F', 55.5, 160.5, '01122229999', 'nesma.gabr@example.com', 'hashed_pass_38'),
('Mahmoud Reda', 51, 'M', 97.0, 187.0, '01244447777', 'mahmoud.reda@example.com', 'hashed_pass_39'),
('Nada Saleh', 28, 'F', 61.5, 164.0, '01088881111', 'nada.saleh@example.com', 'hashed_pass_40'),
('Adel Abdel', 39, 'M', 84.5, 178.0, '01155559999', 'adel.abdel@example.com', 'hashed_pass_41'),
('Merna Fares', 32, 'F', 63.0, 168.5, '01233331111', 'merna.fares@example.com', 'hashed_pass_42'),
('Ramy Said', 46, 'M', 88.5, 180.0, '01044449999', 'ramy.said@example.com', 'hashed_pass_43'),
('Samar Yassin', 29, 'F', 64.5, 170.5, '01177771111', 'samar.yassin@example.com', 'hashed_pass_44'),
('Osama Gamal', 42, 'M', 79.0, 176.5, '01299991111', 'osama.gamal@example.com', 'hashed_pass_45'),
('Reem Hassan', 29, 'F', 57.5, 163.5, '01011119999', 'reem.hassan@example.com', 'hashed_pass_46'),
('Ahmed Gabr', 37, 'M', 83.0, 177.0, '01155551111', 'ahmed.gabr@example.com', 'hashed_pass_47'),
('Amal Kamal', 34, 'F', 60.5, 169.5, '01233339999', 'amal.kamal@example.com', 'hashed_pass_48'),
('Tareq Abdel', 50, 'M', 94.0, 184.5, '01044441111', 'tareq.abdel@example.com', 'hashed_pass_49'),
('Yara Reda', 33, 'F', 59.0, 166.5, '01177779999', 'yara.reda@example.com', 'hashed_pass_50');

-- 50 sample emergency contacts
INSERT INTO EmergencyContacts (user_id, emergency_phone_number)
VALUES
(1, '01012345679'), (2, '01198765431'), (3, '01234567891'), (4, '01098765431'), (5, '01123456788'),
(6, '01298765431'), (7, '01055554445'), (8, '01188887778'), (9, '01211112223'), (10, '01077778889'),
(11, '01166665556'), (12, '01255556667'), (13, '01044443334'), (14, '01133334445'), (15, '01277778889'),
(16, '01022221112'), (17, '01111112223'), (18, '01299990001'), (19, '01088889990'), (20, '01155554445'),
(21, '01266667778'), (22, '01011113334'), (23, '01144446667'), (24, '01288889990'), (25, '01099998889'),
(26, '01122224445'), (27, '01255557778'), (28, '01033336667'), (29, '01177779990'), (30, '01211114445'),
(31, '01055558889'), (32, '01188886667'), (33, '01222225556'), (34, '01099991112'), (35, '01133335556'),
(36, '01266668889'), (37, '01077771112'), (38, '01122229990'), (39, '01244447778'), (40, '01088881112'),
(41, '01155559990'), (42, '01233331112'), (43, '01044449990'), (44, '01177771112'), (45, '01299991112'),
(46, '01011119990'), (47, '01155551112'), (48, '01233339990'), (49, '01044441112'), (50, '01177779990');

-- 50 devices
INSERT INTO Devices (serial_number, user_id, firmware_version)
SELECT 'INSV-' || LPAD(user_id::text, 3, '0'), user_id, '1.1.0'
FROM Users;

-- A lot of glucose readings
INSERT INTO GlucoseReadings (device_id, timestamp, estimated_glucose_mg_dL, raw_ppg_voltage, heart_rate_bpm)
SELECT
    s.device_id,
    '2025-09-21 10:00:00'::timestamp + (i * '10 minutes'::interval),
    (100 + (random() * 50) + (100 * (sin(i/10.0) + 1))),
    (2.5 + (random() * 2)),
    (70 + (random() * 20))
FROM generate_series(1, 50) as s(device_id),
     generate_series(1, 10) as i;

-- 10 sample alerts
INSERT INTO Alerts (user_id, alert_type, message)
VALUES
(1, 'Hypoglycemia Risk', 'Glucose trending low.'),
(2, 'Hypoglycemia', 'Critical low glucose detected.'),
(3, 'Hyperglycemia', 'High glucose detected. Insulin needed.'),
(4, 'Hypoglycemia', 'Critical low glucose detected.'),
(5, 'Hyperglycemia Risk', 'Glucose trending high.'),
(6, 'Hypoglycemia Risk', 'Glucose trending low.'),
(7, 'Hyperglycemia', 'High glucose detected.'),
(8, 'Hypoglycemia', 'Critical low glucose detected.'),
(9, 'Hyperglycemia Risk', 'Glucose trending high.'),
(10, 'Hypoglycemia Risk', 'Glucose trending low.');

-- Show data from all tables
SELECT * FROM Users LIMIT 10;
SELECT * FROM EmergencyContacts LIMIT 10;
SELECT * FROM Devices LIMIT 10;
SELECT * FROM GlucoseReadings LIMIT 10;
SELECT * FROM Alerts LIMIT 10;