"""FastAPI application entry point."""

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

# Import routers
from .resorts import router as resorts_router
from .bookings import router as bookings_router
from .users import router as users_router

app = FastAPI(title="Resort Booking API")

# CORS settings for Flutter app
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # In production, restrict to specific origins
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Include routers
app.include_router(resorts_router, prefix="/resorts", tags=["Resorts"])
app.include_router(bookings_router, prefix="/bookings", tags=["Bookings"])
app.include_router(users_router, prefix="/users", tags=["Users"])

@app.get("/")
async def root():
    return {"message": "Welcome to the Resort Booking API"}
