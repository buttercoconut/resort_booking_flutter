"""User Pydantic models."""

from pydantic import BaseModel, Field, EmailStr
from typing import Optional

class UserBase(BaseModel):
    username: str = Field(..., example="john_doe")
    email: EmailStr = Field(..., example="john@example.com")

class UserCreate(UserBase):
    password: str = Field(..., example="strongpassword123")

class UserOut(UserBase):
    id: int

    class Config:
        orm_mode = True
