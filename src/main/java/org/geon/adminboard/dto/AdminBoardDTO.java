package org.geon.adminboard.dto;

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
public class AdminBoardDTO {


	private Long bano;
	private Integer category;
	private String title, content, writer;
	private Date regdate, updateDate;
	private Boolean enabled;
	
	private List<AttachFileDTO> fileList;

}
