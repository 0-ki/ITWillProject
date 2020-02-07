package com.doArtShow.controls.manager;

import java.util.Map;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.ManagerDao;

public class PersonalRequestController implements Controller {
	ManagerDao managerDao;

	public PersonalRequestController setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
		
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		System.out.println("### PersonalRequestController ###");

		String name = (String) model.get("name");
		String email = (String) model.get("email");
		String message = (String) model.get("message");
		
		int res = managerDao.insertRequest(name, email, message);
		
		return null;
	}

}
