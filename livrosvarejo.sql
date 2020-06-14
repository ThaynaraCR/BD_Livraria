-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Jun-2020 às 05:02
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
  `nome` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `autor`
--

INSERT INTO `autor` (`id_autor`, `nome`) VALUES
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
  `nome` varchar(50) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `telefone` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `cpf`, `nome`, `EMAIL`, `telefone`) VALUES
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
  `nome` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `editora`
--

INSERT INTO `editora` (`id_editora`, `nome`) VALUES
(1, 'Intrínseca'),
(2, 'Abril'),
(3, 'Globo'),
(4, 'Sextante'),
(5, 'Novo conceito'),
(6, 'Planeta'),
(7, 'Leya');

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
  `id_livro` int(8) NOT NULL,
  `id_editora` int(8) DEFAULT NULL,
  `id_autor` int(8) DEFAULT NULL,
  `id_genero` int(8) DEFAULT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `paginas` int(8) DEFAULT NULL,
  `preço` float(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `livro`
--

INSERT INTO `livro` (`id_livro`, `id_editora`, `id_autor`, `id_genero`, `nome`, `paginas`, `preço`) VALUES
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
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `id_venda` bigint(20) NOT NULL,
  `id_cliente` bigint(20) NOT NULL,
  `id_vendedor` bigint(20) NOT NULL,
  `id_livro` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`id_venda`, `id_cliente`, `id_vendedor`, `id_livro`) VALUES
(1, 6, 3, 1),
(2, 6, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `id_vendedor` bigint(20) NOT NULL,
  `cpf` bigint(20) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `telefone` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vendedor`
--

INSERT INTO `vendedor` (`id_vendedor`, `cpf`, `nome`, `EMAIL`, `telefone`) VALUES
(1, 45698712365, 'Maria Santana', 'teste5@teste.com', 11992052121),
(2, 45698712365, 'Maria Santana', 'teste5@teste.com', 11992052121),
(3, 45698712366, 'Josefa Santana', 'teste6@teste.com', 11992052122),
(4, 45698712367, 'João Santana', 'teste7@teste.com', 11992052123);

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
  ADD PRIMARY KEY (`id_venda`),
  ADD KEY `FK_c` (`id_cliente`),
  ADD KEY `FK_v` (`id_vendedor`);

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
-- AUTO_INCREMENT de tabela `generolivro`
--
ALTER TABLE `generolivro`
  MODIFY `id_genero` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `livro`
--
ALTER TABLE `livro`
  MODIFY `id_livro` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `id_venda` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `id_vendedor` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

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
  ADD CONSTRAINT `FK_v` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id_vendedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
