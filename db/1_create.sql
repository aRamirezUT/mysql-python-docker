DROP TABLE IF EXISTS apartments, rooms, tenants;

CREATE TABLE tenants (
    tenant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_name VARCHAR(100) UNIQUE NOT NULL,
    tenant_id INT,
    FOREIGN KEY (tenant_id) REFERENCES tenants(tenant_id) ON DELETE CASCADE
);

CREATE TABLE apartments (
    appt_id INT AUTO_INCREMENT PRIMARY KEY,
    appt_name VARCHAR(100) NOT NULL,
    room_id INT,
    FOREIGN KEY (room_id) REFERENCES rooms(room_id) ON DELETE CASCADE
);
