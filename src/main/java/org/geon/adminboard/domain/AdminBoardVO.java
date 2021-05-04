package org.geon.adminboard.domain;

import java.sql.Date;
import java.util.List;

import org.geon.common.dto.AttachFileDTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class AdminBoardVO {

	private Long bano;
	private Integer category;
	private String title, content, writer;
	private Date regdate, updateDate;
	private Boolean enabled;
	
	
	private List<AttachFileDTO> fileList;

}
