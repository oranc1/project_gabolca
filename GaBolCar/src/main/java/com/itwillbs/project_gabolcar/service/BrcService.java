package com.itwillbs.project_gabolcar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_gabolcar.mapper.BrcMapper;

@Service
public class BrcService {
	@Autowired
	private BrcMapper mapper;
	
	public int brcRegister(Map<String, String> map) {
		return mapper.registerBrc(map);
	}

	public List<Map<String, Object>> brcList() {
		return mapper.selectBrcList();
	}

	public Map<String, Object> brcSelect(int brc_idx) {
		return mapper.selectBrc(brc_idx);
	}

	public int brcUpdate(Map<String, String> map) {
		return mapper.updateBrc(map);
	}

	public int brcDelete(int brc_idx) {
		return mapper.deleteBrc(brc_idx);
	}
	
}
