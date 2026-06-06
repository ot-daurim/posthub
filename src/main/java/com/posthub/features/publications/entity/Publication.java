package com.posthub.features.publications.entity;

import com.posthub.features.user.entity.User;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(name = "publications")
@Getter
@Setter
public class Publication {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(
            name = "author_id",
            nullable = false
    )
    private User author;

    @Enumerated(EnumType.STRING)
    @Column(
            nullable = false,
            columnDefinition = "publication_type"
    )
    private PublicationType type;

    @Column(nullable = false, length = 255)
    private String title;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String content;

    @Column(name = "image_url", length = 500)
    private String imageUrl;

    @Column(
            name = "view_count",
            nullable = false
    )
    private Long viewCount = 0L;

    @Enumerated(EnumType.STRING)
    @Column(
            nullable = false,
            columnDefinition = "publication_status"
    )
    private PublicationStatus status  = PublicationStatus.PUBLISHED;

    @CreationTimestamp
    @Column(
            name = "created_at",
            nullable = false,
            updatable = false
    )
    private LocalDateTime createdAt;
    @UpdateTimestamp
    @Column(
            name = "updated_at",
            nullable = false
    )
    private LocalDateTime updatedAt;

}
