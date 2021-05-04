package org.geon.userboard.dto;

import java.sql.Date;
import java.util.List;

import org.geon.common.dto.AttachFileDTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserBoardDTO {


	private Long buno;
	private String category;
	private String title, content, writer;
	private Date regdate, updateDate;
	private Boolean enabled;
	
	private List<AttachFileDTO> fileList;

}
