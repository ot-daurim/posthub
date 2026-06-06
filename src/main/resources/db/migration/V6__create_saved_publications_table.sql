CREATE TABLE saved_publications (
    id BIGSERIAL PRIMARY KEY,

    publication_id BIGINT NOT NULL,

    user_id BIGINT NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_saved_publication
                                FOREIGN KEY (publication_id)
                                    REFERENCES publications(id)
                                    ON DELETE CASCADE,

    CONSTRAINT fk_saved_user
                                FOREIGN KEY (user_id)
                                    REFERENCES users(id)
                                    ON DELETE CASCADE,

    CONSTRAINT uk_saved_publication
                                UNIQUE (
                                       publication_id,
                                       user_id
                                    )
);