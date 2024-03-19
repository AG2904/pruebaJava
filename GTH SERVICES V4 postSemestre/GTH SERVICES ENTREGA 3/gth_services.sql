-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3305
-- Generation Time: Jan 14, 2024 at 09:15 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gth_services`
--

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `CEDULA` int(11) NOT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `FECHAINGRESO` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `NUMEROTELEFONICO` varchar(255) DEFAULT NULL,
  `TIPOPERSONA` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`CEDULA`, `DIRECCION`, `FECHAINGRESO`, `NOMBRE`, `NUMEROTELEFONICO`, `TIPOPERSONA`) VALUES
(13492793, 'California', '2023-11-14', 'Maria Lopez', '04246567894', 'V'),
(24485697, 'Caracas', '2023-07-12', 'Andres Perez', '04244678957', 'V'),
(28059781, 'Cabimas', '2024-01-14', 'Gabriel Castellano', '04246390480', 'V'),
(78677654, 'Montalban', '2023-06-16', 'Andreina Castro', '04241234567', 'V');

-- --------------------------------------------------------

--
-- Table structure for table `pago`
--

CREATE TABLE `pago` (
  `NUMPAGO` int(11) NOT NULL,
  `METODOPAGO` varchar(255) DEFAULT NULL,
  `MONTOPAGADO` float DEFAULT NULL,
  `NUMEROREF` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pedido`
--

CREATE TABLE `pedido` (
  `NUMPEDIDO` int(11) NOT NULL,
  `FECHAPEDIDO` varchar(255) DEFAULT NULL,
  `MONTO` float DEFAULT NULL,
  `PAGADO` tinyint(1) DEFAULT 0,
  `fk_prov` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pedido_listacodyunis`
--

CREATE TABLE `pedido_listacodyunis` (
  `Pedido_NUMPEDIDO` int(11) DEFAULT NULL,
  `LISTACODYUNIS` int(11) DEFAULT NULL,
  `LISTACODYUNIS_KEY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pedido_pago`
--

CREATE TABLE `pedido_pago` (
  `Pedido_NUMPEDIDO` int(11) NOT NULL,
  `infoPago_NUMPAGO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pedido_producto`
--

CREATE TABLE `pedido_producto` (
  `Pedido_NUMPEDIDO` int(11) NOT NULL,
  `productosPedidos_NUMREF` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `NUMREF` int(11) NOT NULL,
  `CANTIDADESRESTANTES` int(11) DEFAULT NULL,
  `CANTIDADESVENDIDAS` int(11) DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `PRECIOVENTA` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`NUMREF`, `CANTIDADESRESTANTES`, `CANTIDADESVENDIDAS`, `DESCRIPCION`, `NOMBRE`, `PRECIOVENTA`) VALUES
(10, 15, 10, 'Aceite Motul semiSintetico', 'Aceite 15w40', 11),
(11, 15, 12, 'Marca GABRIEL', 'Inyector', 14),
(12, 15, 5, 'Marca MOOG', 'Amortiguador', 12),
(13, 4, 1, 'Marca ACDELCO', 'Refrigerante', 12);

-- --------------------------------------------------------

--
-- Table structure for table `producto_rifyprecios`
--

CREATE TABLE `producto_rifyprecios` (
  `Producto_NUMREF` int(11) DEFAULT NULL,
  `RIFYPRECIOS` float DEFAULT NULL,
  `RIFYPRECIOS_KEY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE `proveedor` (
  `CEDULA` int(11) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `NUMEROTELEFONICO` varchar(255) DEFAULT NULL,
  `TIPOPERSONA` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `proveedor`
--

INSERT INTO `proveedor` (`CEDULA`, `DESCRIPCION`, `DIRECCION`, `NOMBRE`, `NUMEROTELEFONICO`, `TIPOPERSONA`) VALUES
(15, 'Repuestos Moto', 'Av. Libertador', 'Empire Keeway', '02642965784', 'J'),
(16, 'Repuestos Corsa', 'Montalban', 'Repuestos Corsa', '02121234567', 'J'),
(17, 'Repuestos varios', 'Av. Francisco de Miranda', 'Repuestos La Paz', '02127894561', 'J'),
(18, 'Aceites', 'Baruta', 'Motul CA', '02612546895', 'J');

-- --------------------------------------------------------

--
-- Table structure for table `sequence`
--

CREATE TABLE `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', 0);

-- --------------------------------------------------------

--
-- Table structure for table `servicio`
--

CREATE TABLE `servicio` (
  `IDENTIFICADOR` int(11) NOT NULL,
  `COSTO` float DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `VECESHECHO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `servicio`
--

INSERT INTO `servicio` (`IDENTIFICADOR`, `COSTO`, `DESCRIPCION`, `NOMBRE`, `VECESHECHO`) VALUES
(60, 10, 'Cambio en FORD', 'Cambio de Aceite', 0),
(61, 10, 'Inyector en Chevrolet', 'Limpieza Inyector', 0),
(62, 15, 'Servicio en Honda', 'Servicio de Frenos', 0),
(63, 80, 'Lat en Puerta piloto', 'Latoneria', 0);

-- --------------------------------------------------------

--
-- Table structure for table `venta`
--

CREATE TABLE `venta` (
  `NUMVENTA` int(11) NOT NULL,
  `FECHAVENTA` varchar(255) DEFAULT NULL,
  `MODELOCARRO` varchar(255) DEFAULT NULL,
  `MONTOFINAL` float DEFAULT NULL,
  `PAGADO` tinyint(1) DEFAULT 0,
  `fk_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `venta_codycanti`
--

CREATE TABLE `venta_codycanti` (
  `Venta_NUMVENTA` int(11) DEFAULT NULL,
  `CODYCANTI` int(11) DEFAULT NULL,
  `CODYCANTI_KEY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `venta_pago`
--

CREATE TABLE `venta_pago` (
  `Venta_NUMVENTA` int(11) NOT NULL,
  `informacionPago_NUMPAGO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `venta_producto`
--

CREATE TABLE `venta_producto` (
  `Venta_NUMVENTA` int(11) NOT NULL,
  `productosVendidos_NUMREF` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `venta_servicio`
--

CREATE TABLE `venta_servicio` (
  `Venta_NUMVENTA` int(11) NOT NULL,
  `serviciosVendidos_IDENTIFICADOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CEDULA`);

--
-- Indexes for table `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`NUMPAGO`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`NUMPEDIDO`),
  ADD KEY `FK_PEDIDO_fk_prov` (`fk_prov`);

--
-- Indexes for table `pedido_listacodyunis`
--
ALTER TABLE `pedido_listacodyunis`
  ADD KEY `FK_Pedido_LISTACODYUNIS_Pedido_NUMPEDIDO` (`Pedido_NUMPEDIDO`);

--
-- Indexes for table `pedido_pago`
--
ALTER TABLE `pedido_pago`
  ADD PRIMARY KEY (`Pedido_NUMPEDIDO`,`infoPago_NUMPAGO`),
  ADD KEY `FK_PEDIDO_PAGO_infoPago_NUMPAGO` (`infoPago_NUMPAGO`);

--
-- Indexes for table `pedido_producto`
--
ALTER TABLE `pedido_producto`
  ADD PRIMARY KEY (`Pedido_NUMPEDIDO`,`productosPedidos_NUMREF`),
  ADD KEY `FK_PEDIDO_PRODUCTO_productosPedidos_NUMREF` (`productosPedidos_NUMREF`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`NUMREF`);

--
-- Indexes for table `producto_rifyprecios`
--
ALTER TABLE `producto_rifyprecios`
  ADD KEY `FK_Producto_RIFYPRECIOS_Producto_NUMREF` (`Producto_NUMREF`);

--
-- Indexes for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`CEDULA`);

--
-- Indexes for table `sequence`
--
ALTER TABLE `sequence`
  ADD PRIMARY KEY (`SEQ_NAME`);

--
-- Indexes for table `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`IDENTIFICADOR`);

--
-- Indexes for table `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`NUMVENTA`),
  ADD KEY `FK_VENTA_fk_cliente` (`fk_cliente`);

--
-- Indexes for table `venta_codycanti`
--
ALTER TABLE `venta_codycanti`
  ADD KEY `FK_Venta_CODYCANTI_Venta_NUMVENTA` (`Venta_NUMVENTA`);

--
-- Indexes for table `venta_pago`
--
ALTER TABLE `venta_pago`
  ADD PRIMARY KEY (`Venta_NUMVENTA`,`informacionPago_NUMPAGO`),
  ADD KEY `FK_VENTA_PAGO_informacionPago_NUMPAGO` (`informacionPago_NUMPAGO`);

--
-- Indexes for table `venta_producto`
--
ALTER TABLE `venta_producto`
  ADD PRIMARY KEY (`Venta_NUMVENTA`,`productosVendidos_NUMREF`),
  ADD KEY `FK_VENTA_PRODUCTO_productosVendidos_NUMREF` (`productosVendidos_NUMREF`);

--
-- Indexes for table `venta_servicio`
--
ALTER TABLE `venta_servicio`
  ADD PRIMARY KEY (`Venta_NUMVENTA`,`serviciosVendidos_IDENTIFICADOR`),
  ADD KEY `FK_VENTA_SERVICIO_serviciosVendidos_IDENTIFICADOR` (`serviciosVendidos_IDENTIFICADOR`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK_PEDIDO_fk_prov` FOREIGN KEY (`fk_prov`) REFERENCES `proveedor` (`CEDULA`);

--
-- Constraints for table `pedido_listacodyunis`
--
ALTER TABLE `pedido_listacodyunis`
  ADD CONSTRAINT `FK_Pedido_LISTACODYUNIS_Pedido_NUMPEDIDO` FOREIGN KEY (`Pedido_NUMPEDIDO`) REFERENCES `pedido` (`NUMPEDIDO`);

--
-- Constraints for table `pedido_pago`
--
ALTER TABLE `pedido_pago`
  ADD CONSTRAINT `FK_PEDIDO_PAGO_Pedido_NUMPEDIDO` FOREIGN KEY (`Pedido_NUMPEDIDO`) REFERENCES `pedido` (`NUMPEDIDO`),
  ADD CONSTRAINT `FK_PEDIDO_PAGO_infoPago_NUMPAGO` FOREIGN KEY (`infoPago_NUMPAGO`) REFERENCES `pago` (`NUMPAGO`);

--
-- Constraints for table `pedido_producto`
--
ALTER TABLE `pedido_producto`
  ADD CONSTRAINT `FK_PEDIDO_PRODUCTO_Pedido_NUMPEDIDO` FOREIGN KEY (`Pedido_NUMPEDIDO`) REFERENCES `pedido` (`NUMPEDIDO`),
  ADD CONSTRAINT `FK_PEDIDO_PRODUCTO_productosPedidos_NUMREF` FOREIGN KEY (`productosPedidos_NUMREF`) REFERENCES `producto` (`NUMREF`);

--
-- Constraints for table `producto_rifyprecios`
--
ALTER TABLE `producto_rifyprecios`
  ADD CONSTRAINT `FK_Producto_RIFYPRECIOS_Producto_NUMREF` FOREIGN KEY (`Producto_NUMREF`) REFERENCES `producto` (`NUMREF`);

--
-- Constraints for table `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `FK_VENTA_fk_cliente` FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`CEDULA`);

--
-- Constraints for table `venta_codycanti`
--
ALTER TABLE `venta_codycanti`
  ADD CONSTRAINT `FK_Venta_CODYCANTI_Venta_NUMVENTA` FOREIGN KEY (`Venta_NUMVENTA`) REFERENCES `venta` (`NUMVENTA`);

--
-- Constraints for table `venta_pago`
--
ALTER TABLE `venta_pago`
  ADD CONSTRAINT `FK_VENTA_PAGO_Venta_NUMVENTA` FOREIGN KEY (`Venta_NUMVENTA`) REFERENCES `venta` (`NUMVENTA`),
  ADD CONSTRAINT `FK_VENTA_PAGO_informacionPago_NUMPAGO` FOREIGN KEY (`informacionPago_NUMPAGO`) REFERENCES `pago` (`NUMPAGO`);

--
-- Constraints for table `venta_producto`
--
ALTER TABLE `venta_producto`
  ADD CONSTRAINT `FK_VENTA_PRODUCTO_Venta_NUMVENTA` FOREIGN KEY (`Venta_NUMVENTA`) REFERENCES `venta` (`NUMVENTA`),
  ADD CONSTRAINT `FK_VENTA_PRODUCTO_productosVendidos_NUMREF` FOREIGN KEY (`productosVendidos_NUMREF`) REFERENCES `producto` (`NUMREF`);

--
-- Constraints for table `venta_servicio`
--
ALTER TABLE `venta_servicio`
  ADD CONSTRAINT `FK_VENTA_SERVICIO_Venta_NUMVENTA` FOREIGN KEY (`Venta_NUMVENTA`) REFERENCES `venta` (`NUMVENTA`),
  ADD CONSTRAINT `FK_VENTA_SERVICIO_serviciosVendidos_IDENTIFICADOR` FOREIGN KEY (`serviciosVendidos_IDENTIFICADOR`) REFERENCES `servicio` (`IDENTIFICADOR`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
