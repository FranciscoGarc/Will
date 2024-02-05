DROP database if exists Act2;

CREATE DATABASE Act2;

USE Act2;

CREATE TABLE Clientes(
   Id_Cliente INT AUTO_INCREMENT PRIMARY KEY,
   Nombre_Cliente VARCHAR(50) NOT NULL,
   Apellido_Cliente VARCHAR(50) NOT NULL,
   Dui_Cliente VARCHAR (10) NOT NULL,
   correo_Cliente VARCHAR (100) NOT NULL,
   Telefono_Cliente VARCHAR(9) NOT NULL,
   Nacimiento_Cliente DATE NOT NULL,
   Direccion_Cliente VARCHAR(250) NOT NULL,
   Clave_Cliente VARCHAR(100) NOT NULL,
   estado_cliente boolean NOT NULL,
   Fecha_Registro DATE NOT NULL DEFAULT CURDATE()
);

CREATE TABLE Pedidos(
  Id_Pedido INT AUTO_INCREMENT PRIMARY KEY,
   estado_pedido ENUM ('deshabilitado', 'habilitado'),
    Fecha_registro DATE NOT NULL DEFAULT CURDATE(),
    Direccion_pedido VARCHAR(250) NOT NULL,
    Id_Cliente INT NOT NULL,
    CONSTRAINT fk_pedidos_Clientes
    FOREIGN KEY (Id_Cliente)
    REFERENCES Clientes (Id_Cliente)
);

CREATE TABLE Administradores(
   Id_Administrador INT AUTO_INCREMENT PRIMARY KEY,
   Nombre_Administrador VARCHAR(50) NOT NULL,
   Apellido_Administrador VARCHAR(50) NOT NULL,
   correo_Administrador VARCHAR (100) NOT NULL,
   Alias_Administrador VARCHAR(90) NOT NULL,
   Nacimiento_Administrador DATE NOT NULL,
   Clave_Administrador VARCHAR(100) NOT NULL,
   Fecha_registro DATE NOT NULL DEFAULT CURDATE()
);

CREATE TABLE Categorias(
 Id_Categoria INT AUTO_INCREMENT PRIMARY KEY,
 Nombre_Categoria VARCHAR(50) NOT NULL,
 Descripcion_categoria VARCHAR(250) NOT NULL,
 Imagen_Categoria VARCHAR(35) NOT NULL,
 UNIQUE (Nombre_Categoria)
);

CREATE TABLE Productos(
 Id_Producto INT AUTO_INCREMENT PRIMARY KEY,
 Nombre_Producto VARCHAR(50) NOT NULL,
 Descripcion_Producto VARCHAR(250) NOT NULL,
 Precio_Producto NUMERIC(5,2) NOT NULL,
 Imagen_Producto VARCHAR(40) NOT NULL,
 Estado_Producto BOOLEAN NOT NULL,
 Existencias_Producto INT NOT NULL,
 Fecha_Registro DATE NOT NULL DEFAULT CURDATE(),
 Id_Categoria INT NOT NULL,
 Id_Administrador INT NOT NULL,
 CONSTRAINT fk_IdCategoria_Productos
  FOREIGN KEY (Id_Categoria)
  REFERENCES Categorias (Id_Categoria),
  CONSTRAINT fk_IDAdminstrador_Productos
  FOREIGN KEY (Id_Administrador)
  REFERENCES Administradores (Id_Administrador)
);

CREATE TABLE Detalles_Pedidos(
  Id_Detalle INT AUTO_INCREMENT PRIMARY KEY,
  Cantidad_producto INT NOT NULL,
  Precio_Producto NUMERIC(5,2) NOT NULL,
  Id_Pedido INT NOT NULL,
  Id_Producto INT NOT NULL,
  CONSTRAINT fk_Detalles_Pedidos
  FOREIGN KEY (Id_Pedido)
  REFERENCES Pedidos (Id_Pedido),
  CONSTRAINT fk_Detalles_Productos
  FOREIGN KEY (Id_Producto)
  REFERENCES Productos (Id_Producto)
);

CREATE TABLE Valoraciones(
 Id_Valoracion INT AUTO_INCREMENT PRIMARY KEY,
 Calificacion_producto INT NOT NULL CHECK (Calificacion_producto > 0),
 Comentario_Producto VARCHAR(250) DEFAULT('5mentario'),
 Fecha_valoracion DATE NOT NULL DEFAULT CURDATE(),
 Estado_comentario BOOLEAN NOT NULL,
 Id_Detalle INT NOT NULL,
 CONSTRAINT fk_Id_Detalle_Valoraciones
 FOREIGN KEY (Id_Detalle)
 REFERENCES Detalles_Pedidos(Id_Detalle)
);


ALTER TABLE Productos
MODIFY COLUMN Descripcion_Producto VARCHAR(250) DEFAULT 'Sin Descripcion';

ALTER TABLE Productos
MODIFY COLUMN Descripcion_Producto VARCHAR(250) DEFAULT 'Sin Descripcion';

ALTER TABLE Productos
MODIFY COLUMN Precio_Producto NUMERIC(5,2) CHECK (Precio_Producto > 0);

ALTER TABLE Detalles_Pedidos
MODIFY COLUMN Precio_Producto NUMERIC(5,2) CHECK (Precio_Producto > 0);

ALTER TABLE Administradores
MODIFY COLUMN correo_Administrador VARCHAR(100) UNIQUE;

ALTER TABLE Administradores
MODIFY COLUMN Clave_Administrador VARCHAR(100) UNIQUE;

ALTER TABLE Pedidos
MODIFY COLUMN Direccion_pedido VARCHAR(250) DEFAULT 'Sin direccion';
 
ALTER TABLE Clientes
MODIFY COLUMN Telefono_Cliente VARCHAR(100) UNIQUE;

ALTER TABLE Clientes
MODIFY COLUMN correo_Cliente VARCHAR(100) UNIQUE;

ALTER TABLE Clientes
MODIFY COLUMN Direccion_Cliente VARCHAR(250) DEFAULT 'Sin direccion';

INSERT INTO Clientes (Nombre_Cliente, Apellido_Cliente, Dui_Cliente, correo_Cliente, Telefono_Cliente, Nacimiento_Cliente, Direccion_Cliente, Clave_Cliente, estado_cliente)
VALUES 
  ('Juan', 'Perez', '12345678-9', 'juan@gmail.com', '1234-5678', '1990-01-01', 'Calle 123', '12345678', true),
  ('Maria', 'Lopez', '98765432-1', 'maria@hotmail.com', '9876-5432', '1985-05-15', 'Avenida 456', '12345678', true),
  ('Roberto', 'Gomez', '23456789-0', 'roberto@gmail.com', '2345-6789', '1982-07-20', 'Calle Principal', '12345678', true),
  ('Ana', 'Martinez', '87654321-0', 'ana@hotmail.com', '8765-4321', '1995-11-30', 'Avenida Central', '12345678', true),
  ('Carlos', 'Rodriguez', '34567890-1', 'carlos@gmail.com', '3456-7890', '1988-09-25', 'Calle Secundaria', '12345678', true),
  ('Laura', 'Fernandez', '01234567-8', 'laura@hotmail.com', '0123-4567', '1983-03-18', 'Calle 456', '12345678', true),
  ('Pedro', 'Gonzalez', '45678901-2', 'pedro@gmail.com', '4567-8901', '1979-08-12', 'Avenida 789', '12345678', true),
  ('Sofia', 'Hernandez', '89012345-6', 'sofia@hotmail.com', '8901-2345', '1987-06-08', 'Calle 789', '12345678', true),
  ('David', 'Lara', '56789012-3', 'david@gmail.com', '5678-9012', '1984-04-03', 'Avenida 012', '12345678', true),
  ('Elena', 'Morales', '01544567-9', 'elena@hotmail.com', '1264-5678', '1992-02-15', 'Calle 789', '12345678', true),
  ('Gabriel', 'Silva', '12455678-9', 'gabriel@gmail.com', '9866-5432', '1986-07-22', 'Avenida 012', '12345678', true),
  ('Isabel', 'Diaz', '12342378-9', 'isabel@hotmail.com', '2346-6789', '1994-05-10', 'Calle Principal', '12345678', true),
  ('Hugo', 'Santos', '12345178-9', 'hugo@gmail.com', '8765-2321', '1981-09-18', 'Avenida Central', '12345678', true),
  ('Karla', 'Molina', '12345478-9', 'karla@hotmail.com', '3456-6890', '1989-03-25', 'Calle 789', '12345678', true),
  ('Manuel', 'Ramirez', '12335678-9', 'manuel@gmail.com', '0123-9567', '1976-11-12', 'Avenida 456', '12345678', true),
  ('Olga', 'Castro', '12346678-9', 'olga@hotmail.com', '4567-1901', '1983-08-27', 'Calle Secundaria', '12345678', true),
  ('Pablo', 'Fuentes', '12345678-9', 'pablo@gmail.com', '8901-6345', '1997-04-05', 'Avenida 012', '12345678', true),
  ('Rosa', 'Vargas', '12376678-9', 'rosa@hotmail.com', '5678-1012', '1982-01-20', 'Calle 123', '12345678', true),
  ('Tomás', 'Lopez', '12356678-9', 'tomas@gmail.com', '1234-4378', '1988-06-15', 'Avenida 456', '12345678', true),
  ('Yolanda', 'Navarro', '12325678-9', 'yolanda@hotmail.com', '3176-5432', '1995-03-30', 'Calle Principal', '12345678', true),
  ('Xavier', 'Rojas', '12345318-9', 'xavier@gmail.com', '2345-4389', '1980-12-17', 'Avenida 789', '12345678', true),
  ('Zoe', 'Gutierrez', '12345478-9', 'zoe@hotmail.com', '8765-5321', '1987-09-22', 'Calle Secundaria', '12345678', true),
  ('Fernando', 'Perez', '12404679-2', 'fernando@gmail.com', '3443-7890', '1991-05-07', 'Avenida 012', '12345678', true);
  
  INSERT INTO Pedidos (estado_pedido, Direccion_pedido, Id_Cliente)
VALUES 
  ('habilitado', 'Calle 123, Ciudad A', 1),
  ('habilitado', 'Avenida 456, Ciudad B', 2),
  ('habilitado', 'Calle Principal, Ciudad C', 3),
  ('habilitado', 'Avenida Central, Ciudad D', 4),
  ('habilitado', 'Calle Secundaria, Ciudad E', 5),
  ('habilitado', 'Calle 456, Ciudad F', 6),
  ('habilitado', 'Avenida 789, Ciudad G', 7),
  ('habilitado', 'Calle 789, Ciudad H', 8),
  ('habilitado', 'Avenida 012, Ciudad I', 9),
  ('habilitado', 'Calle 789, Ciudad J', 10),
  ('habilitado', 'Calle 123, Ciudad K', 11),
  ('habilitado', 'Avenida 012, Ciudad L', 12),
  ('habilitado', 'Calle Principal, Ciudad M', 13),
  ('habilitado', 'Avenida Central, Ciudad N', 14),
  ('habilitado', 'Calle 789, Ciudad O', 15),
  ('habilitado', 'Calle 456, Ciudad P', 16),
  ('habilitado', 'Avenida 789, Ciudad Q', 17),
  ('habilitado', 'Calle Secundaria, Ciudad R', 18),
  ('habilitado', 'Avenida 012, Ciudad S', 19),
  ('habilitado', 'Calle 123, Ciudad T', 20),
  ('habilitado', 'Avenida 456, Ciudad U', 21),
  ('habilitado', 'Calle Principal, Ciudad V', 22),
  ('habilitado', 'Avenida Central, Ciudad W', 23);
  
INSERT INTO Administradores (Nombre_Administrador, Apellido_Administrador, correo_Administrador, Alias_Administrador, Nacimiento_Administrador, Clave_Administrador)
VALUES 
  ('Carlos', 'Gutierrez', 'carlos.admin@example.com', 'carlos_admin', '1980-03-10', 'claveCarlos123'),
  ('Laura', 'Perez', 'laura.admin@example.com', 'laura_admin', '1975-12-05', 'claveLaura456'),
  ('Rodrigo', 'Diaz', 'rodrigo.admin@example.com', 'rodrigo_admin', '1982-07-20', 'claveRodrigo789'),
  ('Isabel', 'Martinez', 'isabel.admin@example.com', 'isabel_admin', '1990-05-15', 'claveIsabelABC'),
  ('Javier', 'Lopez', 'javier.admin@example.com', 'javier_admin', '1988-11-30', 'claveJavierXYZ'),
  ('Carmen', 'Gomez', 'carmen.admin@example.com', 'carmen_admin', '1985-09-25', 'claveCarmen1234'),
  ('Pablo', 'Torres', 'pablo.admin@example.com', 'pablo_admin', '1979-02-18', 'clavePablo5678'),
  ('Elena', 'Santos', 'elena.admin@example.com', 'elena_admin', '1987-08-12', 'claveElena9012'),
  ('Hector', 'Fernandez', 'hector.admin@example.com', 'hector_admin', '1984-06-08', 'claveHector3456'),
  ('Marta', 'Ramirez', 'marta.admin@example.com', 'marta_admin', '1992-04-03', 'claveMarta7890'),
  ('Luis', 'Silva', 'luis.admin@example.com', 'luis_admin', '1986-01-15', 'claveLuisABC1'),
  ('Ana', 'Rodriguez', 'ana.admin@example.com', 'ana_admin', '1975-11-25', 'claveAnaXYZ2'),
  ('Roberto', 'Gonzalez', 'roberto.admin@example.com', 'roberto_admin', '1982-09-20', 'claveRoberto1233'),
  ('Sofia', 'Herrera', 'sofia.admin@example.com', 'sofia_admin', '1990-07-15', 'claveSofia4564'),
  ('Daniel', 'Perez', 'daniel.admin@example.com', 'daniel_admin', '1988-04-22', 'claveDaniel7895'),
  ('Julia', 'Garcia', 'julia.admin@example.com', 'julia_admin', '1983-02-28', 'claveJuliaABC6'),
  ('Juan', 'Vargas', 'juan.admin@example.com', 'juan_admin', '1989-06-25', 'claveJuanXYZ7'),
  ('Sara', 'Lara', 'sara.admin@example.com', 'sara_admin', '1976-11-12', 'claveSara1238'),
  ('Alejandro', 'Castro', 'alejandro.admin@example.com', 'alejandro_admin', '1983-08-27', 'claveAlejandro4569'),
  ('Natalia', 'Fuentes', 'natalia.admin@example.com', 'natalia_admin', '1997-04-05', 'claveNatalia7890'),
  ('Diego', 'Rojas', 'diego.admin@example.com', 'diego_admin', '1982-01-20', 'claveDiegoABC1'),
  ('Marina', 'Hernandez', 'marina.admin@example.com', 'marina_admin', '1988-06-15', 'claveMarinaXYZ2'),
  ('Raul', 'Flores', 'raul.admin@example.com', 'raul_admin', '1995-03-30', 'claveRaul1233'),
  ('Lucia', 'Cruz', 'lucia.admin@example.com', 'lucia_admin', '1980-12-17', 'claveLucia4564'),
  ('Pedro', 'Gutierrez', 'pedro.admin@example.com', 'pedro_admin', '1987-09-22', 'clavePedro7895');
  
INSERT INTO Categorias (nombre_categoria, descripcion_categoria, imagen_categoria)
VALUES 
('Electrodomésticos', 'Productos para facilitar la vida diaria en tu hogar', 'electrodomesticos.jpg'),
('Moda', 'Tendencias de vestimenta para lucir con estilo en cualquier ocasión', 'moda.jpg'),
('Decoración', 'Artículos para embellecer tu hogar y crear ambientes únicos', 'decoracion.jpg'),
('Deportes y Fitness', 'Equipos y accesorios para mantenerte activo y saludable', 'deportes_fitness.jpg'),
('Juguetes Educativos', 'Juguetes que fomentan la diversión y el aprendizaje para todas las edades', 'juguetes_educativos.jpg'),
('Literatura', 'Libros de diversas categorías y géneros literarios para todos los amantes de la lectura', 'literatura.jpg'),
('Alimentación Gourmet', 'Productos alimenticios de alta calidad para satisfacer tu paladar exigente', 'alimentacion_gourmet.jpg'),
('Cuidado Personal', 'Productos para el cuidado personal y belleza que realzan tu bienestar', 'cuidado_personal.jpg'),
('Tecnología Innovadora', 'Productos y gadgets tecnológicos que hacen tu vida más fácil y entretenida', 'tecnologia_innovadora.jpg'),
('Muebles Modernos', 'Mobiliario moderno para crear ambientes contemporáneos en tu hogar', 'muebles_modernos.jpg'),
('Instrumentos Musicales', 'Instrumentos para músicos de todos los niveles, expresando tu pasión por la música', 'instrumentos_musicos.jpg'),
('Accesorios Automotrices', 'Accesorios y herramientas para automóviles, mejorando su rendimiento y estética', 'accesorios_automotrices.jpg'),
('Electrónicos Avanzados', 'Productos electrónicos de última generación para estar a la vanguardia tecnológica', 'electronica.jpg'),
('Aventuras al Aire Libre', 'Equipos y artículos para actividades al aire libre, disfrutando de la naturaleza', 'aventuras_al_aire_libre.jpg'),
('Arte y Creatividad', 'Suministros para actividades artísticas y creativas, estimulando tu imaginación', 'arte_creatividad.jpg'),
('Bebés y Niños Felices', 'Productos para el cuidado y diversión de los más pequeños del hogar', 'bebes_ninos_felices.jpg'),
('Jardinería y Paisajismo', 'Artículos para el cuidado y decoración de jardines, creando espacios verdes hermosos', 'jardineria_paisajismo.jpg'),
('Fotografía Profesional', 'Equipos y accesorios para entusiastas de la fotografía, capturando momentos especiales', 'fotografia_profesional.jpg'),
('Productos para Mascotas', 'Productos para el cuidado y entretenimiento de tus mascotas, porque ellos también merecen lo mejor', 'productos_mascotas.jpg'),
('Equipaje y Accesorios de Viaje', 'Artículos y accesorios para viajeros, haciendo de cada viaje una experiencia única', 'equipaje_viaje.jpg');

INSERT INTO Productos (Nombre_Producto, Descripcion_Producto, Precio_Producto, Imagen_Producto, Estado_Producto, Existencias_Producto, Id_Categoria, Id_Administrador)
VALUES 
  ('Lavadora Smart', 'Lavadora de última generación con tecnología inteligente', 899.99, 'lavadora_smart.jpg', true, 20, 1, 1),
  ('Licuadora Multifunción', 'Licuadora con múltiples funciones para preparar smoothies y más', 59.99, 'licuadora_multifuncion.jpg', true, 30, 1, 2),

  ('Vestido Elegante', 'Vestido elegante para ocasiones especiales', 129.99, 'vestido_elegante.jpg', true, 15, 2, 1),
  ('Camiseta Estampada', 'Camiseta con estampado moderno y cómodo', 24.99, 'camiseta_estampada.jpg', true, 50, 2, 2),

  ('Lámpara Decorativa', 'Lámpara de mesa para decorar y iluminar tu espacio', 79.99, 'lampara_decorativa.jpg', true, 25, 3, 1),
  ('Set de Cojines', 'Set de cojines decorativos para tu sala o dormitorio', 34.99, 'cojines_decorativos.jpg', true, 40, 3, 2),

  ('Bicicleta de Montaña', 'Bicicleta diseñada para terrenos montañosos', 499.99, 'bicicleta_montana.jpg', true, 10, 4, 1),
  ('Pulsera Fitness', 'Pulsera inteligente para monitorear tu actividad física', 39.99, 'pulsera_fitness.jpg', true, 100, 4, 2),

  ('Juego Educativo', 'Juego educativo para estimular el aprendizaje de los niños', 29.99, 'juego_educativo.jpg', true, 30, 5, 1),
  ('Peluche Interactivo', 'Peluche interactivo para el entretenimiento de los más pequeños', 19.99, 'peluche_interactivo.jpg', true, 50, 5, 2),

  ('Novela de Misterio', 'Novela intrigante llena de misterio y suspense', 14.99, 'novela_misterio.jpg', true, 20, 6, 1),
  ('Libro de Ciencia Ficción', 'Aventuras emocionantes en un mundo de ciencia ficción', 17.99, 'libro_ciencia_ficcion.jpg', true, 25, 6, 2),

  ('Queso Gourmet', 'Selección de quesos gourmet para degustar', 39.99, 'queso_gourmet.jpg', true, 15, 7, 1),
  ('Caja de Chocolates Finos', 'Caja de chocolates finos para los amantes del dulce', 29.99, 'chocolates_finos.jpg', true, 30, 7, 2),

  ('Set de Cuidado Facial', 'Productos para el cuidado facial y rejuvenecimiento de la piel', 69.99, 'cuidado_facial.jpg', true, 20, 8, 1),
  ('Secadora de Cabello Profesional', 'Secadora de cabello profesional para un secado rápido y eficiente', 49.99, 'secadora_cabello.jpg', true, 15, 8, 2),

  ('Smart TV 4K', 'Televisor inteligente con resolución 4K para una experiencia de visualización excepcional', 799.99, 'smart_tv_4k.jpg', true, 10, 9, 1),
  ('Auriculares Inalámbricos', 'Auriculares inalámbricos con cancelación de ruido para una experiencia auditiva inmersiva', 129.99, 'auriculares_inalambricos.jpg', true, 30, 9, 2),

  ('Tienda de Campaña Doble', 'Tienda de campaña espaciosa para dos personas', 129.99, 'tienda_campamento.jpg', true, 5, 10, 1),
  ('Mochila de Senderismo', 'Mochila resistente y cómoda para tus aventuras al aire libre', 49.99, 'mochila_senderismo.jpg', true, 20, 10, 2),

  ('Set de Pinceles Artísticos', 'Set de pinceles de calidad para artistas y aficionados', 19.99, 'pinceles_artisticos.jpg', true, 50, 11, 1),
  ('Kit de Manualidades', 'Kit completo de manualidades para liberar tu creatividad', 24.99, 'kit_manualidades.jpg', true, 40, 11, 2),

  ('Ropa para Bebé', 'Conjunto de ropa para bebé suave y cómodo', 29.99, 'ropa_bebe.jpg', true, 30, 12, 1),
  ('Juguete Educativo para Niños', 'Juguete educativo que estimula el desarrollo de los niños', 14.99, 'juguete_educativo_ninos.jpg', true, 60, 12, 2),

  ('Mesa de Jardín', 'Mesa de jardín resistente y elegante para tus reuniones al aire libre', 89.99, 'mesa_jardin.jpg', true, 10, 13, 1),
  ('Herramientas de Jardinería', 'Set de herramientas de jardinería de alta calidad', 39.99, 'herramientas_jardineria.jpg', true, 25, 13, 2),

  ('Cámara Fotográfica Profesional', 'Cámara profesional para capturar imágenes de alta calidad', 699.99, 'camara_profesional.jpg', true, 8, 14, 1),
  ('Trípode Ajustable', 'Trípode ajustable para garantizar fotos estables y precisas', 49.99, 'tripode_ajustable.jpg', true, 15, 14, 2),

  ('Juguete para Gatos', 'Juguete interactivo para el entretenimiento de tu gato', 9.99, 'juguete_gatos.jpg', true, 30, 15, 1),
  ('Alimento Premium para Perros', 'Alimento premium para perros de todas las razas', 34.99, 'alimento_perros.jpg', true, 20, 15, 2),

  ('Mochila de Viaje', 'Mochila espaciosa y cómoda para tus aventuras de viaje', 79.99, 'mochila_viaje.jpg', true, 15, 16, 1),
  ('Accesorios de Viaje', 'Set de accesorios prácticos para tus viajes', 29.99, 'accesorios_viaje.jpg', true, 30, 16, 2);

INSERT INTO Detalles_Pedidos (Cantidad_producto, Precio_Producto, Id_Pedido, Id_Producto)
VALUES 
  (2, 899.99, 1, 1),
  (3, 59.99, 1, 2),
  (1, 149.99, 2, 3),
  (2, 24.99, 2, 4),
  (1, 79.99, 3, 5),
  (2, 34.99, 3, 6),
  (1, 499.99, 4, 7),
  (1, 39.99, 4, 8),
  (3, 29.99, 5, 9),
  (2, 19.99, 5, 10),
  (2, 14.99, 6, 11),
  (1, 17.99, 6, 12),
  (2, 39.99, 7, 13),
  (1, 29.99, 7, 14),
  (1, 69.99, 8, 15),
  (1, 49.99, 8, 16),
  (1, 799.99, 9, 17),
  (2, 129.99, 9, 18),
  (1, 129.99, 10, 19),
  (2, 49.99, 10, 20),
  (3, 19.99, 11, 21),
  (2, 24.99, 11, 22),
  (1, 29.99, 12, 23),
  (2, 14.99, 12, 24),
  (1, 89.99, 13, 25),
  (1, 39.99, 13, 26),
  (2, 699.99, 14, 27),
  (1, 49.99, 14, 28),
  (3, 9.99, 15, 29),
  (1, 34.99, 15, 30);

INSERT INTO Valoraciones (Calificacion_producto, Comentario_Producto, Estado_comentario, Id_Detalle)
VALUES 
  (4, '¡Excelente producto!', true, 1),
  (5, 'Muy satisfecho con mi compra', true, 2),
  (3, 'Buen producto, pero esperaba más', true, 3),
  (4, 'Me encanta, volveré a comprar', true, 4),
  (5, 'Superó mis expectativas', true, 5),
  (4, 'Buena relación calidad-precio', true, 6),
  (2, 'No estoy conforme con el envío', true, 7),
  (4, 'Cumple con lo esperado', true, 8),
  (5, 'Producto de alta calidad', true, 9),
  (3, 'Demoró un poco en llegar', true, 10),
  (4, 'Recomiendo este producto', true, 11),
  (5, 'Perfecto para mis necesidades', true, 12),
  (3, 'Algo complicado de usar', true, 13),
  (4, 'Buen servicio al cliente', true, 14),
  (5, 'Envío rápido y seguro', true, 15),
  (4, 'Buena atención, gracias', true, 16),
  (2, 'El producto llegó dañado', true, 17),
  (4, 'Muy buen producto', true, 18),
  (5, 'Increíble, lo recomiendo', true, 19),
  (3, 'Tuve problemas con la talla', true, 20),
  (4, 'Buena experiencia de compra', true, 21),
  (5, '¡Me encantó, gracias!', true, 22),
  (4, 'Buena calidad, lo volveré a comprar', true, 23);



