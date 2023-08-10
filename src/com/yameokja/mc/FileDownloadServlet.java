package com.yameokja.mc;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;

public class FileDownloadServlet
{
	// 파일 다운로드
	// - saveFileName : 서버에 저장된 파일 이름
	// - originalFileName : 클라이언트가 업로드한 파일 이름
	// - path : 서버에 저장된 경로
	// - response : HttpServletResponse
	public static String doFileDownload(String saveFileName, String path, HttpServletResponse response)
	{
		/* String loadDir = path + File.separator + saveFileName; */
		
		// 확인
		/* System.out.println(loadDir); */
		
		try
		{
			
			saveFileName = new String(saveFileName.getBytes("UTF-8"), "8859_1");
			
		} catch (UnsupportedEncodingException e)
		{
			System.out.println(e.toString());
		}
		
		try
		{
			File file = new File(path);
			
			if (file.exists())
			{
				byte[] readByte = new byte[5*1024*1024];
				
				response.setContentType("application/octet-stream");
				response.setHeader("Content-disposition", "attachment;filename="+saveFileName);
				
				// BuufferedInputStream 으로 감싹 FileInputStream 객체
				BufferedInputStream fis = new BufferedInputStream(new FileInputStream(file));
				
				OutputStream os = response.getOutputStream();
				// ○ OutputStream 객체의 『write(byte[] b, int off, int len)』 메소드
				//    write(byte[] b, int off, int len) throws IOException
				//    - byte 배열 타입의 b를 대상으로 주어진 위치(off)에서
				//      주어진 길이만큼 스트림에 출력하는 메소드
				
				int read;
				while ( (read=fis.read(readByte, 0, 5*1024*1024)) != -1 )
				{
					os.write(readByte, 0, read);
				}
				
				os.flush();
				os.close();
				fis.close();
				
				// 파일이 존재할 경우 true 반환
				return "true";
			}
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		// 파일이 존재하지 않아 정상적인 처리가 이루어지지 않을 경우 flase 반환
		return "false";
	}

}
