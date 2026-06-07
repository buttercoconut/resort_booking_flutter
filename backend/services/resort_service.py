"""Resort service layer."""

from typing import List
from ..models.resort import ResortCreate, ResortOut
from ..models.resort import ResortBase

# In a real application this would interact with a database
# Here we use an in-memory list for demonstration

class ResortService:
    _resorts: List[ResortOut] = []
    _id_counter: int = 1

    async def get_all_resorts(self) -> List[ResortOut]:
        return self._resorts

    async def get_resort_by_id(self, resort_id: int) -> ResortOut | None:
        for resort in self._resorts:
            if resort.id == resort_id:
                return resort
        return None

    async def create_resort(self, resort_in: ResortCreate) -> ResortOut:
        resort = ResortOut(
            id=self._id_counter,
            name=resort_in.name,
            description=resort_in.description,
            location=resort_in.location,
            price_per_night=resort_in.price_per_night,
            amenities=resort_in.amenities,
        )
        self._resorts.append(resort)
        self._id_counter += 1
        return resort

# Additional methods for update/delete can be added
