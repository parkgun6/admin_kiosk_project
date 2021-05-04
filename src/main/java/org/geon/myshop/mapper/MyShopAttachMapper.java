package org.geon.myshop.mapper;

import java.util.List;

import org.geon.common.dto.AttachFileDTO;
import org.geon.myshop.domain.MyShopVO;

public interface MyShopAttachMapper {

	void insert(AttachFileDTO dto);
	
	void delete(String uuid);
	
	List<MyShopVO> findByBano(Long bano);
}
