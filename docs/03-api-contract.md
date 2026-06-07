# PostHub API Contract v1

## Общие правила

### Base URL

```http
/api/v1
```

### Формат данных

```http
Content-Type: application/json
```

### Авторизация

```http
Authorization: Bearer <access_token>
```

---

# AUTH

## Регистрация

### Request

```http
POST /api/v1/auth/register
```

Body:

```json
{
  "username": "daurim",
  "email": "daurim@mail.com",
  "password": "Password123!"
}
```

### Response

```json
{
  "id": 1,
  "username": "daurim",
  "email": "daurim@mail.com"
}
```

---

## Авторизация

### Request

```http
POST /api/v1/auth/login
```

Body:

```json
{
  "email": "daurim@mail.com",
  "password": "Password123!"
}
```

### Response

```json
{
  "accessToken": "...",
  "refreshToken": "..."
}
```

---

# USERS

## Получить свой профиль

### Request

```http
GET /api/v1/users/me
```

### Response

```json
{
  "id": 1,
  "username": "daurim",
  "displayName": "Даурим",
  "bio": "Java Developer",
  "followersCount": 25,
  "followingCount": 10,
  "publicationsCount": 17
}
```

---

## Получить профиль пользователя

### Request

```http
GET /api/v1/users/{userId}
```

---

## Обновить профиль

### Request

```http
PUT /api/v1/users/me
```

Body:

```json
{
  "displayName": "Даурим",
  "bio": "Java Backend Developer"
}
```

---

# PUBLICATIONS

## Создать публикацию

### Request

```http
POST /api/v1/publications
```

Body:

```json
{
  "type": "POST",
  "title": "Изучаю Spring Security",
  "content": "Сегодня разобрал JWT..."
}
```

### Response

```json
{
  "id": 10
}
```

---

## Получить публикацию

### Request

```http
GET /api/v1/publications/{publicationId}
```

---

## Редактировать публикацию

### Request

```http
PUT /api/v1/publications/{publicationId}
```

---

## Удалить публикацию

### Request

```http
DELETE /api/v1/publications/{publicationId}
```

---

## Получить публикации пользователя

### Request

```http
GET /api/v1/users/{userId}/publications
```

---

# COMMENTS

## Создать комментарий

### Request

```http
POST /api/v1/publications/{publicationId}/comments
```

Body:

```json
{
  "content": "Очень интересный материал"
}
```

---

## Получить комментарии публикации

### Request

```http
GET /api/v1/publications/{publicationId}/comments
```

---

## Обновить комментарий

### Request

```http
PUT /api/v1/comments/{commentId}
```

---

## Удалить комментарий

### Request

```http
DELETE /api/v1/comments/{commentId}
```

---

# LIKES

## Поставить лайк

### Request

```http
POST /api/v1/publications/{publicationId}/like
```

---

## Убрать лайк

### Request

```http
DELETE /api/v1/publications/{publicationId}/like
```

---

# SAVED PUBLICATIONS

## Сохранить публикацию

### Request

```http
POST /api/v1/publications/{publicationId}/save
```

---

## Удалить из сохраненных

### Request

```http
DELETE /api/v1/publications/{publicationId}/save
```

---

## Получить сохраненные публикации

### Request

```http
GET /api/v1/users/me/saved-publications
```

---

# FOLLOWS

## Подписаться

### Request

```http
POST /api/v1/users/{userId}/follow
```

---

## Отписаться

### Request

```http
DELETE /api/v1/users/{userId}/follow
```

---

## Получить подписчиков

### Request

```http
GET /api/v1/users/{userId}/followers
```

---

## Получить подписки

### Request

```http
GET /api/v1/users/{userId}/following
```

---

# FEED

## Лента подписок

### Request

```http
GET /api/v1/feed/following
```

---

## Общая лента

### Request

```http
GET /api/v1/feed/discover
```
