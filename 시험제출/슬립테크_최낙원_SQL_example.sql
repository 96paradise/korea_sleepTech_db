-- 1. 테이블 생성
CREATE TABLE product_info (
    product_id INT,
    product_name VARCHAR(100),
    category CHAR(10),
    price DECIMAL(10, 2),
    in_stock BOOLEAN,
    release_date DATE,
    color ENUM('red', 'green', 'blue')
);

-- 2. 데이터 삽입
INSERT INTO product_info (product_id, product_name, category, price, in_stock, release_date, color)
VALUES 
(1, 'Galaxy Watch', 'Device', 299.99, true, '2024-06-01', 'green');

-- 3. 전체 데이터 출력
SELECT * FROM product_info;
