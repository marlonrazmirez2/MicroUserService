-- ============================================
-- Migration: V1__Create_users_table
-- Description: Crear tabla users y función de trigger
-- Database: userdb (Docker container: postgres-user)
-- ============================================

-- Tabla users
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP );

-- ============================================
-- Migration: V2__ADD_INDEXES.sql
-- ============================================

CREATE UNIQUE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_name ON users(name);
CREATE INDEX idx_users_created_at ON users(created_at DESC);

-- ============================================
-- Migration: V3__INSERT_DATA.sql
-- ============================================

INSERT INTO users (name, email, phone, address) VALUES
('Juan Pérez', 'juan.perez@example.com', '+51-999-123-456', 'Av. Arequipa 1234, Lima'),
('María García', 'maria.garcia@example.com', '+51-999-234-567', 'Calle Los Olivos 567, Miraflores'),
('Carlos López', 'carlos.lopez@example.com', '+51-999-345-678', 'Jr. Huancavelica 890, Lima Centro'),
('Ana Torres', 'ana.torres@example.com', '+51-999-456-789', 'Av. Javier Prado 2345, San Isidro'),
('Roberto Sánchez', 'roberto.sanchez@example.com', '+51-999-567-890', 'Calle Las Begonias 678, San Borja');