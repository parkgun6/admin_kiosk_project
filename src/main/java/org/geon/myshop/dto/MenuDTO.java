package org.geon.myshop.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.geon.common.dto.AttachFileDTO;
import org.geon.myshop.domain.MenuVO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MenuDTO {

	private Long mno;
	private Long sno;
	private String name;
	private String explanation;
	private String status;
	private int price;
	private boolean enabled;
	
	private Long cno;
	private String category;
	private String topping;

	private List<AttachFileDTO> fileList;
}
