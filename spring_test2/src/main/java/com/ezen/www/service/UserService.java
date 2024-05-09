package com.ezen.www.service;

import java.util.List;

import com.ezen.www.domain.UserVO;

public interface UserService {

	int register(UserVO uvo);

	List<UserVO> getList();

	void modify(UserVO uvo);

	void modifyNoPwd(UserVO uvo);

	void delete(String id);

	void deleteauth(String id);





//	int updateLastLogin(String authEmail);

}
