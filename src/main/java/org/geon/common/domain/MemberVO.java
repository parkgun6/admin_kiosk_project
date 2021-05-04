package org.geon.common.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {

	private String userid,userpw,userName;
	
	private boolean enabled;
	
	private Date regDate, updateDate;
	
	private List<AuthVO> authList;
}
