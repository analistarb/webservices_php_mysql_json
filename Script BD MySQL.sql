

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `produto`
-- ----------------------------
DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `ProdutoId` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(50) DEFAULT NULL,
  `ProdutoCategoriaId` int(11) DEFAULT NULL,
  `DataCadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`ProdutoId`),
  KEY `FK_Produto_ProdutoCategoria` (`ProdutoCategoriaId`),
  CONSTRAINT `FK_Produto_ProdutoCategoria` FOREIGN KEY (`ProdutoCategoriaId`) REFERENCES `produtocategoria` (`ProdutoCategoriaId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of produto
-- ----------------------------
INSERT INTO `produto` VALUES ('1', 'DELL VOSTRO', '1', '2016-01-24 14:26:55');
INSERT INTO `produto` VALUES ('2', 'HP ENVY', '1', '2016-01-24 14:26:55');
INSERT INTO `produto` VALUES ('3', 'MICROSOFT', '2', '2016-01-24 14:26:55');
INSERT INTO `produto` VALUES ('4', 'LOGITEC', '2', '2016-01-24 14:26:55');
INSERT INTO `produto` VALUES ('5', 'HP OFFICEJET', '3', '2016-01-24 14:26:55');
INSERT INTO `produto` VALUES ('6', 'HP LASERJET', '3', '2016-01-24 14:26:55');

-- ----------------------------
-- Table structure for `produtocategoria`
-- ----------------------------
DROP TABLE IF EXISTS `produtocategoria`;
CREATE TABLE `produtocategoria` (
  `ProdutoCategoriaId` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ProdutoCategoriaId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of produtocategoria
-- ----------------------------
INSERT INTO `produtocategoria` VALUES ('1', 'NOTEBOOKS');
INSERT INTO `produtocategoria` VALUES ('2', 'TECLADOS');
INSERT INTO `produtocategoria` VALUES ('3', 'IMPRESSORAS');

-- ----------------------------
-- View structure for `vproduto_categoria`
-- ----------------------------
DROP VIEW IF EXISTS `vproduto_categoria`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vproduto_categoria` AS select `produto`.`ProdutoId` AS `Id`,`produto`.`Descricao` AS `ProdutoDesc`,`produto`.`DataCadastro` AS `DataCadastro`,`produtocategoria`.`ProdutoCategoriaId` AS `CategoriaId`,`produtocategoria`.`Descricao` AS `CategoriaDesc` from (`produto` join `produtocategoria`) where (`produto`.`ProdutoCategoriaId` = `produtocategoria`.`ProdutoCategoriaId`);

-- ----------------------------
-- Procedure structure for `uspConsultarProduto`
-- ----------------------------
DROP PROCEDURE IF EXISTS `uspConsultarProduto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspConsultarProduto`(IN INintProdutoID int,IN INvchDescricao varchar(50),IN INintProdutoCategoriaID int)
BEGIN

SELECT 
Pro.ProdutoId,
Pro.Descricao AS DescProduto,
Pro.DataCadastro,
Pro.ProdutoCategoriaId,
ProCat.Descricao AS DescProdutoCategoria
FROM
Produto AS Pro
JOIN
ProdutoCategoria AS ProCat ON (Pro.ProdutoCategoriaId = ProCat.ProdutoCategoriaId)
WHERE
((Pro.ProdutoId = @INintProdutoID) OR (@INintProdutoID IS NULL)) AND
((Pro.Descricao LIKE ('%' + @INvchDescricao + '%')) OR (@INvchDescricao IS NULL)) AND
((Pro.ProdutoCategoriaId = @INintProdutoCategoriaID) OR (@INintProdutoCategoriaID IS NULL))
ORDER BY
Pro.Descricao;

END
;;
DELIMITER ;
