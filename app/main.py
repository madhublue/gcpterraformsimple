from fastapi import FastAPI

app = FastAPI()

@app.get("/greeting")
def read_greeting():
    return {"greeting": "Hello World"}


# serve a static index.html file from the root path

@app.get("/")
def read_root():
    # read the index.html file
    with open("index.html", "r") as file:
        return file.read()
    
