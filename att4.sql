CREATE DATABASE db_cidade_dos_vegetais;
USE db_cidade_dos_vegetais;

CREATE TABLE tb_categorias (
    id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    tipo_categoria VARCHAR(50),
    setor VARCHAR(50)
);

CREATE TABLE tb_produtos (
    id_produto BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao_produto VARCHAR(255),
    preco_produto DECIMAL(6,2) NOT NULL,
    quantidade_estoque INT,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias (nome_categoria, tipo_categoria, setor) VALUES
('Frutas', 'Frescos', 'Frente da loja'),
('Verduras', 'Frescos', 'Estufa 1'),
('Legumes', 'Frescos', 'Estufa 2'),
('Orgânicos', 'Naturais', 'Fundos'),
('Temperos', 'Secos', 'Corredor lateral');

INSERT INTO tb_produtos (nome_produto, descricao_produto, preco_produto, quantidade_estoque, id_categoria) VALUES
('Maçã', 'Maçã frequinha', 8.99, 100, 1),
('Alface', 'Fresquinha e crocante', 5.50, 60, 2),
('Cenoura', 'Boa pra salada e refogado', 6.75, 90, 3),
('Banana Prata', 'Ideal pro café da manhã', 9.40, 120, 1),
('Batata Inglesa', 'Bem versátil', 4.80, 150, 3),
('Abobrinha', 'Boa pra grelhar ou refogar', 7.20, 75, 3),
('Tomilho Seco', 'Temperinho especial', 52.00, 30, 5),
('Abacate Grande', 'Orgânico, ótimo pra vitaminas', 59.90, 25, 4);

SELECT * FROM tb_produtos
WHERE preco_produto > 50.00;

SELECT * FROM tb_produtos
WHERE preco_produto BETWEEN 50.00 AND 150.00;

SELECT * FROM tb_produtos
WHERE nome_produto LIKE '%C%';

SELECT 
    tb_produtos.id_produto,
    tb_produtos.nome_produto,
    tb_produtos.descricao_produto,
    tb_produtos.preco_produto,
    tb_produtos.quantidade_estoque,
    tb_categorias.nome_categoria,
    tb_categorias.tipo_categoria,
    tb_categorias.setor
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id_categoria;

SELECT 
    tb_produtos.id_produto,
    tb_produtos.nome_produto,
    tb_produtos.descricao_produto,
    tb_produtos.preco_produto,
    tb_produtos.quantidade_estoque,
    tb_categorias.nome_categoria
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id_categoria
WHERE tb_categorias.id_categoria = 1;