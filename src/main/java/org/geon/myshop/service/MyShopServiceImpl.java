package org.geon.myshop.service;

import java.util.List;

import org.geon.myshop.domain.MyShopVO;
import org.geon.myshop.dto.MenuDTO;
import org.geon.myshop.dto.MyShopDTO;
import org.geon.myshop.mapper.MenuAttachMapper;
import org.geon.myshop.mapper.MenuMapper;
import org.geon.myshop.mapper.MyShopAttachMapper;
import org.geon.myshop.mapper.MyShopMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class MyShopServiceImpl implements MyShopService {

	private final MyShopMapper mapper;

	private final MyShopAttachMapper myshopAttachMapper;
	
	private final MenuMapper menuMapper;
	
	private final MenuAttachMapper menuAttachMapper;

	@Transactional
	@Override
	public void updateInfo(MyShopDTO dto) {
		MyShopVO myshop = toDomain(dto);

		log.info(myshop);

		mapper.updateInfo(myshop);

		if (myshop.getFileList() == null || myshop.getFileList().size() <= 0) {
			return;
		}

		myshop.getFileList().forEach(attach -> {
			log.info(attach);
			attach.setSno(myshop.getSno());
			log.info(attach);
			myshopAttachMapper.insert(attach);
		});
	}

	@Transactional
	@Override
	public void updateGuide(MyShopDTO dto) {
		MyShopVO myshop = toDomain(dto);

		log.info(myshop);

		mapper.updateGuide(myshop);

		if (myshop.getFileList() == null || myshop.getFileList().size() <= 0) {
			return;
		}

		myshop.getFileList().forEach(attach -> {
			log.info(attach);
			attach.setSno(myshop.getSno());
			log.info(attach);
			myshopAttachMapper.insert(attach);
		});
	}
	
	@Override
	public void updateStore(MyShopDTO dto) {
		MyShopVO myshop = toDomain(dto);
		mapper.updateStore(myshop);
		
	}

	@Override
	public MyShopDTO getShop(String userid) {
		return toDTO(mapper.getShop(userid));
	}

	@Override
	public List<MenuDTO> getList(Long sno) {
		return menuMapper.getList(sno);
	}

	@Override
	public List<MenuDTO> getOne(Long mno) {
		return menuMapper.getOne(mno);
	}
	
	@Transactional
	@Override
	public void insertMenu(MenuDTO menu) {
		menuMapper.insertMenu(menu);
		
		
		if (menu.getFileList() == null || menu.getFileList().size() <= 0) {
			return;
		}

		menu.getFileList().forEach(attach -> {
			log.info(attach);
			attach.setMno(menu.getMno());
			log.info(attach);
			menuAttachMapper.insert(attach);
		});
	}

	@Override
	public void insertCategory(MenuDTO menu) {
		menuMapper.insertCategory(menu);
	}

	@Override
	public void updateMenu(MenuDTO menu) {
		menuMapper.updateMenu(menu);
	}

	@Override
	public void deleteCategory(MenuDTO menu) {
		menuMapper.deleteCategory(menu);
	}

	@Override
	public void changeStatus(MenuDTO menu) {
		menuMapper.changeStatus(menu);
	}

	@Override
	public void deleteMenu(Long mno) {
		menuMapper.deleteMenu(mno);
	}

	
	
}
