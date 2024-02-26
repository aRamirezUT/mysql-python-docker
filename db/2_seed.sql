INSERT INTO tenants (name, email) VALUES
    ('arenR', 'arenR@example.com'),
    ('annieN', 'annieN@example.com'),
    ('zachF', 'zachF@example.com');

INSERT INTO rooms (room_name, tenant_id) VALUES
    ('100', (SELECT tenant_id FROM tenants WHERE name = 'arenR')),
    ('200', (SELECT tenant_id FROM tenants WHERE name = 'arenR')),
    ('102', (SELECT tenant_id FROM tenants WHERE name = 'annieN')),
    ('103', (SELECT tenant_id FROM tenants WHERE name = 'zachF')),
    ('300', (SELECT tenant_id FROM tenants WHERE name = 'zachF')
);

INSERT INTO apartments (appt_name, room_id) VALUES
    ('apartment1', (SELECT room_id FROM rooms WHERE room_name = '100')),
    ('apartment2', (SELECT room_id FROM rooms WHERE room_name = '200')),
    ('apartment1', (SELECT room_id FROM rooms WHERE room_name = '102')),
    ('apartment1', (SELECT room_id FROM rooms WHERE room_name = '103')),
    ('apartment3', (SELECT room_id FROM rooms WHERE room_name = '300')
);
