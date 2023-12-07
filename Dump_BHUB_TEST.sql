-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 07, 2023 at 07:54 PM
-- Server version: 5.7.25
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `BHUB_TEST`
--

-- --------------------------------------------------------

--
-- Table structure for table `T_ACOES`
--

CREATE TABLE `T_ACOES` (
  `AC_ID` int(11) NOT NULL,
  `AC_DESC` varchar(200) NOT NULL,
  `AC_FUNCAO` varchar(200) NOT NULL,
  `AC_PARAMS` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_ACOES`
--

INSERT INTO `T_ACOES` (`AC_ID`, `AC_DESC`, `AC_FUNCAO`, `AC_PARAMS`) VALUES
(1, 'GUIA DE REMESSA PARA ENVIO', 'GUIA_REMESSA', 'PV_ID,PROD_ID'),
(2, 'GUIA PARA REMESSA DE ROYALTIES', 'GUIA_ROYALTIES', 'PV_ID,PROD_ID'),
(3, 'ATIVAR ASSOCIAÇÃO', 'ATIVAR_ASSOCIACAO', 'PV_ID,PROD_ID'),
(4, 'UPGRADE DE PLANO', 'UPGRADE_PLANO', 'PV_ID,PROD_ID'),
(5, 'PAGAMENTO DE COMISSÃO AO AGENTE', 'PGTO_COMISSAO', 'PV_ID, PROD_ID'),
(6, 'ENVIO DO VIDEO PRIMEIROS SOCORROS', 'ENVIO_VIDEO_PRIMEIROS_SOCORROS', 'PV_ID, PROD_ID');

-- --------------------------------------------------------

--
-- Table structure for table `T_CLIENTE`
--

CREATE TABLE `T_CLIENTE` (
  `CLI_ID` int(11) NOT NULL,
  `CLI_NOME` varchar(100) NOT NULL,
  `CLI_EMAIL` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_CLIENTE`
--

INSERT INTO `T_CLIENTE` (`CLI_ID`, `CLI_NOME`, `CLI_EMAIL`) VALUES
(1, 'ALVARO ZARAGOZA', 'alvaro@denzar.com.br'),
(2, 'ELAINE ZARAGOZA', 'elaine@denzar.com.br');

-- --------------------------------------------------------

--
-- Table structure for table `T_PEDIDO_VENDA`
--

CREATE TABLE `T_PEDIDO_VENDA` (
  `PV_ID` int(11) NOT NULL,
  `PV_DATA` date NOT NULL,
  `PV_CLI_ID` int(11) NOT NULL,
  `PV_TOTAL` decimal(15,2) NOT NULL,
  `PV_TOTAL_PAGO` decimal(15,2) NOT NULL,
  `PV_DT_PGTO` datetime NOT NULL,
  `PV_STATUS` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_PEDIDO_VENDA`
--

INSERT INTO `T_PEDIDO_VENDA` (`PV_ID`, `PV_DATA`, `PV_CLI_ID`, `PV_TOTAL`, `PV_TOTAL_PAGO`, `PV_DT_PGTO`, `PV_STATUS`) VALUES
(1, '2023-12-05', 1, '150.00', '150.00', '2023-12-05 00:00:00', 'E'),
(2, '2023-12-07', 2, '400.00', '400.00', '2023-12-07 00:00:00', 'P');

-- --------------------------------------------------------

--
-- Table structure for table `T_PRODUTOS`
--

CREATE TABLE `T_PRODUTOS` (
  `PROD_ID` int(11) NOT NULL,
  `PROD_NOME` varchar(100) NOT NULL,
  `PROD_VALOR` decimal(15,2) NOT NULL,
  `PROD_TIPO` varchar(20) NOT NULL,
  `PROD_STATUS` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_PRODUTOS`
--

INSERT INTO `T_PRODUTOS` (`PROD_ID`, `PROD_NOME`, `PROD_VALOR`, `PROD_TIPO`, `PROD_STATUS`) VALUES
(1, 'LIVRO ABC', '50.00', 'LIVRO', 'A'),
(2, 'LIVRO XYZ', '40.00', 'LIVRO', 'A'),
(3, 'PLANO MENSAL', '30.00', 'ASSINATURA', 'A'),
(4, 'PLANO ANUAL', '300.00', 'ASSINATURA', 'A'),
(5, 'VIDEO TREINO 1', '100.00', 'VIDEO', 'A'),
(6, 'VIDEO TREINO 2', '100.00', 'VIDEO', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `T_PROD_ACAO_PAG`
--

CREATE TABLE `T_PROD_ACAO_PAG` (
  `PRODACP_ID` int(11) NOT NULL,
  `PRODACP_PROD_ID` int(11) NOT NULL,
  `PRODACP_AC_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_PROD_ACAO_PAG`
--

INSERT INTO `T_PROD_ACAO_PAG` (`PRODACP_ID`, `PRODACP_PROD_ID`, `PRODACP_AC_ID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 5),
(4, 2, 1),
(5, 2, 2),
(6, 2, 5),
(7, 5, 6),
(8, 4, 3),
(9, 6, 1),
(10, 6, 5),
(11, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `T_PVP_ACOES`
--

CREATE TABLE `T_PVP_ACOES` (
  `PVPA_ID` int(11) NOT NULL,
  `PVPA_PVP_ID` int(11) NOT NULL,
  `PVPA_AC_ID` int(11) NOT NULL,
  `PVPA_PARAMS` varchar(1000) NOT NULL,
  `PVPA_STATUS` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `T_PV_ITENS`
--

CREATE TABLE `T_PV_ITENS` (
  `PVI_ID` int(11) NOT NULL,
  `PVI_PV_ID` int(11) NOT NULL,
  `PVI_PROD_ID` int(11) NOT NULL,
  `PVI_QTDE` decimal(15,2) NOT NULL,
  `PVI_VALOR` int(11) NOT NULL,
  `PVI_STATUS` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `T_PV_ITENS`
--

INSERT INTO `T_PV_ITENS` (`PVI_ID`, `PVI_PV_ID`, `PVI_PROD_ID`, `PVI_QTDE`, `PVI_VALOR`, `PVI_STATUS`) VALUES
(1, 1, 1, '1.00', 50, 'E'),
(2, 1, 5, '1.00', 100, 'E'),
(3, 2, 4, '1.00', 300, 'P'),
(4, 2, 6, '1.00', 100, 'P');

-- --------------------------------------------------------

--
-- Table structure for table `T_PV_PGTOS`
--

CREATE TABLE `T_PV_PGTOS` (
  `PVP_ID` int(11) NOT NULL,
  `PVP_PV_ID` int(11) NOT NULL,
  `PVP_VALOR` decimal(10,2) NOT NULL,
  `PVP_DATA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pv_itens_acoes`
-- (See below for the actual view)
--
CREATE TABLE `v_pv_itens_acoes` (
`PEDIDO` int(11)
,`DATA_PEDIDO` date
,`COD_CLIENTE` int(11)
,`NOME_CLIENTE` varchar(100)
,`EMAIL_CLIENTE` varchar(100)
,`COD_PRODUTO` int(11)
,`NOME_PRODUTO` varchar(100)
,`QTDE_PRODUTO` decimal(15,2)
,`VALOR_PRODUTO` int(11)
,`DESC_ACAO` varchar(200)
,`FUNCAO_ACAO` varchar(200)
,`PARAMS_ACAO` varchar(1000)
);

-- --------------------------------------------------------

--
-- Structure for view `v_pv_itens_acoes`
--
DROP TABLE IF EXISTS `v_pv_itens_acoes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pv_itens_acoes`  AS  select `PVI`.`PVI_PV_ID` AS `PEDIDO`,`PV`.`PV_DATA` AS `DATA_PEDIDO`,`PV`.`PV_CLI_ID` AS `COD_CLIENTE`,`CLI`.`CLI_NOME` AS `NOME_CLIENTE`,`CLI`.`CLI_EMAIL` AS `EMAIL_CLIENTE`,`PVI`.`PVI_PROD_ID` AS `COD_PRODUTO`,`PROD`.`PROD_NOME` AS `NOME_PRODUTO`,`PVI`.`PVI_QTDE` AS `QTDE_PRODUTO`,`PVI`.`PVI_VALOR` AS `VALOR_PRODUTO`,`AC`.`AC_DESC` AS `DESC_ACAO`,`AC`.`AC_FUNCAO` AS `FUNCAO_ACAO`,`AC`.`AC_PARAMS` AS `PARAMS_ACAO` from (((((`t_pv_itens` `PVI` left join `t_pedido_venda` `PV` on((`PV`.`PV_ID` = `PVI`.`PVI_PV_ID`))) left join `t_cliente` `CLI` on((`CLI`.`CLI_ID` = `PV`.`PV_CLI_ID`))) left join `t_produtos` `PROD` on((`PROD`.`PROD_ID` = `PVI`.`PVI_PROD_ID`))) left join `t_prod_acao_pag` `PAP` on((`PAP`.`PRODACP_PROD_ID` = `PROD`.`PROD_ID`))) left join `t_acoes` `AC` on((`AC`.`AC_ID` = `PAP`.`PRODACP_AC_ID`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `T_ACOES`
--
ALTER TABLE `T_ACOES`
  ADD PRIMARY KEY (`AC_ID`);

--
-- Indexes for table `T_CLIENTE`
--
ALTER TABLE `T_CLIENTE`
  ADD PRIMARY KEY (`CLI_ID`);

--
-- Indexes for table `T_PEDIDO_VENDA`
--
ALTER TABLE `T_PEDIDO_VENDA`
  ADD PRIMARY KEY (`PV_ID`),
  ADD KEY `PV_CLI_ID` (`PV_CLI_ID`);

--
-- Indexes for table `T_PRODUTOS`
--
ALTER TABLE `T_PRODUTOS`
  ADD PRIMARY KEY (`PROD_ID`);

--
-- Indexes for table `T_PROD_ACAO_PAG`
--
ALTER TABLE `T_PROD_ACAO_PAG`
  ADD PRIMARY KEY (`PRODACP_ID`),
  ADD KEY `PRODACP_PROD_ID` (`PRODACP_PROD_ID`),
  ADD KEY `PRODACP_AC_ID` (`PRODACP_AC_ID`);

--
-- Indexes for table `T_PVP_ACOES`
--
ALTER TABLE `T_PVP_ACOES`
  ADD PRIMARY KEY (`PVPA_ID`),
  ADD KEY `I_PVPA_PVP` (`PVPA_PVP_ID`),
  ADD KEY `PVPA_AC` (`PVPA_AC_ID`);

--
-- Indexes for table `T_PV_ITENS`
--
ALTER TABLE `T_PV_ITENS`
  ADD PRIMARY KEY (`PVI_ID`),
  ADD KEY `PVI_PV_ID` (`PVI_PV_ID`),
  ADD KEY `PVI_PROD_ID` (`PVI_PROD_ID`);

--
-- Indexes for table `T_PV_PGTOS`
--
ALTER TABLE `T_PV_PGTOS`
  ADD PRIMARY KEY (`PVP_ID`),
  ADD KEY `I_PVP_PV` (`PVP_PV_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `T_ACOES`
--
ALTER TABLE `T_ACOES`
  MODIFY `AC_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `T_CLIENTE`
--
ALTER TABLE `T_CLIENTE`
  MODIFY `CLI_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `T_PEDIDO_VENDA`
--
ALTER TABLE `T_PEDIDO_VENDA`
  MODIFY `PV_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `T_PRODUTOS`
--
ALTER TABLE `T_PRODUTOS`
  MODIFY `PROD_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `T_PROD_ACAO_PAG`
--
ALTER TABLE `T_PROD_ACAO_PAG`
  MODIFY `PRODACP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `T_PVP_ACOES`
--
ALTER TABLE `T_PVP_ACOES`
  MODIFY `PVPA_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `T_PV_ITENS`
--
ALTER TABLE `T_PV_ITENS`
  MODIFY `PVI_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `T_PV_PGTOS`
--
ALTER TABLE `T_PV_PGTOS`
  MODIFY `PVP_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `T_PEDIDO_VENDA`
--
ALTER TABLE `T_PEDIDO_VENDA`
  ADD CONSTRAINT `t_pedido_venda_ibfk_1` FOREIGN KEY (`PV_CLI_ID`) REFERENCES `T_CLIENTE` (`CLI_ID`);

--
-- Constraints for table `T_PROD_ACAO_PAG`
--
ALTER TABLE `T_PROD_ACAO_PAG`
  ADD CONSTRAINT `t_prod_acao_pag_ibfk_1` FOREIGN KEY (`PRODACP_PROD_ID`) REFERENCES `T_PRODUTOS` (`PROD_ID`),
  ADD CONSTRAINT `t_prod_acao_pag_ibfk_2` FOREIGN KEY (`PRODACP_AC_ID`) REFERENCES `T_ACOES` (`AC_ID`);

--
-- Constraints for table `T_PVP_ACOES`
--
ALTER TABLE `T_PVP_ACOES`
  ADD CONSTRAINT `t_pvp_acoes_ibfk_1` FOREIGN KEY (`PVPA_AC_ID`) REFERENCES `T_ACOES` (`AC_ID`),
  ADD CONSTRAINT `t_pvp_acoes_ibfk_2` FOREIGN KEY (`PVPA_PVP_ID`) REFERENCES `T_PV_PGTOS` (`PVP_ID`);

--
-- Constraints for table `T_PV_ITENS`
--
ALTER TABLE `T_PV_ITENS`
  ADD CONSTRAINT `t_pv_itens_ibfk_1` FOREIGN KEY (`PVI_PV_ID`) REFERENCES `T_PEDIDO_VENDA` (`PV_ID`),
  ADD CONSTRAINT `t_pv_itens_ibfk_2` FOREIGN KEY (`PVI_PROD_ID`) REFERENCES `T_PRODUTOS` (`PROD_ID`);

--
-- Constraints for table `T_PV_PGTOS`
--
ALTER TABLE `T_PV_PGTOS`
  ADD CONSTRAINT `t_pv_pgtos_ibfk_1` FOREIGN KEY (`PVP_PV_ID`) REFERENCES `T_PEDIDO_VENDA` (`PV_ID`);
