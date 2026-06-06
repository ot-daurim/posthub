CREATE TABLE follows
    (
        id BIGSERIAL PRIMARY KEY,

        follower_id BIGINT NOT NULL,
        following_id BIGINT NOT NULL,

        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

        CONSTRAINT fk_follow_follower
            FOREIGN KEY (follower_id)
            REFERENCES users(id)
            ON DELETE CASCADE,

        CONSTRAINT fk_follow_following
            FOREIGN KEY (following_id)
            REFERENCES users(id)
            ON DELETE CASCADE,

        CONSTRAINT uk_follow
            UNIQUE (
                   follower_id,
                   following_id
                ),

        CONSTRAINT chk_not_follow_self
            CHECK (
                    follower_id <> following_id
                )
    );

CREATE INDEX idx_follows_follower
ON follows(follower_id);

CREATE INDEX idx_follows_following
ON follows(following_id);