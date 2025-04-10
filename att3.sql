CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    tipo_produto VARCHAR(50) NOT NULL,
    setor_localizacao VARCHAR(50) NOT NULL
);

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao_produto VARCHAR(255),
    preco DECIMAL(6,2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    categoria_id BIGINT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome_categoria, tipo_produto, setor_localizacao) VALUES
('Medicamentos', 'Controlado', 'Prateleira A'),
('Higiene Pessoal', 'Não Controlado', 'Prateleira B'),
('Vitaminas', 'Suplemento', 'Prateleira C'),
('Cosméticos', 'Beleza', 'Prateleira D'),
('Primeiros Socorros', 'Urgência', 'Prateleira E');

INSERT INTO tb_produtos (nome_produto, descricao_produto, preco, quantidade_estoque, categoria_id) VALUES
('Dipirona Sódica 500mg', 'Analgésico e antitérmico', 12.50, 100, 1),
('Shampoo Anticaspa', 'Para couro cabeludo sensível', 32.90, 50, 2),
('Vitamina C 1g', 'Auxilia na imunidade', 24.75, 60, 3),
('Protetor Solar FPS 60', 'Proteção contra raios UV', 58.00, 40, 4),
('Curativo Adesivo', 'Uso em pequenos ferimentos', 9.90, 120, 5),
('Colágeno Hidrolisado', 'Suplemento para pele e articulações', 79.99, 25, 3),
('Creme Hidratante Corporal', 'Pele seca e sensível', 44.90, 35, 4),
('Antisséptico Bucal', 'Combate germes e bactérias da boca', 15.80, 80, 2);

SELECT * FROM tb_produtos
WHERE preco > 50.00;

SELECT * FROM tb_produtos
WHERE preco BETWEEN 5.00 AND 60.00;

SELECT * FROM tb_produtos
WHERE nome_produto LIKE '%C%';

SELECT tb_produtos.id, 
       tb_produtos.nome_produto, 
       tb_produtos.descricao_produto, 
       tb_produtos.preco, 
       tb_produtos.quantidade_estoque, 
       tb_categorias.nome_categoria, 
       tb_categorias.tipo_produto, 
       tb_categorias.setor_localizacao
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id;

SELECT tb_produtos.id, 
       tb_produtos.nome_produto, 
       tb_produtos.descricao_produto, 
       tb_produtos.preco, 
       tb_produtos.quantidade_estoque, 
       tb_categorias.nome_categoria
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_categorias.id = 4;