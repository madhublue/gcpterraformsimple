from fastapi import FastAPI
from fastapi.responses import FileResponse
app = FastAPI()

@app.get("/greeting")
def read_greeting():
    return {"message": "Hello World"}



# For the root of /  change the response type to HTML and serve the index.html file
@app.get("/")
def read_root():
    return FileResponse("index.html", media_type="text/html")


    
