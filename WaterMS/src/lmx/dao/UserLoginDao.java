package lmx.dao;

import java.util.List;

import lmx.entities.UserLogin;

public interface UserLoginDao {

	public abstract List<UserLogin> listUser(String phone, String password);

}