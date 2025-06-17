-- Create Users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create Products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create Orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    product_id INTEGER NOT NULL REFERENCES products(id),
    quantity INTEGER NOT NULL DEFAULT 1,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Insert some dummy products (fruits)
INSERT INTO products (name, description, price) VALUES
('Pommes Royal Gala', 'Croquantes et juteuses, directement du verger.', 2.99),
('Bananes des Antilles', 'Douces et pleines d''énergie, parfaites pour un en-cas.', 1.99),
('Oranges de Sicile', 'Riches en vitamine C, un zeste de soleil dans votre journée.', 3.50),
('Fraises Gariguette', 'Les premières du printemps, sucrées et parfumées.', 4.50);
