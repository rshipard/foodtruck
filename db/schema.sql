CREATE TABLE food (
    id SERIAL PRIMARY KEY,
    name TEXT,
    image_url TEXT,
    price DECIMAL(8,2)
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT,
    email TEXT,
    password_digest TEXT,
);