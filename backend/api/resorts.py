"""Resort router."""

from fastapi import APIRouter, Depends, HTTPException, status
from typing import List

from ..models.resort import Resort, ResortCreate, ResortOut
from ..services.resort_service import ResortService

router = APIRouter()

# Dependency injection for service

def get_resort_service() -> ResortService:
    return ResortService()

@router.get("/", response_model=List[ResortOut])
async def list_resorts(service: ResortService = Depends(get_resort_service)):
    return await service.get_all_resorts()

@router.get("/{resort_id}", response_model=ResortOut)
async def get_resort(resort_id: int, service: ResortService = Depends(get_resort_service)):
    resort = await service.get_resort_by_id(resort_id)
    if not resort:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Resort not found")
    return resort

@router.post("/", response_model=ResortOut, status_code=status.HTTP_201_CREATED)
async def create_resort(resort_in: ResortCreate, service: ResortService = Depends(get_resort_service)):
    return await service.create_resort(resort_in)

# Additional endpoints (search, update, delete) can be added similarly
