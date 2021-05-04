package org.geon.userboard.domain;

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
public class ReplyVO {

	private Long rno, buno;
	private String content, writer;
	private boolean enabled;
	private Date regdate, updateDate;
}
