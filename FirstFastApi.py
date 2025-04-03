from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class Car:
    def __init__(self, brand, type, price):
        self.brand = brand
        self.type = type
        self.price = price

cars = [Car("Honda", "civic", 5000), Car("Tesla", "Model T", 10000)]

@app.get("/cars")
def get_cars():

    return cars

@app.get("/cars/{brand}")
def get_car(brand):
    for car in cars:
        if car.brand == brand:
            return car
    return None


@app.get("/")
def home():
    return "Hello Belastingdienst"

@app.get("/novi")
def novi():
    return {"message": "Hoi Novi"}

