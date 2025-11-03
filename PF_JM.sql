-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 03/11/2025 às 08:57
-- Versão do servidor: 9.1.0
-- Versão do PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `gestao_stock`
--
CREATE DATABASE IF NOT EXISTS `gestao_stock` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `gestao_stock`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `autorizacao`
--
-- Criação: 31/10/2025 às 17:06
--

DROP TABLE IF EXISTS `autorizacao`;
CREATE TABLE IF NOT EXISTS `autorizacao` (
  `id_autorizacao` int NOT NULL AUTO_INCREMENT,
  `id_requisicao` int NOT NULL,
  `id_funcionario` int NOT NULL,
  `data_autorizacao` date NOT NULL,
  `observacoes` varchar(100) NOT NULL,
  `aprovado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_autorizacao`),
  KEY `autorizacao_requisicao_interna_FK` (`id_requisicao`),
  KEY `autorizacao_funcionario_FK` (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `autorizacao`
--

INSERT INTO `autorizacao` (`id_autorizacao`, `id_requisicao`, `id_funcionario`, `data_autorizacao`, `observacoes`, `aprovado`) VALUES
(11, 1, 1, '2025-10-21', 'Autorizado sem restrições.', 1),
(12, 2, 2, '2025-10-22', 'Aprovado após análise da chefia.', 1),
(13, 3, 3, '2025-10-23', 'Rejeitado por falta de justificativa.', 0),
(14, 4, 4, '2025-10-24', 'Aprovado com ressalvas sobre orçamento.', 1),
(15, 5, 5, '2025-10-25', 'Em análise — pendente de documentação.', 0),
(16, 6, 6, '2025-10-26', 'Aprovado automaticamente pelo sistema.', 1),
(17, 7, 7, '2025-10-27', 'Rejeitado — informação inconsistente.', 0),
(18, 8, 8, '2025-10-28', 'Aprovado após segunda revisão.', 1),
(19, 9, 9, '2025-10-29', 'Aprovado — urgência confirmada.', 1),
(20, 10, 10, '2025-10-30', 'Negado — pedido duplicado.', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--
-- Criação: 31/10/2025 às 16:55
-- Última atualização: 31/10/2025 às 16:59
--

DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE IF NOT EXISTS `funcionario` (
  `id_funcionario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `setor` varchar(50) NOT NULL,
  PRIMARY KEY (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `funcionario`
--

INSERT INTO `funcionario` (`id_funcionario`, `nome`, `email`, `telefone`, `setor`) VALUES
(1, 'Ana Silva', 'ana.silva@email.com', '11987654321', 'Financeiro'),
(2, 'Bruno Souza', 'bruno.souza@email.com', '11912345678', 'TI'),
(3, 'Carla Mendes', 'carla.mendes@email.com', '11923456789', 'RH'),
(4, 'Daniel Costa', 'daniel.costa@email.com', '11934567890', 'Compras'),
(5, 'Eduardo Lima', 'eduardo.lima@email.com', '11945678901', 'Marketing'),
(6, 'Fernanda Rocha', 'fernanda.rocha@email.com', '11956789012', 'Vendas'),
(7, 'Gabriel Alves', 'gabriel.alves@email.com', '11967890123', 'TI'),
(8, 'Helena Martins', 'helena.martins@email.com', '11978901234', 'Financeiro'),
(9, 'Igor Pereira', 'igor.pereira@email.com', '11989012345', 'RH'),
(10, 'Juliana Nunes', 'juliana.nunes@email.com', '11990123456', 'Compras');

-- --------------------------------------------------------

--
-- Estrutura para tabela `inventario`
--
-- Criação: 31/10/2025 às 17:06
--

DROP TABLE IF EXISTS `inventario`;
CREATE TABLE IF NOT EXISTS `inventario` (
  `id_inventario` int NOT NULL AUTO_INCREMENT,
  `data_inventario` date NOT NULL,
  `id_funcionario` int NOT NULL,
  `descricao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `concluido` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_inventario`),
  KEY `inventario_funcionario_FK` (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `inventario`
--

INSERT INTO `inventario` (`id_inventario`, `data_inventario`, `id_funcionario`, `descricao`, `concluido`) VALUES
(1, '2025-10-01', 1, 'Inventário mensal do armazém principal.', 1),
(2, '2025-10-02', 2, 'Verificação de equipamentos de escritório.', 1),
(3, '2025-10-03', 3, 'Inventário parcial da secção de informática.', 0),
(4, '2025-10-04', 4, 'Contagem de material de limpeza.', 1),
(5, '2025-10-05', 5, 'Revisão do stock de peças automotivas.', 0),
(6, '2025-10-06', 6, 'Auditoria de inventário anual.', 1),
(7, '2025-10-07', 7, 'Inventário de produtos devolvidos.', 1),
(8, '2025-10-08', 8, 'Verificação de ativos fixos.', 0),
(9, '2025-10-09', 9, 'Inventário de segurança e EPI.', 1),
(10, '2025-10-10', 10, 'Revisão final do inventário geral.', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_inventario`
--
-- Criação: 31/10/2025 às 17:07
--

DROP TABLE IF EXISTS `item_inventario`;
CREATE TABLE IF NOT EXISTS `item_inventario` (
  `id_item_inventario` int NOT NULL AUTO_INCREMENT,
  `id_inventario` int NOT NULL,
  `id_material` int NOT NULL,
  `quantidade_sistema` int NOT NULL,
  `quantidade_contada` int NOT NULL,
  `observacoes` varchar(100) NOT NULL,
  PRIMARY KEY (`id_item_inventario`),
  KEY `item_inventario_inventario_FK` (`id_inventario`),
  KEY `item_inventario_material_FK` (`id_material`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `item_inventario`
--

INSERT INTO `item_inventario` (`id_item_inventario`, `id_inventario`, `id_material`, `quantidade_sistema`, `quantidade_contada`, `observacoes`) VALUES
(21, 1, 1, 100, 95, 'Diferença de 5 unidades — ajuste realizado.'),
(22, 2, 2, 50, 50, 'Sem divergências encontradas.'),
(23, 3, 3, 30, 32, 'Excedente identificado durante contagem.'),
(24, 4, 4, 22, 20, 'Faltam 2 unidades, verificado extravio.'),
(25, 5, 5, 120, 120, 'Inventário conforme sistema.'),
(26, 6, 6, 80, 78, 'Pequena diferença corrigida.'),
(27, 7, 7, 40, 40, 'Tudo em ordem.'),
(28, 8, 8, 10, 15, 'Excedente de 5 unidades corrigido.'),
(29, 9, 9, 198, 200, 'Diferença ajustada após conferência.'),
(30, 10, 10, 67, 67, 'Contagem exata — sem acertos.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_requisicao`
--
-- Criação: 31/10/2025 às 17:08
--

DROP TABLE IF EXISTS `item_requisicao`;
CREATE TABLE IF NOT EXISTS `item_requisicao` (
  `id_item_requisicao` int NOT NULL AUTO_INCREMENT,
  `id_requisicao` int NOT NULL,
  `id_material` int NOT NULL,
  `posicao` int NOT NULL,
  `quantidade_solicitada` int NOT NULL,
  `quantidade_aprovada` int NOT NULL,
  PRIMARY KEY (`id_item_requisicao`),
  KEY `item_requisicao_requisicao_interna_FK` (`id_requisicao`),
  KEY `item_requisicao_material_FK` (`id_material`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `item_requisicao`
--

INSERT INTO `item_requisicao` (`id_item_requisicao`, `id_requisicao`, `id_material`, `posicao`, `quantidade_solicitada`, `quantidade_aprovada`) VALUES
(1, 1, 1, 1, 10, 10),
(2, 1, 2, 2, 5, 5),
(3, 2, 1, 3, 2, 2),
(4, 2, 2, 4, 1, 1),
(5, 3, 1, 5, 3, 3),
(6, 4, 1, 6, 1, 0),
(7, 5, 1, 7, 4, 0),
(8, 6, 1, 8, 2, 2),
(9, 7, 1, 3, 1, 0),
(10, 8, 1, 9, 20, 20);

-- --------------------------------------------------------

--
-- Estrutura para tabela `material`
--
-- Criação: 31/10/2025 às 16:57
-- Última atualização: 31/10/2025 às 16:59
--

DROP TABLE IF EXISTS `material`;
CREATE TABLE IF NOT EXISTS `material` (
  `id_material` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `unidade` varchar(100) NOT NULL,
  `preco` decimal(10,0) NOT NULL,
  `estoque` int NOT NULL,
  PRIMARY KEY (`id_material`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `material`
--

INSERT INTO `material` (`id_material`, `nome`, `categoria`, `unidade`, `preco`, `estoque`) VALUES
(1, 'Caneta Azul', 'Escritório', 'unidade', 2, 100),
(2, 'Caderno A4', 'Escritório', 'unidade', 12, 50),
(3, 'Mouse Óptico', 'Informática', 'unidade', 45, 25),
(4, 'Teclado Mecânico', 'Informática', 'unidade', 120, 10),
(5, 'Papel Sulfite A4', 'Escritório', 'resma', 25, 30),
(6, 'HD Externo 1TB', 'Informática', 'unidade', 400, 5),
(7, 'Mochila Executiva', 'Acessórios', 'unidade', 150, 20),
(8, 'Toner Impressora', 'Suprimento', 'unidade', 350, 15),
(9, 'Fita Adesiva', 'Escritório', 'unidade', 5, 200),
(10, 'Caixa de Clips', 'Escritório', 'pacote', 3, 100);

-- --------------------------------------------------------

--
-- Estrutura para tabela `requisicao_interna`
--
-- Criação: 31/10/2025 às 17:03
--

DROP TABLE IF EXISTS `requisicao_interna`;
CREATE TABLE IF NOT EXISTS `requisicao_interna` (
  `id_requisicao` int NOT NULL AUTO_INCREMENT,
  `id_funcionario` int NOT NULL,
  `id_tipo_requisicao` int DEFAULT NULL,
  `data_requisicao` date NOT NULL,
  `setor` varchar(100) NOT NULL,
  PRIMARY KEY (`id_requisicao`),
  KEY `requisicao_interna_funcionario_FK` (`id_funcionario`),
  KEY `requisicao_interna_tipo_requisicao_FK` (`id_tipo_requisicao`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `requisicao_interna`
--

INSERT INTO `requisicao_interna` (`id_requisicao`, `id_funcionario`, `id_tipo_requisicao`, `data_requisicao`, `setor`) VALUES
(1, 1, 1, '2025-10-01', 'Financeiro'),
(2, 2, 2, '2025-10-02', 'TI'),
(3, 3, 1, '2025-10-03', 'RH'),
(4, 4, 3, '2025-10-04', 'Compras'),
(5, 5, 5, '2025-10-05', 'Marketing'),
(6, 6, 6, '2025-10-06', 'Vendas'),
(7, 7, 2, '2025-10-07', 'TI'),
(8, 8, 4, '2025-10-08', 'Financeiro'),
(9, 9, 7, '2025-10-09', 'RH'),
(10, 10, 8, '2025-10-10', 'Compras');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_requisicao`
--
-- Criação: 31/10/2025 às 16:55
-- Última atualização: 31/10/2025 às 16:59
--

DROP TABLE IF EXISTS `tipo_requisicao`;
CREATE TABLE IF NOT EXISTS `tipo_requisicao` (
  `id_tipo_requisicao` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_tipo_requisicao`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tipo_requisicao`
--

INSERT INTO `tipo_requisicao` (`id_tipo_requisicao`, `descricao`) VALUES
(1, 'Material de Escritório'),
(2, 'Equipamento de Informática'),
(3, 'Manutenção'),
(4, 'Treinamento'),
(5, 'Marketing'),
(6, 'Produto para Cliente'),
(7, 'Transporte Interno'),
(8, 'Suprimento de Produção'),
(9, 'Segurança'),
(10, 'Limpeza');

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `autorizacao`
--
ALTER TABLE `autorizacao`
  ADD CONSTRAINT `autorizacao_funcionario_FK` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`),
  ADD CONSTRAINT `autorizacao_requisicao_interna_FK` FOREIGN KEY (`id_requisicao`) REFERENCES `requisicao_interna` (`id_requisicao`);

--
-- Restrições para tabelas `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_funcionario_FK` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`);

--
-- Restrições para tabelas `item_inventario`
--
ALTER TABLE `item_inventario`
  ADD CONSTRAINT `item_inventario_inventario_FK` FOREIGN KEY (`id_inventario`) REFERENCES `inventario` (`id_inventario`),
  ADD CONSTRAINT `item_inventario_material_FK` FOREIGN KEY (`id_material`) REFERENCES `material` (`id_material`);

--
-- Restrições para tabelas `item_requisicao`
--
ALTER TABLE `item_requisicao`
  ADD CONSTRAINT `item_requisicao_material_FK` FOREIGN KEY (`id_material`) REFERENCES `material` (`id_material`),
  ADD CONSTRAINT `item_requisicao_requisicao_interna_FK` FOREIGN KEY (`id_requisicao`) REFERENCES `requisicao_interna` (`id_requisicao`);

--
-- Restrições para tabelas `requisicao_interna`
--
ALTER TABLE `requisicao_interna`
  ADD CONSTRAINT `requisicao_interna_funcionario_FK` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`),
  ADD CONSTRAINT `requisicao_interna_tipo_requisicao_FK` FOREIGN KEY (`id_tipo_requisicao`) REFERENCES `tipo_requisicao` (`id_tipo_requisicao`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
