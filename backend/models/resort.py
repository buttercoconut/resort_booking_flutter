"""Resort Pydantic models."""

from pydantic import BaseModel, Field
from typing import List, Optional

class ResortBase(BaseModel):
    name: str = Field(..., example="Seaside Paradise")
    description: Optional[str] = Field(None, example="A beautiful beach resort.")
    location: str = Field(..., example="Busan, South Korea")
    price_per_night: float = Field(..., example=250.0)
    amenities: List[str] = Field(default_factory=list, example=["Pool", "Spa", "Gym"])

class ResortCreate(ResortBase):
    pass

class ResortOut(ResortBase):
    id: int

    class Config:
        orm_mode = True
