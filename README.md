# Library 

Library  — учебный REST API веб-сервис на основе Java + Spring Boot.

Проект выполнен в рамках лабораторной работы.

## Суть проекта

Пользователь может зарегистрироваться, войти в систему, создавать книги, авторов, жанры, издательства и управлять данными:

* CRUD для всех основных сущностей;
* оставлять отзывы;
* оформлять записи выдачи и возврата книг.

Администратор может управлять справочниками: ролями, жанрами, издательствами и книгами.

## Стек

* Java 25
* Spring Boot 4.x
* Maven
* Spring Web MVC
* Spring Data JPA
* Spring Security
* PostgreSQL
* Liquibase
* Actuator
* JUnit
* H2 для тестов
* JaCoCo для отчета покрытия
* Docker Compose для PostgreSQL

## Основные сущности

В проекте реализовано 8 основных сущностей:

1. `User` — пользователь системы.
2. `Role` — роль пользователя.
3. `Author` — автор книги.
4. `Genre` — жанр.
5. `Publisher` — издательство.
6. `Book` — книга.
7. `Review` — отзыв пользователя.
8. `BorrowRecord` — запись о выдаче/возврате книги.

## Связи между сущностями

* `User` ↔ `Role` — many-to-many.
* `Book` → `Author` — many-to-one.
* `Book` → `Genre` — many-to-one.
* `Book` → `Publisher` — many-to-one.
* `Book` → `Review` — one-to-many.
* `User` → `Review` — one-to-many.
* `User` → `BorrowRecord` — one-to-many.
* `Book` → `BorrowRecord` — one-to-many.

## Запуск базы данных

```bash
docker compose up -d
```

## Запуск приложения

Linux/macOS:

```bash
./mvnw spring-boot:run
```

Windows PowerShell:

```powershell
.\mvnw.cmd spring-boot:run
```

После запуска:

* API: `http://localhost:8080/api`
* Actuator Health: `http://localhost:8080/actuator/health`
* Liquibase Actuator: `http://localhost:8080/actuator/liquibase`

Данные администратора по умолчанию:

* login: `admin`
* password: `admin123`

## Проверка health endpoint

```http
GET http://localhost:8080/api/health
```

Ожидаемый ответ:

```json
{
  "service": "library",
  "status": "UP"
}
```

## Демо-пользователи

| Логин   | Пароль  | Роль                      |
| ------- | ------- | ------------------------- |
| `admin` | `admin` | `ROLE_ADMIN`, `ROLE_USER` |
| `user`  | `user`  | `ROLE_USER`               |

Большинство API-методов требуют Basic Auth.

## Auth API

### Регистрация

```http
POST /api/auth/register
```

```json
{
  "username": "newuser",
  "email": "newuser@example.com",
  "password": "password"
}
```

### Логин

```http
POST /api/auth/login
```

```json
{
  "username": "admin",
  "password": "admin"
}
```

### Текущий пользователь

```http
GET /api/auth/me
```

## Основные endpoints

### Users

```http
GET    /api/users
GET    /api/users/{id}
PUT    /api/users/{id}
DELETE /api/users/{id}
```

### Roles

```http
GET    /api/roles
GET    /api/roles/{id}
POST   /api/roles
PUT    /api/roles/{id}
DELETE /api/roles/{id}
```

### Authors

```http
GET    /api/authors
GET    /api/authors/{id}
POST   /api/authors
PUT    /api/authors/{id}
DELETE /api/authors/{id}
```

### Genres

```http
GET    /api/genres
GET    /api/genres/{id}
POST   /api/genres
PUT    /api/genres/{id}
DELETE /api/genres/{id}
```

### Publishers

```http
GET    /api/publishers
GET    /api/publishers/{id}
POST   /api/publishers
PUT    /api/publishers/{id}
DELETE /api/publishers/{id}
```

### Books

```http
GET    /api/books
GET    /api/books/{id}
POST   /api/books
PUT    /api/books/{id}
DELETE /api/books/{id}
```

### Reviews

```http
POST /api/reviews
```

### Borrow Records

```http
POST /api/borrow-records
```

## Тесты

Запуск тестов:

```powershell
.\mvnw.cmd clean test
```

Отчёт JaCoCo:

```text
target/site/jacoco/index.html
```

Открыть отчёт:

```powershell
start target\site\jacoco\index.html
```

## Liquibase

Схема базы данных создаётся через Liquibase.

Основной файл:

```text
src/main/resources/db/changelog/db.changelog-master.yml
```

Файлы изменений:

```text
src/main/resources/db/changelog/changes/
```

## GitHub

Проект предназначен для сдачи через GitHub.
