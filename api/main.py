from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional

app = FastAPI()

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