"""Booking router."""

from fastapi import APIRouter, Depends, HTTPException, status
from typing import List

from ..models.booking import Booking, BookingCreate, BookingOut
from ..services.booking_service import BookingService

router = APIRouter()

# Dependency injection for service

def get_booking_service() -> BookingService:
    return BookingService()

@router.get("/", response_model=List[BookingOut])
async def list_bookings(service: BookingService = Depends(get_booking_service)):
    return await service.get_all_bookings()

@router.get("/{booking_id}", response_model=BookingOut)
async def get_booking(booking_id: int, service: BookingService = Depends(get_booking_service)):
    booking = await service.get_booking_by_id(booking_id)
    if not booking:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Booking not found")
    return booking

@router.post("/", response_model=BookingOut, status_code=status.HTTP_201_CREATED)
async def create_booking(booking_in: BookingCreate, service: BookingService = Depends(get_booking_service)):
    return await service.create_booking(booking_in)

# Additional endpoints for cancel, update can be added
