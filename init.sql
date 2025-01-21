DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL NOT NULL,
  uid VARCHAR(64) NOT NULL UNIQUE,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  img VARCHAR(255),
  created_at TIMESTAMP NOT NULL,
  PRIMARY KEY (id)
);

-- データの挿入
INSERT INTO users (uid, name, email, img, created_at) VALUES
  ('user001', 'Alice Smith', 'alice@example.com', 'https://example.com/images/alice.jpg', NOW()),
  ('user002', 'Bob Johnson', 'bob@example.com', NULL, NOW()),
  ('user003', 'Charlie Brown', 'charlie@example.com', 'https://example.com/images/charlie.jpg', NOW()),
  ('user004', 'Diana Prince', 'diana@example.com', NULL, NOW());