package com.doArtShow.controls.manager;

import java.util.Map;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.ManagerDao;

public class VisitCountController implements Controller {
	ManagerDao managerDao;

	public VisitCountController setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
		
		return this;
	}
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		System.out.println("### VisitCountController ###");
		
		String value = (String) model.get("value");
		
		if (value.equals("week")) {
			String weekValue = (String) model.get("weekValue");
			
			int weekVisitCnt = managerDao.getWeekVisitCnt(weekValue);
			
			return "" + weekVisitCnt;
		} else {
			
			return null;
		}
		
	}

}
