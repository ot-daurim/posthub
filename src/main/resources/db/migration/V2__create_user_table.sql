CREATE TYPE user_status AS ENUM (
    'ACTIVE',
    'BLOCKED',
    'DELETED'
    );

CREATE TABLE users
(
    id BIGSERIAL PRIMARY KEY,

    username VARCHAR(80)  NOT NULL UNIQUE,
    display_name VARCHAR(100),
    email VARCHAR(80)  NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,

    first_name VARCHAR(100),
    last_name VARCHAR(100),

    bio TEXT,
    avatar_url VARCHAR(500),

    status user_status NOT NULL DEFAULT 'ACTIVE',

    email_verified BOOLEAN NOT NULL DEFAULT FALSE,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    last_login TIMESTAMP,

    deleted BOOLEAN NOT NULL DEFAULT FALSE
);

