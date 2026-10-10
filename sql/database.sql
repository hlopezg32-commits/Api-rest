DROP DATABASE IF EXISTS tienda_db;
CREATE DATABASE tienda_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE tienda_db;

CREATE TABLE puestos (
    id_puesto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    salario_base FLOAT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE marcas (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nit VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    id_puesto INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_contratacion DATE NOT NULL,
    CONSTRAINT fk_empleados_puestos 
        FOREIGN KEY (id_puesto) REFERENCES puestos(id_puesto)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    id_marca INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    precio FLOAT NOT NULL,
    stock INT NOT NULL,
    CONSTRAINT fk_productos_marcas 
        FOREIGN KEY (id_marca) REFERENCES marcas(id_marca)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE facturas (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    fecha DATETIME NOT NULL,
    total FLOAT NOT NULL,
    CONSTRAINT fk_facturas_clientes 
        FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_facturas_empleados 
        FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE detalle_facturas (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_factura INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario FLOAT NOT NULL,
    subtotal FLOAT NOT NULL,
    CONSTRAINT fk_detalle_facturas 
        FOREIGN KEY (id_factura) REFERENCES facturas(id_factura)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_detalle_productos 
        FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

INSERT INTO puestos (nombre, salario_base) VALUES 
('Gerente de Tienda', 8500.00),
('Cajero Principal', 3800.50),
('Vendedor de Mostrador', 3500.00),
('Auxiliar de Bodega', 3200.00);

INSERT INTO marcas (nombre) VALUES 
('Samsung'),
('Sony'),
('Logitech'),
('Dell');

INSERT INTO clientes (nit, nombre, apellidos, email) VALUES 
('1234567-8', 'Carlos Eduardo', 'López Gómez', 'carlos.lopez@example.com'),
('9876543-2', 'María Fernanda', 'Morales Ruíz', 'maria.morales@example.com'),
('5544332-1', 'Juan Pablo', 'Castillo Hernández', 'juan.castillo@example.com'),
('CF', 'Ana Lucía', 'Ríos Alvarado', 'ana.rios@example.com');

INSERT INTO empleados (id_puesto, nombre, apellidos, fecha_contratacion) VALUES 
(1, 'Roberto', 'Méndez García', '2021-03-15'),
(2, 'Laura', 'Pineda Cruz', '2022-07-01'),
(3, 'Alejandro', 'Torres Estrada', '2023-01-10'),
(4, 'Sofía', 'Guzmán Reyes', '2023-09-20');

INSERT INTO productos (id_marca, nombre, precio, stock) VALUES 
(1, 'Monitor Curvo 27 pulgadas', 1850.00, 15),
(2, 'Auriculares Inalámbricos WH-1000XM4', 2300.00, 8),
(3, 'Mouse Ergonómico MX Master 3S', 750.50, 25),
(4, 'Laptop Latitude 5420 i7', 6800.00, 5);

INSERT INTO facturas (id_cliente, id_empleado, fecha, total) VALUES 
(1, 2, '2024-02-01 10:30:00', 1850.00),
(2, 3, '2024-02-02 14:15:00', 3050.50),
(3, 2, '2024-02-03 16:45:00', 750.50);

INSERT INTO detalle_facturas (id_factura, id_producto, cantidad, precio_unitario, subtotal) VALUES 
(1, 1, 1, 1850.00, 1850.00),
(2, 2, 1, 2300.00, 2300.00),
(2, 3, 1, 750.50, 750.50),
(3, 3, 1, 750.50, 750.50);
