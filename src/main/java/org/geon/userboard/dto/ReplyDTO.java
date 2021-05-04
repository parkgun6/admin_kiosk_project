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
public class ReplyDTO {

	private Long rno, buno;
	private String content, writer;
	private boolean enabled;
	private Date regdate, updateDate;
}
