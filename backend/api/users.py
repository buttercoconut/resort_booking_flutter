"""User router."""

from fastapi import APIRouter, Depends, HTTPException, status
from typing import List

from ..models.user import User, UserCreate, UserOut
from ..services.user_service import UserService

router = APIRouter()

# Dependency injection for service

def get_user_service() -> UserService:
    return UserService()

@router.get("/", response_model=List[UserOut])
async def list_users(service: UserService = Depends(get_user_service)):
    return await service.get_all_users()

@router.get("/{user_id}", response_model=UserOut)
async def get_user(user_id: int, service: UserService = Depends(get_user_service)):
    user = await service.get_user_by_id(user_id)
    if not user:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="User not found")
    return user

@router.post("/", response_model=UserOut, status_code=status.HTTP_201_CREATED)
async def create_user(user_in: UserCreate, service: UserService = Depends(get_user_service)):
    return await service.create_user(user_in)

# Additional endpoints for authentication can be added
