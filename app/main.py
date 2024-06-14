from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
app = FastAPI()

#Serve React Static Files
app.mount("/", StaticFiles(directory="ui", html=True), name="static")

@app.get("/greeting")
def read_greeting():
    return {"message": "Hello World"}



    
