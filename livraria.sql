-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Jun-2020 às 03:24
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `livrosvarejo`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `autor`
--

CREATE TABLE `autor` (
  `id_autor` int(8) NOT NULL,
  `nomeautor` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `autor`
--

INSERT INTO `autor` (`id_autor`, `nomeautor`) VALUES
(1, 'João Santos'),
(2, 'Laura Souza'),
(3, 'Mariana Ferreira'),
(4, 'Diego Vieira'),
(5, 'Nathalia Rodrigues'),
(6, 'Pedro Nogueira');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` bigint(20) NOT NULL,
  `cpf` bigint(20) NOT NULL,
  `nomecliente` varchar(50) NOT NULL,
  `EMAILcliente` varchar(50) NOT NULL,
  `telefonecliente` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `cpf`, `nomecliente`, `EMAILcliente`, `telefonecliente`) VALUES
(1, 45263256898, 'Adriana Silva', 'teste@teste.com', 11958586520),
(2, 45263256898, 'Adriana Silva', 'teste@teste.com', 11958586520),
(3, 45263256800, 'Clara Silva', 'teste2@teste.com', 11958586530),
(4, 45263256811, 'Silvia Silva', 'teste3@teste.com', 11958586540),
(5, 45263256822, 'Marcos Silva', 'teste4@teste.com', 11958586550),
(6, 45263256833, 'Kely Silva', 'teste5@teste.com', 11958586560);

-- --------------------------------------------------------

--
-- Estrutura da tabela `editora`
--

CREATE TABLE `editora` (
  `id_editora` int(8) NOT NULL,
  `nomeeditora` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `editora`
--

INSERT INTO `editora` (`id_editora`, `nomeeditora`) VALUES
(1, 'Intrínseca'),
(2, 'Abril'),
(3, 'Globo'),
(4, 'Sextante'),
(5, 'Novo conceito'),
(6, 'Planeta'),
(7, 'Leya');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE `estoque` (
  `id_estoque` bigint(20) NOT NULL,
  `id_livro` bigint(20) NOT NULL,
  `QTD` int(11) NOT NULL,
  `valor_unitário` float(6,2) NOT NULL,
  `valor_total` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `id_fornecedor` bigint(16) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefone` bigint(16) NOT NULL,
  `telefone2` bigint(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecimento`
--

CREATE TABLE `fornecimento` (
  `id_fornecimento` bigint(16) NOT NULL,
  `id_fornecedor` bigint(16) NOT NULL,
  `id_livro` bigint(16) NOT NULL,
  `nomelivrofornecido` varchar(30) NOT NULL,
  `qtd` int(16) NOT NULL,
  `valor_unitario` float(6,2) NOT NULL,
  `valor_total` double(8,2) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `generolivro`
--

CREATE TABLE `generolivro` (
  `id_genero` int(8) NOT NULL,
  `tipo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `generolivro`
--

INSERT INTO `generolivro` (`id_genero`, `tipo`) VALUES
(1, 'Drama'),
(2, 'Suspense'),
(3, 'Documentário'),
(4, 'Ficção'),
(5, 'Terror'),
(6, 'Fábulas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `livro`
--

CREATE TABLE `livro` (
  `id_livro` bigint(20) NOT NULL,
  `id_editora` int(8) DEFAULT NULL,
  `id_autor` int(8) DEFAULT NULL,
  `id_genero` int(8) DEFAULT NULL,
  `nomelivro` varchar(20) DEFAULT NULL,
  `paginas` int(8) DEFAULT NULL,
  `preço` float(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `livro`
--

INSERT INTO `livro` (`id_livro`, `id_editora`, `id_autor`, `id_genero`, `nomelivro`, `paginas`, `preço`) VALUES
(1, 1, 2, 3, 'A procura da Felicid', 254, 9.99),
(2, 2, 3, 4, 'Aculpa é das estrela', 350, 9.58),
(3, 3, 4, 5, 'Cavaleiros templario', 150, 4.56),
(4, 5, 1, 4, 'salve jorge', 148, 8.55),
(5, 1, 1, 1, 'Viagem no tempo', 235, 4.75),
(6, 2, 2, 2, 'Fantasmas', 333, 7.75),
(7, 3, 3, 3, 'Harry Potter', 235, 2.75),
(8, 4, 4, 4, 'o Clone', 235, 6.75),
(9, 5, 5, 5, 'A ilha perdida', 110, 3.56),
(10, 7, 6, 6, 'Novos Rumos', 89, 7.77);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `livro_cliente`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `livro_cliente` (
`id_venda` bigint(20)
,`id_livro` bigint(20)
,`nomelivro` varchar(20)
,`id_cliente` bigint(20)
,`nomecliente` varchar(50)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `livro_editora`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `livro_editora` (
`nomelivro` varchar(20)
,`nomeeditora` varchar(20)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `livro_vendedor`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `livro_vendedor` (
`id_venda` bigint(20)
,`id_livro` bigint(20)
,`nomelivro` varchar(20)
,`id_vendedor` bigint(20)
,`nomevendedor` varchar(50)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `total_vendas`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `total_vendas` (
`SUM(preço)` double(19,2)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `id_venda` bigint(20) NOT NULL,
  `id_cliente` bigint(20) NOT NULL,
  `id_vendedor` bigint(20) NOT NULL,
  `id_livro` bigint(20) NOT NULL,
  `qtd` int(16) DEFAULT NULL,
  `valorunitario` float(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`id_venda`, `id_cliente`, `id_vendedor`, `id_livro`, `qtd`, `valorunitario`) VALUES
(1, 6, 3, 1, NULL, NULL),
(2, 6, 3, 1, NULL, NULL),
(5, 4, 2, 2, NULL, NULL),
(6, 3, 4, 5, NULL, NULL),
(7, 3, 3, 3, NULL, NULL),
(8, 3, 3, 3, NULL, NULL),
(9, 5, 4, 7, NULL, NULL),
(10, 5, 4, 7, NULL, NULL),
(14, 6, 4, 6, NULL, NULL),
(15, 6, 4, 6, NULL, NULL),
(16, 5, 2, 8, NULL, NULL),
(17, 5, 2, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `venda_livro`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `venda_livro` (
`id_venda` bigint(20)
,`id_cliente` bigint(20)
,`id_livro` bigint(20)
,`preço` float(6,2)
,`nomelivro` varchar(20)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `venda_vendedor`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `venda_vendedor` (
`COUNT(id_vendedor)` bigint(21)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `id_vendedor` bigint(20) NOT NULL,
  `cpf` bigint(20) NOT NULL,
  `nomevendedor` varchar(50) NOT NULL,
  `EMAILvendedor` varchar(50) NOT NULL,
  `telefonevendedor` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vendedor`
--

INSERT INTO `vendedor` (`id_vendedor`, `cpf`, `nomevendedor`, `EMAILvendedor`, `telefonevendedor`) VALUES
(1, 45698712365, 'Maria Santana', 'teste5@teste.com', 11992052121),
(2, 45698712365, 'Maria Santana', 'teste5@teste.com', 11992052121),
(3, 45698712366, 'Josefa Santana', 'teste6@teste.com', 11992052122),
(4, 45698712367, 'João Santana', 'teste7@teste.com', 11992052123);

-- --------------------------------------------------------

--
-- Estrutura para vista `livro_cliente`
--
DROP TABLE IF EXISTS `livro_cliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `livro_cliente`  AS  select `venda`.`id_venda` AS `id_venda`,`livro`.`id_livro` AS `id_livro`,`livro`.`nomelivro` AS `nomelivro`,`cliente`.`id_cliente` AS `id_cliente`,`cliente`.`nomecliente` AS `nomecliente` from ((`venda` join `livro`) join `cliente`) where `venda`.`id_livro` = `livro`.`id_livro` and `venda`.`id_cliente` = `cliente`.`id_cliente` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `livro_editora`
--
DROP TABLE IF EXISTS `livro_editora`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `livro_editora`  AS  select `livro`.`nomelivro` AS `nomelivro`,`editora`.`nomeeditora` AS `nomeeditora` from (`livro` join `editora`) where `livro`.`id_editora` = `editora`.`id_editora` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `livro_vendedor`
--
DROP TABLE IF EXISTS `livro_vendedor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `livro_vendedor`  AS  select `venda`.`id_venda` AS `id_venda`,`livro`.`id_livro` AS `id_livro`,`livro`.`nomelivro` AS `nomelivro`,`vendedor`.`id_vendedor` AS `id_vendedor`,`vendedor`.`nomevendedor` AS `nomevendedor` from ((`venda` join `livro`) join `vendedor`) where `venda`.`id_livro` = `livro`.`id_livro` and `venda`.`id_vendedor` = `vendedor`.`id_vendedor` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `total_vendas`
--
DROP TABLE IF EXISTS `total_vendas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_vendas`  AS  select sum(`venda_livro`.`preço`) AS `SUM(preço)` from `venda_livro` where `venda_livro`.`preço` > 0 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `venda_livro`
--
DROP TABLE IF EXISTS `venda_livro`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `venda_livro`  AS  select `venda`.`id_venda` AS `id_venda`,`venda`.`id_cliente` AS `id_cliente`,`livro`.`id_livro` AS `id_livro`,`livro`.`preço` AS `preço`,`livro`.`nomelivro` AS `nomelivro` from (`venda` join `livro` on(`venda`.`id_livro` = `livro`.`id_livro`)) order by `livro`.`nomelivro` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `venda_vendedor`
--
DROP TABLE IF EXISTS `venda_vendedor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `venda_vendedor`  AS  select count(`venda`.`id_vendedor`) AS `COUNT(id_vendedor)` from `venda` where `venda`.`id_vendedor` = 4 ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_autor`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_cliente_2` (`id_cliente`),
  ADD KEY `id_cliente_3` (`id_cliente`);

--
-- Índices para tabela `editora`
--
ALTER TABLE `editora`
  ADD PRIMARY KEY (`id_editora`);

--
-- Índices para tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`id_estoque`),
  ADD KEY `id_estoque` (`id_estoque`,`id_livro`),
  ADD KEY `id_livro` (`id_livro`);

--
-- Índices para tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id_fornecedor`),
  ADD KEY `id_fornecedor` (`id_fornecedor`);

--
-- Índices para tabela `fornecimento`
--
ALTER TABLE `fornecimento`
  ADD PRIMARY KEY (`id_fornecimento`),
  ADD KEY `id_fornecimento` (`id_fornecimento`,`id_fornecedor`,`id_livro`),
  ADD KEY `id_fornecedor` (`id_fornecedor`),
  ADD KEY `id_livro` (`id_livro`);

--
-- Índices para tabela `generolivro`
--
ALTER TABLE `generolivro`
  ADD PRIMARY KEY (`id_genero`);

--
-- Índices para tabela `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`id_livro`),
  ADD KEY `FK_editora` (`id_editora`),
  ADD KEY `FK_autor` (`id_autor`),
  ADD KEY `FK_genero` (`id_genero`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`id_venda`) USING BTREE,
  ADD KEY `FK_c` (`id_cliente`),
  ADD KEY `FK_v` (`id_vendedor`),
  ADD KEY `FK_l` (`id_livro`) USING BTREE;

--
-- Índices para tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`id_vendedor`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `autor`
--
ALTER TABLE `autor`
  MODIFY `id_autor` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `editora`
--
ALTER TABLE `editora`
  MODIFY `id_editora` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `id_estoque` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `id_fornecedor` bigint(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecimento`
--
ALTER TABLE `fornecimento`
  MODIFY `id_fornecimento` bigint(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `generolivro`
--
ALTER TABLE `generolivro`
  MODIFY `id_genero` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `livro`
--
ALTER TABLE `livro`
  MODIFY `id_livro` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `id_venda` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `id_vendedor` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id_livro`);

--
-- Limitadores para a tabela `fornecimento`
--
ALTER TABLE `fornecimento`
  ADD CONSTRAINT `fornecimento_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`),
  ADD CONSTRAINT `fornecimento_ibfk_2` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id_livro`);

--
-- Limitadores para a tabela `livro`
--
ALTER TABLE `livro`
  ADD CONSTRAINT `FK_autor` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id_autor`),
  ADD CONSTRAINT `FK_editora` FOREIGN KEY (`id_editora`) REFERENCES `editora` (`id_editora`),
  ADD CONSTRAINT `FK_genero` FOREIGN KEY (`id_genero`) REFERENCES `generolivro` (`id_genero`);

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `FK_c` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `FK_livro` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id_livro`),
  ADD CONSTRAINT `FK_v` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id_vendedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
