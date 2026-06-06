package com.posthub.features.savedPublication.entity;

import com.posthub.features.publications.entity.Publication;
import com.posthub.features.user.entity.User;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(
        name = "saved_publications",
        uniqueConstraints = {
                @UniqueConstraint(
                        name = "uk_saved_publication",
                        columnNames = {
                                "publication_id",
                                "user_id"
                        }
                )
        }
)
@Getter
@Setter
public class SavedPublication {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(
            name = "publication_id",
            nullable = false
    )
    private Publication publication;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(
            name = "user_id",
            nullable = false
    )
    private User user;


    @CreationTimestamp
    @Column(
            name = "created_at",
            nullable = false,
            updatable = false
    )
    private LocalDateTime createdAt;

}
