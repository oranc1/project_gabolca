package com.itwillbs.project_gabolcar.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.project_gabolcar.service.BrcService;
import com.itwillbs.project_gabolcar.service.CarService;
import com.itwillbs.project_gabolcar.vo.CarVO;

@Controller
public class AdminConroller {

	@Autowired
	private CarService car_service;
	@Autowired
	private BrcService brc_service;
	
	// 대시보드 이동
	@GetMapping("admDash")
	public String admDash() {
		return "html/admin/adm_dash";
	}
	
	// 차량리스트 이동
	@GetMapping("admCarList")
	public ModelAndView admCarList() {
		List<Map<String, Object>> carList = car_service.carList();
		return new ModelAndView("html/admin/adm_car_list","carList",carList);
	}
	
	// 지점리스트 이동
	@GetMapping("admBrcList")
	public ModelAndView admBrcList() {
		List<Map<String, Object>> brcList = brc_service.brcList();
		return new ModelAndView("html/admin/adm_brc_list","brcList",brcList);
	}
	
	// 차량등록폼 이동
	@GetMapping("CarRegister")
	public String carRegister(Model model) {
		List<Map<String, Object>> brcList = brc_service.brcList();
		List<Map<String, Object>> optionList = car_service.optionList();
		model.addAttribute("brcList",brcList);
		model.addAttribute("optionList",optionList);
		
		return "html/admin/car_register";
	}
	
	// 차량등록
	@PostMapping("CarRegisterPro")
	public String carRegisterPro(CarVO car, HttpSession session, Model model) {
		String uploadDir = "/resources/upload/car"; // 서버 이미지 저장 경로
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		
		try {
			Date date = new Date(); 
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			car.setCar_file_path("/" + sdf.format(date));
			saveDir = saveDir + car.getCar_file_path();
			
			Path path = Paths.get(saveDir);
			
			Files.createDirectories(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 복수개의 이미지파일 관리
	    MultipartFile[] mFiles = car.getFiles();

	    if (mFiles != null && mFiles.length > 0) {
	        int fileCount = Math.min(mFiles.length, 6); // 파일 수를 6개로 제한
	        
	        boolean registrationComplete = false; // 차량 등록 완료 여부를 나타냄
 
	        for (int i = 0; i < fileCount; i++) {
	            MultipartFile mFile = mFiles[i];
	            String originalFileName = mFile.getOriginalFilename();

	            if (originalFileName != null && !originalFileName.isEmpty()) {
	                String uuid = UUID.randomUUID().toString();
	                String car_file = uuid.substring(0, 8) + "_" + originalFileName;

	                car.setCar_file(car_file);
	                System.out.println("실제 업로드 될 파일명 : " + car.getCar_file());

	                int insertCount = car_service.carRegister(car);

	                if (insertCount > 0) {
	                    try {
	                        mFile.transferTo(new File(saveDir, car.getCar_file()));
	                    } catch (IllegalStateException e) {
	                        e.printStackTrace();
	                    } catch (IOException e) {
	                        e.printStackTrace();
	                    }
	                    
	                    registrationComplete = true; // 자동차가 성공적으로 등록되면 true 로 설정
	                    break; // break 통해 빠져나옴
	                } else {
	                    model.addAttribute("msg", "차량 등록 실패!");
	                    return "fail_back";
	                }
	            }
	        }
	        
	        if (!registrationComplete) {
	            model.addAttribute("msg", "차량 등록 실패!");
	            return "fail_back";
	        }
	    }

	    return "redirect:/admCarList";
	}
	
	// 지점등록폼 이동
	@GetMapping("brcRegister")
	public String brcRegister() {
		return "html/admin/brc_register";
	}
	
	// 지점등록
	@PostMapping("brcRegisterPro")
	public String brcRegisterPro(@RequestParam Map<String, String> map, Model model) {
		int insertCount = brc_service.brcRegister(map);
		if (insertCount == 0) {
			model.addAttribute("msg","등록 실패");
			return "fail_back";
		}
		return "close";
	}
	
	// 지점수정폼 이동
	@GetMapping("brcUpdate")
	public ModelAndView brcUpdate(@RequestParam int brc_idx) {
		Map<String, Object> brc = brc_service.brcSelect(brc_idx);
		return new ModelAndView("html/admin/brc_update","brc",brc);
	}
	
	// 지점수정
	@PostMapping("brcUpdatePro")
	public String brcUpdatePro(@RequestParam Map<String, String> map,Model model) {
		int updateCount = brc_service.brcUpdate(map);
		if (updateCount == 0) {
			model.addAttribute("msg","수정 실패");
			return "fail_back";
		}
		return "close";
	}
	
	// 지점삭제
	@GetMapping("brcDeletePro")
	public String brcDeletePro(int brc_idx,Model model) {
		int deleteCount = brc_service.brcDelete(brc_idx);
		if (deleteCount == 0) {
			model.addAttribute("msg","삭제 실패");
			return "fail_back";
		}
		return "redirect:/admBrcList";
	}
	
	// 차량수정폼 이동
	@GetMapping("carUpdate")
	public String carUpdate(@RequestParam int car_idx,Model model) {
		Map<String, Object> car = car_service.carSelect(car_idx);
		model.addAttribute("car",car);
		List<Map<String, Object>> brcList = brc_service.brcList();
		model.addAttribute("brcList",brcList);
		return "html/admin/car_update";
	}
	
	// 차량수정
	@PostMapping("carUpdatePro")
	public String carUpdatePro(@RequestParam Map<String, String> map, Model model) {
		int updateCount = car_service.carUpdate(map);
		if (updateCount == 0) {
			model.addAttribute("msg","수정 실패");
			return "fail_back";
		}
		return "redirect:/admCarList";
	}
	
	// 차량삭제
	@GetMapping("carDeletePro")
	public String carDeletePro(int car_idx,Model model) {
		int deleteCount = car_service.carDelete(car_idx);
		if (deleteCount == 0) {
			model.addAttribute("msg","삭제 실패");
			return "fail_back";
		}
		return "redirect:/admCarList";
	}
	
	// 옵션리스트 이동 - 디자인이 어려움
	@GetMapping("optionList")
	public ModelAndView optionList() {
		List<Map<String,Object>> optionList = car_service.optionList();
		return new ModelAndView("html/admin/option_list","optionList",optionList);
	}
	
    // 옵션등록폼 이동
    @GetMapping("optionInsert")
    public String optionInsert() {
        return "html/admin/option_register";
    }
    
    // 옵션등록
    @PostMapping("optionRegisterPro")
    public String optionRegisterPro(
            @RequestParam(value="option_name", defaultValue="") String option_name, 
            @RequestParam(value="option_image", defaultValue="") MultipartFile option_image, 
            HttpSession session, Model model) {
        String uploadDir = "/resources/upload/car_options";
        String saveDir = session.getServletContext().getRealPath(uploadDir);
        try {
            Path path = Paths.get(saveDir);
            Files.createDirectories(path);
        } catch (IOException e) {
            e.printStackTrace();
        }
        MultipartFile mFile = option_image;
        String originalFileName = mFile.getOriginalFilename();
        String uuid = UUID.randomUUID().toString();
        String option_image_url = uuid.substring(0, 8) + "_" + originalFileName;

        int insertCount = car_service.optRegister(option_name, option_image_url);
        if(insertCount > 0) {
            try {
                mFile.transferTo(new File(saveDir, option_image_url));
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return "close";
        } else {
            model.addAttribute("msg","옵션 등록 실패");
            return "fail_back";
        }
    }
    
    // 옵션수정폼 이동
    @GetMapping("optionUpdate")
    public ModelAndView optionUpdate(int option_idx) {
    	Map<String, Object> option = car_service.optionSelect(option_idx);
    	return new ModelAndView("html/admin/option_update","option",option);
    }
    
}
