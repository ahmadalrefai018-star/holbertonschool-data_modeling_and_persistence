CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT NOT NULL,
    customer_email TEXT NOT NULL
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    order_date TEXT NOT NULL,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

CREATE TABLE products (
    product_code TEXT PRIMARY KEY NOT NULL,
    product_name TEXT NOT NULL,
    category_name TEXT NOT NULL
);

CREATE TABLE order_items (
    order_id INTEGER NOT NULL,
    product_code TEXT NOT NULL,
    unit_price_paid REAL NOT NULL CHECK (unit_price_paid >= 0),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (order_id, product_code),
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    FOREIGN KEY (product_code)
        REFERENCES products(product_code)
);