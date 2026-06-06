CREATE TYPE  publication_type AS ENUM
    (
        'POST'
    );

CREATE TYPE publication_status AS ENUM
    (
        'PUBLISHED',
        'DELETED'
    );

CREATE TABLE publications
    (
        id BIGSERIAL PRIMARY KEY,
        author_id BIGINT NOT NULL,

        type publication_type NOT NULL,

        title VARCHAR(255) NOT NULL,
        content TEXT NOT NULL,
        image_url VARCHAR(500),

        view_count BIGINT NOT NULL DEFAULT 0,

        status publication_status NOT NULL DEFAULT 'PUBLISHED',

        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

        CONSTRAINT fk_publication_author
            FOREIGN KEY (author_id)
                REFERENCES users(id)
                ON DELETE RESTRICT
    );

CREATE INDEX idx_publications_created_at
ON publications(created_at DESC);

CREATE INDEX idx_publications_status
ON publications(status);

CREATE INDEX idx_publications_author
ON publications(author_id);