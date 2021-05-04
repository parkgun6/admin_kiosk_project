package org.geon.common.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AttachFileDTO {

	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;
	private Long bano;
	private Long buno;
	private Long sno;
	private Long mno;
	
	public String getLink() {
		
		//url호출시에 .은 문제가되기때문에 변환해준다.
		//.은 URL인코딩으로 변환이 되지않는다.
		String fileLinkName = fileName.replace(".", "#");
		
		// 2021/03/17
		String str = uploadPath+"/s_"+uuid+"_"+fileLinkName;
		
		String enStr = "";
		
		try {
			
			//URL에 맞는 형식으로 인코딩하는코드
			enStr = URLEncoder.encode(str,"UTF-8");
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
		return enStr;
	}
	public AttachFileDTO(String fileName, String uploadPath, String uuid, boolean image) {
		super();
		this.fileName = fileName;
		this.uploadPath = uploadPath;
		this.uuid = uuid;
		this.image = image;
	}
}
