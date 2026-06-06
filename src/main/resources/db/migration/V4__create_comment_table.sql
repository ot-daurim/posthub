
CREATE TABLE comments (
    id BIGSERIAL PRIMARY KEY,
    author_id BIGINT NOT NULL,
    publication_id BIGINT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT fk_comment_publication
                      FOREIGN KEY (publication_id)
                        REFERENCES publications(id)
                        ON DELETE CASCADE ,
    CONSTRAINT fk_comment_author
                      FOREIGN KEY (author_id)
                        REFERENCES users(id)
                        ON DELETE RESTRICT
);

CREATE INDEX idx_comments_publication
ON comments(publication_id);

CREATE INDEX idx_comments_author
ON comments(author_id);