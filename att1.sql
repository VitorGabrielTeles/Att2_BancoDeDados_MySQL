CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

CREATE TABLE tb_classes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    tipo_ataque VARCHAR(30) NOT NULL,
    nivel_dificuldade VARCHAR(20) NOT NULL
);

CREATE TABLE tb_personagens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    nivel INT NOT NULL,
    classe_id BIGINT,
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

INSERT INTO tb_classes (nome, tipo_ataque, nivel_dificuldade) VALUES
('Guerreiro', 'Corpo a Corpo', 'Fácil'),
('Arqueiro', 'Distância', 'Médio'),
('Mestre dos Magos', 'Magia', 'Difícil'),
('Assassino', 'Corpo a Corpo', 'Difícil'),
('Cavaleiro', 'Corpo a Corpo', 'Médio');

SELECT * FROM tb_classes;

INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, nivel, classe_id) VALUES
('Juvenal', 2200, 1500, 10, 1),
('Dextrover', 1800, 1100, 8, 2),
('Edilberto', 2500, 900, 12, 3),
('Jobson', 2100, 1300, 9, 2),
('Morgana', 1700, 1600, 7, 3),
('Astolfo', 2300, 1000, 11, 4),
('Hillary Clintom', 1900, 800, 6, 5),
('Cacilda', 2600, 1700, 13, 1);

SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

SELECT 
    tb_personagens.id,
    tb_personagens.nome AS nome_personagem,
    tb_personagens.poder_ataque,
    tb_personagens.poder_defesa,
    tb_personagens.nivel,
    tb_classes.nome AS nome_classe,
    tb_classes.tipo_ataque,
    tb_classes.nivel_dificuldade
FROM tb_personagens
INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id;

SELECT 
    tb_personagens.id,
    tb_personagens.nome AS nome_personagem,
    tb_personagens.poder_ataque,
    tb_personagens.poder_defesa,
    tb_personagens.nivel,
    tb_classes.nome AS nome_classe,
    tb_classes.tipo_ataque,
    tb_classes.nivel_dificuldade
FROM tb_personagens
INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id
WHERE tb_classes.id = 2;