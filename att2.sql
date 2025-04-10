CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
    id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao_categoria VARCHAR(100) NOT NULL
);

CREATE TABLE tb_pizzas (
    id_pizza BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_pizza VARCHAR(50) NOT NULL,
    preco_pizza DECIMAL(6,2) NOT NULL,
    tamanho_pizza VARCHAR(20) NOT NULL,
    disponibilidade_pizza BOOLEAN NOT NULL,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
('Salgada', 'Pizzas tradicionais salgadas'),
('Doce', 'Pizzas doces com recheios variados'),
('Vegana', 'Sem ingredientes de origem animal'),
('Especial', 'Combinações exclusivas da casa'),
('Light', 'Ingredientes leves e saudáveis');

INSERT INTO tb_pizzas (nome_pizza, preco_pizza, tamanho_pizza, disponibilidade_pizza, id_categoria) VALUES
('Margherita', 42.90, 'Média', TRUE, 1),
('Calabresa', 48.00, 'Grande', TRUE, 1),
('Chocolate', 55.50, 'Média', TRUE, 2),
('Brigadeiro', 60.00, 'Grande', TRUE, 2),
('Vegana', 50.00, 'Média', TRUE, 3),
('Pizza do Chef', 70.00, 'Gigante', TRUE, 4),
('Muçarela', 38.00, 'Média', TRUE, 1),
('Light Frango', 52.00, 'Média', TRUE, 5);

SELECT * FROM tb_pizzas
WHERE preco_pizza > 45.00;

SELECT * FROM tb_pizzas
WHERE preco_pizza BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas
WHERE nome_pizza LIKE '%M%';

SELECT 
    tb_pizzas.id_pizza, 
    tb_pizzas.nome_pizza, 
    tb_pizzas.preco_pizza, 
    tb_pizzas.tamanho_pizza, 
    tb_pizzas.disponibilidade_pizza, 
    tb_categorias.nome_categoria, 
    tb_categorias.descricao_categoria
FROM tb_pizzas
INNER JOIN tb_categorias ON tb_pizzas.id_categoria = tb_categorias.id_categoria;

SELECT 
    tb_pizzas.id_pizza, 
    tb_pizzas.nome_pizza, 
    tb_pizzas.preco_pizza, 
    tb_pizzas.tamanho_pizza, 
    tb_pizzas.disponibilidade_pizza, 
    tb_categorias.nome_categoria
FROM tb_pizzas
INNER JOIN tb_categorias ON tb_pizzas.id_categoria = tb_categorias.id_categoria
WHERE tb_categorias.nome_categoria = 'Doce';