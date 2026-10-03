from fastapi import FastAPI

app = FastAPI(
    title="ShieldOps API",
    description="Minimal API for the ShieldOps DevSecOps platform",
    version="1.0.0",
)


@app.get("/")
def root():
    return {"message": "ShieldOps API is running"}


@app.get("/health")
def health():
    return {"status": "healthy"}