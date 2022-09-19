package com.soyaa.moonlam.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	
	public static final String FILE_UPLOAD_PATH = "D:\\99김소연\\spring\\moonlam\\upload";	

	// import 해주기
	// org.slf4j.Logger;
	// org.slf4j.LoggerFactory; 
	private static Logger logger = LoggerFactory.getLogger(FileManagerService.class);
	
	// 파일을 저장할 수 있는 클래스
	public static String saveFile(int userId, MultipartFile file) {
		
		// 같은 이름을 가진 파일이 문제가 없도록 파일을 저장할 디렉토리를 만든다.
		// userId_unixtime
		// 2_29192120
		String directoryName = "/" + userId + "_" + System.currentTimeMillis() + "/";
		
		// 디렉토리 생성 (디렉토리도 파일이기 때문에 생성해주어야 한다)
		String filePath =  FILE_UPLOAD_PATH + directoryName;
		File directory = new File(filePath);
		if(directory.mkdir() == false) {
			// 디렉토리 생성 실패!
			// 디렉토리 생성 실패 로그 추가
			logger.error("FileManagerService - saveFile : file 디렉토리 생성 에러 " + filePath);
			return null;
		}
		
	  // file 안에 있는 실제 파일을 꺼내야한다 (byte) 형태
		try {
			byte[] bytes = file.getBytes(); // 파일 정보 꺼내는 법
			
			// bytes 배열에 저장되어 있는 것을 디렉토리에 저장해야한다.
			String fileFullPath = filePath + file.getOriginalFilename(); // 실제 파일 이름 가지고 오는 법
			
			// 파일 경로를 관리하는 객체 : Path
			Path path = Paths.get(fileFullPath);
			
			// 파일 저장
			Files.write(path, bytes);
			
			// 객체 이름 뒤에 메소드 : static!! 
		} catch (IOException e) {
			e.printStackTrace();
			
			// 파일 저장 실패
			// 파일 저장 실패 로그 추가
			logger.error("FileManagerService - saveFile : 파일 저장 실패");
			return null;
		}
		
		// 클라이언트에서 접근 가능한 경로
		// D:\\99김소연\\spring\\moonlam\\upload 해당 디렉토리 아래 경로
		// /images/~    // 여기서 그냥 규칙을 만든 것
		
		return "/images" + directoryName + file.getOriginalFilename();
		
	}
	
}
