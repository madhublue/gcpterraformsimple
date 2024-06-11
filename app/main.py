from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
app = FastAPI()

#Serve React Static Files
app.mount("/", StaticFiles(directory="..frontend/build", html=True), name="static")

@app.get("/greeting")
def read_greeting():
    return {"message": "Hello World"}



# For the root of /  change the response type to HTML and serve the index.html file
@app.get("/")
def read_root():
    return FileResponse("index.html", media_type="text/html")


    
