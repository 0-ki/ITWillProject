package com.doArtShow.controls.manager;

import java.util.Map;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.ManagerDao;

public class DeleteExhController implements Controller {
	ManagerDao managerDao;

	public DeleteExhController setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
		
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		System.out.println("### ModifyExhController ###");
		
		int exhID = Integer.parseInt((String) model.get("exhID"));
		
		int resultDeleteExhContent = managerDao.deleteExhContent(exhID);
		
		if (resultDeleteExhContent > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

}
