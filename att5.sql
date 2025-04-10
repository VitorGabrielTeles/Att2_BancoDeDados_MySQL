CREATE DATABASE db_construindo_vidas;
USE db_construindo_vidas;

CREATE TABLE tb_categorias (
    id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    setor_localizacao VARCHAR(50),
    tipo_material VARCHAR(50)
);

CREATE TABLE tb_produtos (
    id_produto BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao_produto VARCHAR(255),
    preco_produto DECIMAL(7,2) NOT NULL,
    quantidade_estoque INT,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias (nome_categoria, setor_localizacao, tipo_material) VALUES
('Elétrica', 'Corredor A', 'Fios e iluminação'),
('Hidráulica', 'Corredor B', 'Tubos e conexões'),
('Ferramentas', 'Corredor C', 'Manuais e elétricas'),
('Tinta', 'Corredor D', 'Tintas e solventes'),
('Acabamento', 'Corredor E', 'Pisos e revestimentos');

INSERT INTO tb_produtos (nome_produto, descricao_produto, preco_produto, quantidade_estoque, id_categoria) VALUES
('Fio 2.5mm', 'Rolo de fio elétrico 2.5mm', 145.00, 20, 1),
('Interruptor Simples', 'Modelo básico para para colocar em casa', 18.50, 50, 1),
('Torneira', 'Torneira para jardim', 42.00, 35, 2),
('Joelho 90° 25mm', 'Peça para encaixe de tubos', 5.20, 200, 2),
('Chave de Fenda', 'Chave manual média', 21.90, 60, 3),
('Furadeira 650W', 'Ferramenta elétrica', 139.99, 15, 3),
('Tinta 18L', 'Branco, para interior', 125.00, 10, 4),
('Rejunte Branco 1kg', 'Rejunte para acabamento de pisos', 13.75, 40, 5);

SELECT * FROM tb_produtos
WHERE preco_produto > 100.00;

SELECT * FROM tb_produtos
WHERE preco_produto BETWEEN 70.00 AND 150.00;

SELECT * FROM tb_produtos
WHERE nome_produto LIKE '%C%';

SELECT 
    tb_produtos.id_produto,
    tb_produtos.nome_produto,
    tb_produtos.descricao_produto,
    tb_produtos.preco_produto,
    tb_produtos.quantidade_estoque,
    tb_categorias.nome_categoria,
    tb_categorias.setor_localizacao,
    tb_categorias.tipo_material
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
WHERE tb_categorias.id_categoria = 2;