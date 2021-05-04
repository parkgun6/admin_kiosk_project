package org.geon.myshop.dto;

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
public class MyShopDTO {

	private Long sno;
	private String sname;
	private Double lat;
	private Double lng;
	private String userid;
	private String info;
	private String guide;
	private String tel;
	private String address;
	private String businessHour;
	private String Holiday;
	private Date regdate;
	private Date updateDate;
	private Boolean enabled;
	private Boolean fixcode;
	

	private List<AttachFileDTO> fileList;
}
