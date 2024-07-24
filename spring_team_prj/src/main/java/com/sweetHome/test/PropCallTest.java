package com.sweetHome.test;

import java.io.*;
import java.util.Properties;


public class PropCallTest {
	public static void main(String[] args) {
		Properties properties = new Properties();
		String fileName = "C:\\IT\\S3917_J11\\workspace_sts3\\spring3_team_prj\\src\\main\\resources\\config.properties";
		File file = new File(fileName);

		// 프로퍼티 파일 존재 여부 확인
		if (!file.exists()) {
			// 파일이 없을 경우 기본 값을 사용하여 파일 생성
			try (OutputStream output = new FileOutputStream(fileName)) {
				properties.setProperty("noshow.lastseq"	, "200");
				properties.setProperty("user.accum"		, "1515");
				properties.store(output, "Default properties");
				System.out.println("Properties file created with default values.");
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}

		// 프로퍼티 파일 읽기
		try (InputStream input = new FileInputStream(fileName)) {
			properties.load(input);
			System.out.println("값읽기");
			properties.forEach((key, value) -> System.out.println(key + ": " + value));
		} catch (IOException ex) {
			ex.printStackTrace();
		}

		// 프로퍼티 값 수정
		properties.setProperty("noshow.lastseq", "888");		
		// 수정된 프로퍼티 파일 저장
		try (OutputStream output = new FileOutputStream(fileName)) {
			properties.store(output, "Updated properties");
			System.out.println("파일저장");
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		
		// 수정된 프로퍼티 파일 다시 읽기
		try (InputStream input = new FileInputStream(fileName)) {
			properties.load(input);
			System.out.println("값확인:");
			properties.forEach((key, value) -> System.out.println(key + ": " + value));
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
}
