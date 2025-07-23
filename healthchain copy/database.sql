CREATE DATABASE healthchain;
USE healthchain;
CREATE TABLE users (
    user_id VARCHAR(50) PRIMARY KEY,
    wallet_address VARCHAR(255) UNIQUE NOT NULL,
    full_name VARCHAR(100),
    email VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE medical_staff (
    staff_id VARCHAR(50) PRIMARY KEY,
    wallet_address VARCHAR(255) UNIQUE NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    email VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE patient_records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(50),
    staff_id VARCHAR(50),
    diagnosis TEXT,
    treatment TEXT,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES users(user_id),
    FOREIGN KEY (staff_id) REFERENCES medical_staff(staff_id)
);

CREATE TABLE health_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(50),
    condition_status VARCHAR(100),
    last_checkup DATE,
    vital_signs JSON,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE activity_log (
    activity_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(50),
    activity_type VARCHAR(50),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE staff_patients (
    staff_id VARCHAR(50),
    patient_id VARCHAR(50),
    assigned_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (staff_id, patient_id),
    FOREIGN KEY (staff_id) REFERENCES medical_staff(staff_id),
    FOREIGN KEY (patient_id) REFERENCES users(user_id)
);

INSERT INTO users (user_id, wallet_address, full_name, email) VALUES
('U001', '0x1234...',    'John Doe', 'john@gmail.com'),



('U002', '0x5678...', 'Jane Smith', 'jane@gmail.com');

INSERT INTO medical_staff (staff_id, wallet_address, full_name, specialization, email) VALUES
('MS001', '0xabcd...', 'Dr. Smith', 'Cardiologist', 'dr.smith@gmail.com'),

('MS002', '0xefgh...',  'Dr. Johnson', 'General Practitioner', 'dr.johnson@gmail.com');

INSERT INTO staff_patients (staff_id, patient_id) VALUES
('MS001', 'U001'),
('MS001', 'U002'),
('MS002', 'U001');

INSERT INTO health_status (user_id, condition_status, last_checkup, vital_signs) VALUES
('U001', 'Healthy', '2024-03-01', '{"blood_pressure": "120/80", "heart_rate": 72}'),

('U002', 'Under Treatment', '2024-03-03', '{"blood_pressure": "130/85", "heart_rate": 78}');

INSERT INTO activity_log (user_id, activity_type, description) VALUES
('U001', 'LOGIN', 'Connected wallet to Healthchain'),

('U001', 'CHECKUP', 'Completed annual checkup'),

('U002', 'PRESCRIPTION', 'New prescription added');
