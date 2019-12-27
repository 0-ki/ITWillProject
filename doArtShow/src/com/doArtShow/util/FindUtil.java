package com.doArtShow.util;

import java.util.UUID;

public class FindUtil {
	public static String createKey() throws Exception{
		String key = UUID.randomUUID().toString();
		return key;
	}
}
