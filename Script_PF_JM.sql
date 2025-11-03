INSERT INTO funcionario (nome, email, telefone, setor) VALUES
('Ana Silva', 'ana.silva@email.com', '11987654321', 'Financeiro'),
('Bruno Souza', 'bruno.souza@email.com', '11912345678', 'TI'),
('Carla Mendes', 'carla.mendes@email.com', '11923456789', 'RH'),
('Daniel Costa', 'daniel.costa@email.com', '11934567890', 'Compras'),
('Eduardo Lima', 'eduardo.lima@email.com', '11945678901', 'Marketing'),
('Fernanda Rocha', 'fernanda.rocha@email.com', '11956789012', 'Vendas'),
('Gabriel Alves', 'gabriel.alves@email.com', '11967890123', 'TI'),
('Helena Martins', 'helena.martins@email.com', '11978901234', 'Financeiro'),
('Igor Pereira', 'igor.pereira@email.com', '11989012345', 'RH'),
('Juliana Nunes', 'juliana.nunes@email.com', '11990123456', 'Compras');
 
INSERT INTO tipo_requisicao (descricao) VALUES
('Material de Escritório'),
('Equipamento de Informática'),
('Manutenção'),
('Treinamento'),
('Marketing'),
('Produto para Cliente'),
('Transporte Interno'),
('Suprimento de Produção'),
('Segurança'),
('Limpeza');
 
INSERT INTO material (nome, categoria, unidade, preco, estoque) VALUES
('Caneta Azul', 'Escritório', 'unidade', 1.50, 100),
('Caderno A4', 'Escritório', 'unidade', 12.00, 50),
('Mouse Óptico', 'Informática', 'unidade', 45.00, 25),
('Teclado Mecânico', 'Informática', 'unidade', 120.00, 10),
('Papel Sulfite A4', 'Escritório', 'resma', 25.00, 30),
('HD Externo 1TB', 'Informática', 'unidade', 400.00, 5),
('Mochila Executiva', 'Acessórios', 'unidade', 150.00, 20),
('Toner Impressora', 'Suprimento', 'unidade', 350.00, 15),
('Fita Adesiva', 'Escritório', 'unidade', 5.00, 200),
('Caixa de Clips', 'Escritório', 'pacote', 3.00, 100);
 
INSERT INTO requisicao_interna (id_funcionario, id_tipo_requisicao, data_requisicao, setor) VALUES
(1, 1, '2025-10-01', 'Financeiro'),
(2, 2, '2025-10-02', 'TI'),
(3, 1, '2025-10-03', 'RH'),
(4, 3, '2025-10-04', 'Compras'),
(5, 5, '2025-10-05', 'Marketing'),
(6, 6, '2025-10-06', 'Vendas'),
(7, 2, '2025-10-07', 'TI'),
(8, 4, '2025-10-08', 'Financeiro'),
(9, 7, '2025-10-09', 'RH'),
(10, 8, '2025-10-10', 'Compras');
 
INSERT INTO Item_Requisicao (id_requisicao, id_material, posicao, quantidade_solicitada, quantidade_aprovada) VALUES
(1, 1, 1, 10, 10),
(1, 2, 2, 5, 5),
(2, 1, 3, 2, 2),
(2, 2, 4, 1, 1),
(3, 1, 5, 3, 3),
(4, 1, 6, 1, 0),
(5, 1, 7, 4, 0),
(6, 1, 8, 2, 2),
(7, 1, 3, 1, 0),
(8, 1, 9, 20, 20);

INSERT INTO inventario (data_inventario, id_funcionario, descricao, concluido) VALUES
('2025-10-01', 1, 'Inventário mensal do armazém principal.', TRUE),
('2025-10-02', 2, 'Verificação de equipamentos de escritório.', TRUE),
('2025-10-03', 3, 'Inventário parcial da secção de informática.', FALSE),
('2025-10-04', 4, 'Contagem de material de limpeza.', TRUE),
('2025-10-05', 5, 'Revisão do stock de peças automotivas.', FALSE),
('2025-10-06', 6, 'Auditoria de inventário anual.', TRUE),
('2025-10-07', 7, 'Inventário de produtos devolvidos.', TRUE),
('2025-10-08', 8, 'Verificação de ativos fixos.', FALSE),
('2025-10-09', 9, 'Inventário de segurança e EPI.', TRUE),
('2025-10-10', 10, 'Revisão final do inventário geral.', TRUE);

INSERT INTO item_inventario (id_inventario, id_material, quantidade_contada, quantidade_sistema, observacoes) VALUES
(1, 1, 95, 100, 'Diferença de 5 unidades — ajuste realizado.'),
(2, 2, 50, 50, 'Sem divergências encontradas.'),
(3, 3, 32, 30, 'Excedente identificado durante contagem.'),
(4, 4, 20, 22, 'Faltam 2 unidades, verificado extravio.'),
(5, 5, 120, 120, 'Inventário conforme sistema.'),
(6, 6, 78, 80, 'Pequena diferença corrigida.'),
(7, 7, 40, 40, 'Tudo em ordem.'),
(8, 8, 15, 10, 'Excedente de 5 unidades corrigido.'),
(9, 9, 200, 198, 'Diferença ajustada após conferência.'),
(10, 10, 67, 67, 'Contagem exata — sem acertos.');

INSERT INTO autorizacao (id_requisicao, id_funcionario, data_autorizacao, observacoes, aprovado) VALUES
(1, 1, '2025-10-21', 'Autorizado sem restrições.', TRUE),
(2, 2, '2025-10-22', 'Aprovado após análise da chefia.', TRUE),
(3, 3, '2025-10-23', 'Rejeitado por falta de justificativa.', FALSE),
(4, 4, '2025-10-24', 'Aprovado com ressalvas sobre orçamento.', TRUE),
(5, 5, '2025-10-25', 'Em análise — pendente de documentação.', FALSE),
(6, 6, '2025-10-26', 'Aprovado automaticamente pelo sistema.', TRUE),
(7, 7, '2025-10-27', 'Rejeitado — informação inconsistente.', FALSE),
(8, 8, '2025-10-28', 'Aprovado após segunda revisão.', TRUE),
(9, 9, '2025-10-29', 'Aprovado — urgência confirmada.', TRUE),
(10, 10, '2025-10-30', 'Negado — pedido duplicado.', FALSE);


SELECT nome, setor, email
FROM funcionario
ORDER BY nome ASC;
 
SELECT r.id_requisicao, f.nome AS funcionario, r.data_requisicao, t.descricao AS tipo_requisicao
FROM requisicao_interna r
INNER JOIN funcionario f ON r.id_funcionario = f.id_funcionario
INNER JOIN tipo_requisicao t ON r.id_tipo_requisicao = t.id_tipo_requisicao;
 
SELECT nome, categoria, preco
FROM material
WHERE nome LIKE '%papel%';
 
SELECT categoria, COUNT(*) AS total_materiais
FROM material
GROUP BY categoria;
 
SELECT categoria,
AVG(preco) AS preco_medio,
MAX(preco) AS preco_maximo,
MIN(preco) AS preco_minimo
FROM material
GROUP BY categoria;
 
SELECT nome, preco
FROM material
WHERE preco > (
SELECT AVG(preco) FROM material
);

CREATE USER 'Socio'@'localhost0' IDENTIFIED BY 'senha123';
CREATE USER 'Professor'@'localhost01' IDENTIFIED BY 'senha321';
CREATE USER 'Funcionario'@'localhost02' IDENTIFIED BY 'senha456';
CREATE USER 'Administrador'@'localhost03' IDENTIFIED BY 'senha654';

CREATE ROLE Socio;
CREATE ROLE Professor;
CREATE ROLE Funcionario;
CREATE ROLE Administrador;


GRANT ALL PRIVILEGES ON ALL TABLES TO Administrador;

GRANT SELECT ON socio TO Socio;
GRANT SELECT ON pagamento TO Socio;


GRANT INSERT, UPDATE, SELECT ON presencas TO Professor;
GRANT SELECT ON aulas TO Professor;
GRANT SELECT ON socio TO Professor;


GRANT INSERT, UPDATE, SELECT ON vendas TO Funcionario;
GRANT INSERT, UPDATE, SELECT ON vendas_produtos TO Funcionario;
GRANT INSERT, UPDATE, SELECT ON check_in_out TO Funcionario;
GRANT INSERT, UPDATE, SELECT ON pagamento TO Funcionario;
GRANT SELECT ON socio TO Funcionario;

REVOKE ALL ON pagamento FROM Socio, Professor;
REVOKE ALL ON vendas FROM Socio, Professor;
REVOKE ALL ON vendas_produtos FROM Socio, Professor;











