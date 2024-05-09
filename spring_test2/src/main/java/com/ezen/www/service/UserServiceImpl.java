package com.ezen.www.service;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezen.www.domain.UserVO;
import com.ezen.www.repository.UserDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
	private final UserDAO udao;

	
	@Transactional
	@Override
	public int register(UserVO uvo) {
		// 권한 추가
		int isOk = udao.insert(uvo);
		isOk *= udao.insertAuthInit(uvo.getEmail());
		return isOk;
	}


	@Override
	public List<UserVO> getList() {
		List<UserVO> userList = udao.getList();
		for(UserVO uvo : userList) {
			uvo.setAuthList(udao.selectAuths(uvo.getEmail()));
		}
		return userList;
	}


	@Override
	public void modify(UserVO uvo) {		
		udao.update(uvo);
	}


	@Override
	public void modifyNoPwd(UserVO uvo) {
		// TODO Auto-generated method stub
		udao.updateNoPwd(uvo);
	}


	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		
		udao.delete(id);
	}


	@Override
	public void deleteauth(String id) {
		// TODO Auto-generated method stub
		udao.deleteauth(id);
	}










//	@Override
//	public int updateLastLogin(String authEmail) {
//		// TODO Auto-generated method stub
//		return udao.updateLastLogin(authEmail);
//	}
	

}
