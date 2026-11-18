CREATE TABLE locations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    station_id VARCHAR(100) NOT NULL,
    station_name VARCHAR(255) NOT NULL,
    river_name VARCHAR(255),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE preparedness_actions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    location_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    status ENUM('Pending', 'Completed') DEFAULT 'Pending',
    due_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_location
    FOREIGN KEY (location_id)
    REFERENCES locations(id)
    ON DELETE CASCADE
);