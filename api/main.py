from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import Optional
import uvicorn

from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker


app = FastAPI()

#se corre con el comando python .\main.py o con uvicorn main:app
if __name__=="__main__":
    uvicorn.run("main:app",port=8000,reload=True)


# Crear una instancia de la aplicación FastAPI
app = FastAPI()

# Configurar la conexión a la base de datos PostgreSQL
DATABASE_URL = "postgresql://username:password@localhost/dbname"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Definir un modelo Pydantic para la entrada de usuario
class UserCreate(BaseModel):
    username: str
    email: str

# Definir un modelo SQLAlchemy para la tabla de usuarios
Base = declarative_base()
class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    username = Column(String, unique=True, index=True)
    email = Column(String, unique=True, index=True)

# Crear las tablas en la base de datos
Base.metadata.create_all(bind=engine)

# Definir el endpoint POST para registrar un usuario
@app.post("/users/")
def create_user(user: UserCreate):
    db = SessionLocal()
    db_user = User(username=user.username, email=user.email)
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    db.close()
    return db_user











class Libro(BaseModel):
    titulo:str
    autor: str
    paginas: int
    editorial: Optional[str]

biblioteca = []

@app.get("/")
def index():
    return {"message":"Hola fastapi"}

@app.get("/libros/{id}")
def index(id: int):
    return {"data": id}



@app.get("/biblioteca")
def obtener_libros():
    return biblioteca


@app.post("/libros")
def insert_libro(libro: Libro):
    libJson = libro.dict()
    biblioteca.append(libJson)
    print(libJson)
    return {"message": f"libro {libro.titulo} insertado"}

@app.post("/ruta2")
def insert_libro(user):
    return {"message": user}