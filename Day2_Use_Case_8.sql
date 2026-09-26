CREATE DATABASE IF NOT EXISTS cdg_hyd_jfs_058;
USE cdg_hyd_jfs_058;

CREATE TABLE IF NOT EXISTS hotel_rooms (
    room_number VARCHAR(10) PRIMARY KEY,
    room_type VARCHAR(20) NOT NULL,
    floor_number INT NOT NULL,
    bed_count INT NOT NULL,
    max_occupancy INT NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    availability_status VARCHAR(20) NOT NULL,
    has_air_conditioning BOOLEAN,
    smoking_allowed BOOLEAN,
    notes VARCHAR(255)
);

SELECT * FROM hotel_rooms;
DELETE FROM hotel_rooms;

INSERT INTO hotel_rooms
(room_number,room_type,floor_number,bed_count,max_occupancy,price_per_night,availability_status,has_air_conditioning,smoking_allowed,notes)
VALUES
('101','SINGLE',1,1,1,2500.00,'Available',TRUE,FALSE,NULL),
('102','DOUBLE',1,2,3,4200.00,'OCCUPIED',TRUE,FALSE,'City view'),
('201','DELUXE',2,1,2,6500.00,'Reserved',TRUE,FALSE,'Balcony'),
('301','SUITE',3,2,4,12000.00,'Available',TRUE,FALSE,'Sea view'),
('T99','SINGLE',9,1,1,1000.00,'MAINTENANCE',FALSE,FALSE,'Training room'),
('103','SINGLE',1,0,3,4500.00,'Available',TRUE,FALSE,'3BED'),
('304','DOUBLE',3,4,0,5600.00,'OCCUPIED',TRUE,FALSE,'City view'),
('405','DELUXE',4,2,3,0.00,'Reserved',TRUE,FALSE,'Balcony'),
('104','SINGLE',1,1,1,1500.00,'CLEANING',TRUE,FALSE,NULL);

UPDATE hotel_rooms SET price_per_night=price_per_night*1.1 WHERE room_type='SUITE';
UPDATE hotel_rooms SET availability_status='AVAILABLE',notes='Cleaning completed' WHERE room_number='102';
UPDATE hotel_rooms SET max_occupancy=3,price_per_night=7000.00 WHERE room_number='201';
UPDATE hotel_rooms SET notes='Scheduled for removal' WHERE room_number='T99';
UPDATE hotel_rooms SET max_occupancy=0 WHERE room_number='301';

SELECT * FROM hotel_rooms WHERE room_number='T99';
DELETE FROM hotel_rooms WHERE room_number='T99';


INSERT INTO hotel_rooms
(room_number,room_type,floor_number,bed_count,max_occupancy,price_per_night,availability_status,has_air_conditioning,smoking_allowed,notes)
VALUES ('TMP1','DELUXE',1,2,3,3700.00,'OCCUPIED',TRUE,FALSE,'Sea view');

SELECT * FROM hotel_rooms;
DELETE FROM hotel_rooms WHERE room_number='TMP1';