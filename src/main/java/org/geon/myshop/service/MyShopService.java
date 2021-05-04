package org.geon.myshop.service;

import java.util.List;

import org.geon.myshop.domain.MyShopVO;
import org.geon.myshop.dto.MenuDTO;
import org.geon.myshop.dto.MyShopDTO;

public interface MyShopService {

	void updateInfo(MyShopDTO dto);
	
	void updateGuide(MyShopDTO dto);
	
	void updateStore(MyShopDTO dto);
	
	MyShopDTO getShop(String userid);
	
	List<MenuDTO> getList(Long sno);
	
	List<MenuDTO> getOne(Long mno);
	
	void insertMenu(MenuDTO menu);
	
	void insertCategory(MenuDTO menu);
	
	void updateMenu(MenuDTO menu);
	
	void deleteCategory(MenuDTO menu);
	
	void changeStatus(MenuDTO menu);
	
	void deleteMenu(Long mno);
	
	default MyShopDTO toDTO(MyShopVO myshop) {
		MyShopDTO dto = new MyShopDTO();
		dto.setSno(myshop.getSno());
		dto.setSname(myshop.getSname());
		dto.setLat(myshop.getLat());
		dto.setLng(myshop.getLng());
		dto.setUserid(myshop.getUserid());
		dto.setInfo(myshop.getInfo());
		dto.setGuide(myshop.getGuide());
		dto.setTel(myshop.getTel());
		dto.setAddress(myshop.getAddress());
		dto.setBusinessHour(myshop.getBusinessHour());
		dto.setHoliday(myshop.getHoliday());
		dto.setRegdate(myshop.getRegdate());
		dto.setUpdateDate(myshop.getUpdateDate());
		dto.setFileList(myshop.getFileList());
		dto.setEnabled(myshop.getEnabled());
		dto.setFixcode(myshop.getFixcode());
		return dto;
	}
	
	default MyShopVO toDomain(MyShopDTO dto) {
		return MyShopVO.builder()
				.sno(dto.getSno())
				.sname(dto.getSname())
				.lat(dto.getLat())
				.lng(dto.getLng())
				.userid(dto.getUserid())
				.info(dto.getInfo())
				.guide(dto.getGuide())
				.tel(dto.getTel())
				.address(dto.getAddress())
				.businessHour(dto.getBusinessHour())
				.Holiday(dto.getHoliday())
				.regdate(dto.getRegdate())
				.updateDate(dto.getUpdateDate())
				.fileList(dto.getFileList())
				.enabled(dto.getEnabled())
				.fixcode(dto.getFixcode())
				.build();
	}
}
