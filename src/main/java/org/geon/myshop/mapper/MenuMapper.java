package org.geon.myshop.mapper;

import java.util.List;

import org.geon.myshop.dto.MenuDTO;

public interface MenuMapper {

	List<MenuDTO> getList(Long sno);
	
	List<MenuDTO> getOne(Long mno);
	
	void insertMenu(MenuDTO menu);
	
	void insertCategory(MenuDTO menu);
	
	void updateMenu(MenuDTO menu);
	
	void deleteCategory(MenuDTO menu);
	
	void changeStatus(MenuDTO menu);
	
	void deleteMenu(Long mno);
}