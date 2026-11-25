-- FloodWatch tables. Re-running this file resets the schema.
-- Child table is dropped first because of the foreign key.
DROP TABLE IF EXISTS preparedness_actions;
DROP TABLE IF EXISTS locations;

CREATE TABLE locations (
    id           INT          NOT NULL AUTO_INCREMENT,
    station_id   VARCHAR(100) NOT NULL,
    station_name VARCHAR(255) NOT NULL,
    river_name   VARCHAR(255) NULL,
    notes        TEXT         NULL,
    created_at   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    INDEX idx_locations_station (station_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE preparedness_actions (
    id          INT          NOT NULL AUTO_INCREMENT,
    location_id INT          NOT NULL,
    title       VARCHAR(255) NOT NULL,
    description TEXT         NULL,
    status      ENUM('Pending', 'Completed') NOT NULL DEFAULT 'Pending',
    priority    ENUM('Low', 'Medium', 'High') NOT NULL DEFAULT 'Medium',
    due_date    DATE         NULL,
    created_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT fk_actions_location
        FOREIGN KEY (location_id) REFERENCES locations (id)
        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;