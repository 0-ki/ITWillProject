package com.doArtShow.controls.manager;

import java.util.Map;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.ManagerDao;
import com.doArtShow.dto.ExhibitionDto;

public class ModifyExhController implements Controller {
	ManagerDao managerDao;

	public ModifyExhController setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
		
		return this;
	}
	
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		System.out.println("### ModifyExhController ###");
		
		if (model.get("modifyExhibitionDto") == null) {
			int exhID = Integer.parseInt((String) model.get("exhID"));
			
			ExhibitionDto exhDto = new ExhibitionDto();
			exhDto = managerDao.getExhibition(exhID);
			
			model.put("exhDto", exhDto);
			System.out.println("exhGubun3");
			System.out.println(model.get("exhGubun3"));
			return "manager/exh/modifyExh.jsp";			
		} else {
			return "";
		}
		
	}


}
