package org.geon.myshop.domain;

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
public class MenuVO {

	private Long mno;
	private Long sno;
	private String name;
	private String explanation;
	private int price;
	private boolean enabled;
	private boolean status;
	
	private List<AttachFileDTO> fileList;
	
}
