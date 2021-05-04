package org.geon.common.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.geon.common.dto.AttachFileDTO;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@CrossOrigin
@RestController
@Log4j
public class UploadController {

	private String getFolder() {
		
		//MM은 대문자로 해야한다. 소문자로 처리하면 분으로 처리된다.
		//운영체제마다 사잇기호가 달라진다 윈도우는(-)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//시스템 운영체제에 있는 시간 기준으로 폴더를 만든다.
		//java.util로 import
		String str = sdf.format(new Date());
		
		//separator는 경로를 자동으로 잡아준다.
		return str.replace("-", File.separator);
	}
	
	@GetMapping("/view")
	public ResponseEntity<byte[]> viewFile(String file) {

		byte[] result = null;

		ResponseEntity<byte[]> res = null;

		try {
			String deStr = URLDecoder.decode(file, "UTF-8");

			String originStr = deStr.replace("#", ".");

			log.info(originStr);

			File targetFile = new File("C:\\upload\\" + originStr);

			String mimeType = Files.probeContentType(targetFile.toPath());

			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", mimeType);

			res = new ResponseEntity<>(
					FileCopyUtils.copyToByteArray(targetFile),
					header,
					HttpStatus.OK
					);

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return res;
	}
	
	
	//파일업로드는 get방식사용불가능
	@PostMapping("/upload")
	public ResponseEntity<List<AttachFileDTO>> upload(MultipartFile[] files){
		
		log.info("---------------");
		
		//업로드 된 파일의 null이나 length체크
		
		String uploadFolder = "C:\\upload";
		
		log.info("---------------");
		
		String folderPath = getFolder();
		
		File uploadPath = new File(uploadFolder,folderPath);
		
		//만일 파일경로가 없다면 mkdirs로 자동으로 만들어낸다.
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		List<AttachFileDTO> list = new ArrayList<>();
		
		for (int i = 0; i < files.length; i++) {
			
			MultipartFile mfile = files[i];
			
			log.info(mfile.getOriginalFilename());
			log.info(mfile.getSize());
			
			
			String fileName = mfile.getOriginalFilename();
			
			//파일 이름의 중복을 막기위해서 UUID 사용
			UUID uuid = UUID.randomUUID();
			
			//업로드 된 파일의 MIME타입이 IMEGE로 시작한 경우.
			boolean isImage = mfile.getContentType().startsWith("image");
			
			//올리려는 경로와 업로드한 파일의 이름을 넣어준다.
			//원본파일명 앞에 _를 붙여서 자동생성된 이름과 원본파일명과 구분해준다.
			File saveFile = new File(uploadPath,uuid.toString()+"_"+fileName);
			
			
			//파일을 내 저장소에 저장하는 코드
			try {
				//transferTo를 쓰면 input,outputStream을 안써도 된다.
				mfile.transferTo(saveFile);
				
				//MIME타입이 imege일 경우 썸네일을 만들어준다.
				if(isImage) {
					
					//썸네일에는 s_를 붙여서 썸네일 이미지를 구분해준다.
					FileOutputStream fos = new FileOutputStream(
							new File(uploadPath,"s_"+uuid.toString()+"_"+fileName));
					
					Thumbnailator.createThumbnail(
							mfile.getInputStream(),fos,1000,1000);
					
					fos.close();
					
				}
				
				//업로드한 파일의 변환이 끝난 뒤 실행된다
				AttachFileDTO attachFileDTO = new AttachFileDTO(
						fileName, folderPath,uuid.toString(),isImage);
				
				list.add(attachFileDTO);
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		return new ResponseEntity<>(list,HttpStatus.OK)	;
	}
	
	@DeleteMapping("/removeFile")
	public ResponseEntity<String> removeFile(@RequestBody AttachFileDTO dto){
		
		log.info(dto);
		
		log.info("remove....................");
		
		//파일의 경로를 알아낸다. 따로만든이유는 썸네일의 변수때문.
		String filePath = "C:\\upload\\" + dto.getUploadPath();
		String fileName = dto.getUuid() + "_" + dto.getFileName();
		
		//이미지일 경우 썸네일도 제거한다.
		if (dto.isImage()) {

			File thumb = new File(filePath + File.separator + "s_" + fileName);
			thumb.delete();

		}
		
		//delete를 사용하면 경로에있는 파일을 삭제한다.
		File target = new File(filePath + File.separator + fileName);
		target.delete();
		
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(String fileName) {
		
		log.info("download file: " + fileName);
		
		Resource resource = new FileSystemResource("c:\\upload\\"+fileName);
		
		log.info("resource:"+resource);
		
		String resourceName = resource.getFilename();
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			headers.add("Content-Disposition", "attachement; filename=" + new String(resourceName.getBytes("UTF-8"),"ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
}
