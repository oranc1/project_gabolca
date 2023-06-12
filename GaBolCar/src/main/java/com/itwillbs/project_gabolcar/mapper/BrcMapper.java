package com.itwillbs.project_gabolcar.mapper;

import java.util.List;
import java.util.Map;

public interface BrcMapper {
	
	// 지점 //
	int registerBrc(Map<String, String> map);

	List<Map<String, Object>> selectBrcList();

	Map<String, Object> selectBrc(int brc_idx);

	int updateBrc(Map<String, String> map);

	int deleteBrc(int brc_idx);
	
}
