CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    rol VARCHAR(255) NOT NULL
);

CREATE TABLE telefonos (
    id SERIAL PRIMARY KEY, 
    usuario_id INT NOT NULL,
    telefono VARCHAR (255),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL
);

CREATE TABLE permisos (
    id SERIAL PRIMARY KEY,
    permiso VARCHAR(255) NOT NULL
);

CREATE TABLE roles_permisos (
    id SERIAL PRIMARY KEY,
    rol_id integer NOT NULL,
    permiso_id integer NOT NULL,
    FOREIGN KEY (rol_id) REFERENCES roles(id),
    FOREIGN KEY (permiso_id) REFERENCES permisos(id)
);

CREATE TABLE usuarios_roles (
    id SERIAL PRIMARY KEY,
    usuario_id integer NOT NULL,
    rol_id integer NOT NULL,
    FOREIGN KEY (rol_id) REFERENCES roles(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE materiales (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE movimiento_materiales (
    id SERIAL PRIMARY KEY,
    material_id integer NOT NULL,
    tipo VARCHAR(255) NOT NULL,
    cantidad integer NOT NULL,
    proveedor VARCHAR(255) NOT NULL,
    fecha date NOT NULL, 
    FOREIGN KEY (material_id) REFERENCES materiales(id)
);

CREATE TABLE proyectos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    presupuesto DECIMAL(10,2) NOT NULL CHECK (presupuesto >= 0),
    cliente VARCHAR(255) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE 
);


CREATE TABLE material_proyecto (
    id SERIAL PRIMARY KEY,
    material_id INT NOT NULL,
    proyecto_id INT NOT NULL,
    ofrecido INT NOT NULL CHECK (ofrecido > 0),
    comprado INT NOT NULL CHECK (comprado > 0),
    obra INT NOT NULL CHECK (obra > 0),
    bodega INT NOT NULL CHECK (bodega > 0),
    FOREIGN KEY (material_id) REFERENCES materiales(id),
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(id)
);

CREATE TABLE bodega_proyecto (
    id SERIAL PRIMARY KEY,
    material_id integer NOT NULL,
    tipo varchar(255) NOT NULL,
    cantidad integer NOT NULL,
    proyecto_id integer NOT NULL,
    fecha date NOT NULL,
    FOREIGN KEY (material_id) REFERENCES materiales(id),
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(id)
);

CREATE TABLE reportes ( 
    id SERIAL PRIMARY KEY,
    proyecto_id INT NOT NULL,
    fecha DATE NOT NULL,
    contenido TEXT,
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(id)
);