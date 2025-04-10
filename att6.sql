CREATE DATABASE db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias (
    id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    area_conhecimento VARCHAR(50),
    nivel_dificuldade VARCHAR(30)
);

CREATE TABLE tb_cursos (
    id_curso BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    descricao_curso TEXT,
    preco_curso DECIMAL(7,2) NOT NULL,
    carga_horaria INT,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias (nome_categoria, area_conhecimento, nivel_dificuldade) VALUES
('Programação', 'Tecnologia', 'Intermediário'),
('Design Gráfico', 'Artes Visuais', 'Fácil'),
('Marketing Digital', 'Comunicação', 'Intermediário'),
('Negócios', 'Administração', 'Avançado'),
('Idiomas', 'Linguística', 'Fácil');

INSERT INTO tb_cursos (nome_curso, descricao_curso, preco_curso, carga_horaria, id_categoria) VALUES
('Java Completo', 'Curso completo de Java do básico ao avançado', 850.00, 60, 1),
('HTML & CSS', 'Criação de sites responsivos e modernos', 300.00, 40, 1),
('Photoshop para Iniciantes', 'Introdução ao Photoshop para design gráfico', 450.00, 30, 2),
('Marketing no Instagram', 'Técnicas de marketing voltadas ao Instagram', 600.00, 25, 3),
('Excel Avançado', 'Automatizações e planilhas em Excel', 750.00, 35, 4),
('Gestão de Projetos', 'Planejamento e execução de projetos empresariais', 980.00, 45, 4),
('Inglês Basico', 'Curso básico de inglês', 380.00, 20, 5),
('JavaScript Essencial', 'Conceitos e aplicações práticas de JavaScript', 670.00, 50, 1);

SELECT * FROM tb_cursos
WHERE preco_curso > 500.00;

SELECT * FROM tb_cursos
WHERE preco_curso BETWEEN 600.00 AND 1000.00;

SELECT * FROM tb_cursos
WHERE nome_curso LIKE '%J%';

SELECT * 
FROM tb_cursos
INNER JOIN tb_categorias ON tb_cursos.id_categoria = tb_categorias.id_categoria;

SELECT * 
FROM tb_cursos
INNER JOIN tb_categorias ON tb_cursos.id_categoria = tb_categorias.id_categoria
WHERE tb_categorias.id_categoria = 1;