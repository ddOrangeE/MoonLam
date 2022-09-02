package com.soyaa.moonlam.common;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexMatcher {

	public static boolean matches(String regex, CharSequence input) {
		
		Pattern p = Pattern.compile(regex);
		
		Matcher m = p.matcher(input);
		
		return m.matches();
	}
	
}


// 유닛테스트
