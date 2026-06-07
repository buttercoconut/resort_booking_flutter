"""Booking Pydantic models."""

from pydantic import BaseModel, Field
from datetime import date
from typing import Optional

class BookingBase(BaseModel):
    user_id: int = Field(..., example=1)
    resort_id: int = Field(..., example=2)
    check_in: date = Field(..., example="2024-07-01")
    check_out: date = Field(..., example="2024-07-07")
    guests: int = Field(..., example=2)

class BookingCreate(BookingBase):
    pass

class BookingOut(BookingBase):
    id: int
    status: str = Field(..., example="confirmed")

    class Config:
        orm_mode = True
