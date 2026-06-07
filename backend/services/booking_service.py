"""Booking service layer."""

from typing import List
from ..models.booking import BookingCreate, BookingOut

class BookingService:
    _bookings: List[BookingOut] = []
    _id_counter: int = 1

    async def get_all_bookings(self) -> List[BookingOut]:
        return self._bookings

    async def get_booking_by_id(self, booking_id: int) -> BookingOut | None:
        for booking in self._bookings:
            if booking.id == booking_id:
                return booking
        return None

    async def create_booking(self, booking_in: BookingCreate) -> BookingOut:
        booking = BookingOut(
            id=self._id_counter,
            user_id=booking_in.user_id,
            resort_id=booking_in.resort_id,
            check_in=booking_in.check_in,
            check_out=booking_in.check_out,
            guests=booking_in.guests,
            status="confirmed",
        )
        self._bookings.append(booking)
        self._id_counter += 1
        return booking

# Additional methods for cancel/update can be added
