services:
  nginx:
    image: nginx:latest
    ports:
      - "8080:80"
    volumes:
      - ./nginx/nginx.conf:/etc/nginx/nginx.conf:ro
    depends_on:
      - apache1
      - apache2

  apache1:
    build: .
    volumes:
      - ./www:/var/www/html
    environment:
      - NODO_NOMBRE=Apache_Principal_1
    depends_on:
      - postgres_db
      - mongo_db

  apache2:
    build: .
    volumes:
      - ./www:/var/www/html
    environment:
      - NODO_NOMBRE=Apache_Secundario_2
    depends_on:
      - postgres_db
      - mongo_db

  postgres_db:
    image: postgres:15
    environment:
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
      POSTGRES_DB: ${POSTGRES_DB}
    ports:
      - "5432:5432"

  mongo_db:
    image: mongo:6
    ports:
      - "27017:27017"
      
