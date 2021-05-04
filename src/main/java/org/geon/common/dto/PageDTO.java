package org.geon.common.dto;

import java.util.HashMap;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class PageDTO {
	
	//이걸쓰지않으면 생성자를 만들어줘야한다.
	@Builder.Default
	private int page = 1;
	@Builder.Default
	private int perSheet = 10;
	
	//t, tc, tcw
	private String type;
	
	private String keyword;
	
	//이 기능이 있어야지만 Skip을 해줄수있다.
	public int getSkip() {
		//음수가 나올경우에 디폴트값을 0으로 만드는 validation이 필요하다.
		return (page - 1) * perSheet;
	}
	
	public String[] getArr() {
		// 키워드가 null이거나 키워드의 길이가 0인경우
		if(keyword == null || keyword.trim().length() == 0) {
			return null;
		}
		if(type == null) {
			return null;
		}
		//""로 쪼개면 모든것이 쪼개진다.
		return type.split("");
	}
	
	public Map<String,String> getMap(){
		Map<String,String> map = new HashMap<>();
		map.put("t", "10");
		map.put("c", "10");
		map.put("w", "10");
		return map;
	}

	public PageDTO(int page, int perSheet) {
		super();
		this.page = page;
		this.perSheet = perSheet;
	}
}
