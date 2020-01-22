package com.doArtShow.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class VisitSessionListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent event) {
		if(event.getSession().isNew()){
            execute(event);
        }
	}
	
	private void execute(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		System.out.println();
		System.out.println("########### Welcome ###########");
		System.out.println();
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {}

}
