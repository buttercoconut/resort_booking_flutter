"""User service layer."""

from typing import List
from ..models.user import UserCreate, UserOut

class UserService:
    _users: List[UserOut] = []
    _id_counter: int = 1

    async def get_all_users(self) -> List[UserOut]:
        return self._users

    async def get_user_by_id(self, user_id: int) -> UserOut | None:
        for user in self._users:
            if user.id == user_id:
                return user
        return None

    async def create_user(self, user_in: UserCreate) -> UserOut:
        user = UserOut(
            id=self._id_counter,
            username=user_in.username,
            email=user_in.email,
        )
        self._users.append(user)
        self._id_counter += 1
        return user

# Authentication and password handling omitted for brevity
