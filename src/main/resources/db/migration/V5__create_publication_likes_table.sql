CREATE TABLE publication_likes
    (
        id BIGSERIAL PRIMARY KEY,
        publication_id BIGINT NOT NULL,
        user_id BIGINT NOT NULL,
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

        CONSTRAINT fk_like_publication
            FOREIGN KEY (publication_id)
                REFERENCES publications(id)
                ON DELETE CASCADE,

        CONSTRAINT fk_like_user
            FOREIGN KEY (user_id)
                REFERENCES users(id)
                ON DELETE CASCADE,

        CONSTRAINT uk_publication_like
            UNIQUE (
                   publication_id,
                   user_id
                )
    );

CREATE INDEX  idx_publication_likes_user
ON publication_likes(user_id)