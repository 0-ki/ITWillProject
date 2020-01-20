package com.doArtShow.controls.manager;

import java.util.Map;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.ManagerDao;

public class UpdateArtShowTagController implements Controller {
	ManagerDao managerDao;
	
	public UpdateArtShowTagController setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
		
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		System.out.println("### UpdateArtShowTagController ###");
		
		int exhID = Integer.parseInt((String) model.get("exhID"));
		String tags = (String) model.get("tags");
		
		String[] tagList = tags.split(",");
		
		int res = managerDao.deleteExhListTags(exhID);
		
		if (res > 0) {
			for (int i = 1; i < tagList.length; i++) {
				int result = managerDao.updateExhListTags(exhID, tagList[i]);
				
				if (result <= 0) {
					return "update fail";
				}
			}
			return "update success";
		} else {
			return " delete fail";
		}

	}

}
