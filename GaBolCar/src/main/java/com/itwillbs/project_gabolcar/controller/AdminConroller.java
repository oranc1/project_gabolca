package com.itwillbs.project_gabolcar.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.project_gabolcar.service.BrcService;
import com.itwillbs.project_gabolcar.service.CarService;
import com.itwillbs.project_gabolcar.service.MemberService;
import com.itwillbs.project_gabolcar.service.ResService;
import com.itwillbs.project_gabolcar.vo.CarOptionVO;
import com.itwillbs.project_gabolcar.vo.CarVO;
import com.itwillbs.project_gabolcar.vo.MemberVO;
import com.itwillbs.project_gabolcar.vo.PageInfo;
import com.itwillbs.project_gabolcar.vo.QstPageInfoVO;
import com.itwillbs.project_gabolcar.vo.ResInfoVO;

@Controller
public class AdminConroller {

	@Autowired
	private CarService car_service;
	@Autowired
	private BrcService brc_service;
	@Autowired
	private MemberService mem_service;
	@Autowired
	private ResService res_service;
	
	// 대시보드 이동
	@GetMapping("admDash")
	public String admDash(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
		return "html/admin/adm_dash";
	}
	
	// 차량리스트 이동
	@GetMapping("admCarList")
	public String admCarList(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
		return "html/admin/adm_car_list";
	}
	
	// 차량리스트 조회
    @ResponseBody
    @RequestMapping(value= "carList.ajax", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
    public String carSearch(@RequestParam Map<String, Object> map) {
		int listLimit = 15;
		int pageNum = Integer.parseInt(String.valueOf(map.get("pageNum")));
		int startRow = (pageNum -1) * listLimit;
		
		// 출력할 데이터 가져오기
		map.put("startRow", startRow);
		map.put("listLimit", listLimit);
		List<Map<String, Object>> carList = car_service.carList(map);
		
		try {
			Thread.sleep(100);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		// 출력할 데이터 사이즈
		map.remove("startRow");
		map.remove("listLimit");
		int listCount = car_service.carList(map).size();
		
		//한 페이지에서 표시할 페이지 목록 갯수 설정
		int pageListLimit = 5;
		// 3. 전체 페이지 목록 수 계산
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		// 4. 시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		// 5. 끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		Map<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("listCount", listCount);
		pageInfo.put("pageListLimit", pageListLimit);
		pageInfo.put("maxPage", maxPage);
		pageInfo.put("startPage", startPage);
		pageInfo.put("endPage", endPage);
		pageInfo.put("pageNum", pageNum);
		
		carList.add(pageInfo);
		
		JSONArray jsonArray = new JSONArray(carList);
    	return jsonArray.toString();
    }
    
	// 지점리스트 이동
	@GetMapping("admBrcList")
	public String admBrcList(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
		List<Map<String, Object>> brcList = brc_service.brcList();
		model.addAttribute("brcList",brcList);
		return "html/admin/adm_brc_list";
	}
	
	// 차량등록폼 이동
	@GetMapping("CarRegister")
	public String carRegister(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
		List<Map<String, Object>> brcList = brc_service.brcList();
		List<Map<String, Object>> optionList = car_service.optionList();
		model.addAttribute("brcList",brcList);
		model.addAttribute("optionList",optionList);
		
		return "html/admin/car_register";
	}
	
	// 차량등록
	@PostMapping("CarRegisterPro")
	public String carRegisterPro(CarOptionVO caroption ,CarVO car, HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
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

	    MultipartFile[] mFiles = car.getFiles();

	    if (mFiles != null && mFiles.length > 0) {
	        int fileCount = Math.min(mFiles.length, 6); // 파일 수를 6개로 제한

	        for (int i = 0; i < fileCount; i++) {
	            MultipartFile mFile = mFiles[i];
	            String originalFileName = mFile.getOriginalFilename();

	            if (originalFileName != null && !originalFileName.isEmpty()) {
	                String uuid = UUID.randomUUID().toString();
	                String carFileName = uuid.substring(0, 8) + "_" + originalFileName;

	                // 파일명을 해당 car_file에 저장
	                switch (i) {
	                    case 0:
	                        car.setCar_file1(carFileName);
	                        break;
	                    case 1:
	                        car.setCar_file2(carFileName);
	                        break;
	                    case 2:
	                        car.setCar_file3(carFileName);
	                        break;
	                    case 3:
	                        car.setCar_file4(carFileName);
	                        break;
	                    case 4:
	                        car.setCar_file5(carFileName);
	                        break;
	                    case 5:
	                        car.setCar_file6(carFileName);
	                        break;
	                }

	                System.out.println("실제 업로드 될 파일명: " + carFileName);

	                try {
	                    mFile.transferTo(new File(saveDir, carFileName));
	                } catch (IllegalStateException e) {
	                    e.printStackTrace();
	                    model.addAttribute("msg", "파일 업로드 실패!");
	                    return "inc/fail_back";
	                } catch (IOException e) {
	                    e.printStackTrace();
	                    model.addAttribute("msg", "파일 업로드 실패!");
	                    return "inc/fail_back";
	                }
	            }
	        }
	        	
	        int insertCount = car_service.carRegister(car);

	        if (insertCount > 0) {
	            System.out.println("차량 등록 성공");
	            car.setCar_idx((int) car_service.carSelect(car).get("car_idx"));
	            insertCount = car_service.carOptionRegister(car);
	            if (insertCount > 0) {
	                System.out.println("차량 옵션 등록 성공");
	            } else {
	                System.out.println("차량 옵션 등록 실패");
	            }
	        } else {
	            model.addAttribute("msg", "차량 등록 실패!");
	            return "inc/fail_back";
	        }

	    }
	    return "redirect:/admCarList";
	}
	
	// 차량삭제
	@GetMapping("carDeletePro")
	public String carDeletePro(int car_idx, HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
	    // 차량 옵션 삭제 추가
//	    int optionDeleteCount = car_service.carOptionDelete(car_idx);
//
//	    if (optionDeleteCount > 0) {
//	        System.out.println("차량 옵션 삭제 성공");
//	    } else {
//	        System.out.println("차량 옵션 삭제 실패");
//	    }

	    if (car_service.carDelete(car_idx) > 0) {
	        return "redirect:/admCarList";
	    } else {
	        model.addAttribute("msg", "삭제 실패");
	        return "inc/fail_back";
	    }
	    
	}
	// 지점등록폼 이동
	@GetMapping("brcRegister")
	public String brcRegister(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
		return "html/admin/brc_register";
	}
	
	// 지점등록
	@PostMapping("brcRegisterPro")
	public String brcRegisterPro(@RequestParam Map<String, String> map,HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
		int insertCount = 0;
		map.put("brc_addr", map.get("brc_addr") +","+ map.get("brc_addrDetail"));
		insertCount = brc_service.brcRegister(map);
		if (insertCount == 0) {
			model.addAttribute("msg","등록 실패");
			return "inc/fail_back";
		}
		return "inc/close";
	}
	
	// 지점명 중복체크
	@ResponseBody
	@GetMapping("brcCheckRdndn")
	public int brcCheckRdndn(@RequestParam Map<String,String> map) {
		return brc_service.isBrcNameCheck(map);
	}
	
	// 지점수정폼 이동
	@GetMapping("brcUpdate")
	public String brcUpdate(@RequestParam int brc_idx,HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
		Map<String, Object> brc = brc_service.brcSelect(brc_idx);
		brc.put("brc_addrDetail", brc.get("brc_addr").toString().split(",")[1]);
		brc.put("brc_addr", brc.get("brc_addr").toString().split(",")[0]);
		model.addAttribute("brc",brc);
		return "html/admin/brc_update";
	}
	
	// 지점수정
	@PostMapping("brcUpdatePro")
	public String brcUpdatePro(@RequestParam Map<String, String> map,HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
		map.put("brc_addr", map.get("brc_addr") +","+ map.get("brc_addrDetail"));
		int updateCount = brc_service.brcUpdate(map);
		if (updateCount > 0) {
			return "inc/close";
		} else {
			model.addAttribute("msg","수정 실패");
			return "inc/fail_back";
		}
	}
	
	// 지점삭제
	@GetMapping("brcDeletePro")
	public String brcDeletePro(int brc_idx,HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
        
        if (car_service.getCarBrcNameCount(brc_idx) > 0) {
            model.addAttribute("msg","지점에 소속된 차량이 있습니다.");
            return "inc/fail_back";
        } else {
            int deleteCount = brc_service.brcDelete(brc_idx);
            if (deleteCount > 0) {
                return "redirect:/admBrcList";
            } else {
                model.addAttribute("msg","삭제 실패");
                return "inc/fail_back";
            }
        }
        
    }
	
	// 차량수정폼 이동
	@GetMapping("carUpdate")
	public String carUpdate(CarOptionVO carOption, CarVO car,HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
		Map<String, Object> map = car_service.carSelect(car);
		model.addAttribute("car",map);
		List<Map<String, Object>> brcList = brc_service.brcList();
		model.addAttribute("brcList",brcList);
		// 0620 차량수정으로 가져갈 optionList
		List<Map<String, Object>> optionList = car_service.optionList();
		model.addAttribute("optionList",optionList);
		
	    List<Integer> selectedOptionList = car_service.getSelectedOptionList(car.getCar_idx());
	    model.addAttribute("selectedOptionList", selectedOptionList);
	    System.out.println("selectedOptionList: " + selectedOptionList);
	    return "html/admin/car_update";
	}
	
	// 차량수정 - 등록된 차량 파일 삭제
	@PostMapping("carDeleteFile")
	public void carDelete(	
			@RequestParam int car_file_index,
			@RequestParam int car_idx, 
			@RequestParam String car_file,
			@RequestParam String car_file_path,
			CarVO car,
			HttpServletResponse response,
			HttpSession session,
			Model model) {
		
		try {
			// 응답데이터 출력을 위한 response 객체의 인코딩 타입 설정
			response.setCharacterEncoding("UTF-8");
			car.setCar_file_index(car_file_index);
			int deleteCount = car_service.removeBoardFile(car);

			
			// DB 파일 삭제 성공 시 실제 파일을 서버에서 삭제
			if(deleteCount > 0) {
				String uploadDir = "/resources/upload/car";
				String saveDir = session.getServletContext().getRealPath(uploadDir);
				// 경로 생성
				Path path = Paths.get(saveDir + "/" + car_file_path + "/" + car_file);
				System.out.println("path 경로: " + path);

				// 파일 삭제
				Files.deleteIfExists(path);
				response.getWriter().print("true");
			} else {
				response.getWriter().print("false");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
		
	// 차량수정 중
	@PostMapping("carUpdatePro")
	public String carUpdatePro(@RequestParam(value = "option_idx", required = false) List<Integer> optionIdxList,
			@RequestParam(value = "other_window", required = false) String other_window,
			CarVO car, HttpSession session, Model model) {
		
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
		
	    String uploadDir = "/resources/upload/car"; // 서버 이미지 저장 경로
	    String saveDir = session.getServletContext().getRealPath(uploadDir);

	    CarVO oldCar = car_service.carDetails(car.getCar_idx());

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

	    MultipartFile[] mFiles = car.getFiles();

	    if (mFiles != null && mFiles.length > 0) {
	        int fileCount = Math.min(mFiles.length, 6);

	        for (int i = 0; i < fileCount; i++) {
	            MultipartFile mFile = mFiles[i];
	            String originalFileName = mFile.getOriginalFilename();
	            
	            
	            if (originalFileName != null && !originalFileName.isEmpty()) {
	                String uuid = UUID.randomUUID().toString();
	                String carFileName = uuid.substring(0, 8) + "_" + originalFileName;

	                int indexToSave = i + 1;
	                while (oldCar.getCarFileAt(indexToSave) != null && !oldCar.getCarFileAt(indexToSave).isEmpty()) {
	                    indexToSave++;
	                    if(indexToSave > 6) {
	                        break;
	                    }
	                }

	                if (indexToSave <= 6) {
	                    car.setCarFileAt(indexToSave, carFileName);

	                    System.out.println("실제 업로드 될 파일명: " + carFileName);

	                    try {
	                        mFile.transferTo(new File(saveDir, carFileName));
	                    } catch (IllegalStateException e) {
	                        e.printStackTrace();
	                        model.addAttribute("msg", "파일 업로드 실패!");
	                        return "inc/fail_back";
	                    } catch (IOException e) {
	                        e.printStackTrace();
	                        model.addAttribute("msg", "파일 업로드 실패!");
	                        return "inc/fail_back";
	                    }
	                } else {
	                    model.addAttribute("msg", "더 이상 파일을 추가할 수 없습니다.");
	                    return "inc/fail_back";
	                }

	            }
	        }
	    }
	    
	    for (int i = 0; i < 6; i++) {
	        String existingCarFileName = oldCar.getCarFileAt(i + 1);
	        if (existingCarFileName != null && !existingCarFileName.isEmpty()) {
	            if (car.getCarFileAt(i + 1) == null || car.getCarFileAt(i + 1).isEmpty()) {
	                car.setCarFileAt(i + 1, existingCarFileName);
	            }
	        }
	    }

	    int updateCount = car_service.carUpdate(car);

	    if (updateCount > 0) {
	        System.out.println("차량 수정 성공");
	        car.setCar_idx((int) car_service.carSelect(car).get("car_idx"));
	        car_service.deleteOptionFile(car.getCar_idx());

	        // 옵션 수정 부분
	        if (optionIdxList != null && !optionIdxList.isEmpty()) {
	            for (Integer optionIdx : optionIdxList) {
	                CarOptionVO carOption = new CarOptionVO();
	                carOption.setCar_idx(car.getCar_idx());
	                carOption.setOption_idx(optionIdx);
	                int optionUpdateResult = car_service.carOptionRegister(car);

	                if (optionUpdateResult > 0) {
	                    System.out.println("옵션 수정 성공: " + optionIdx);
	                } else {
	                    System.out.println("옵션 수정 실패: " + optionIdx);
	                }
	            }
	        }
	    } else {
	        model.addAttribute("msg", "차량 수정 실패!");
	        return "inc/fail_back";
	    }
	    
	    if(other_window != null && other_window.equals("y")) {
	    	return "inc/close";
	    }
  	
	    return "redirect:/admCarList";
	    
	}
	
	
	// 옵션리스트 이동 - 디자인이 어려움
	@GetMapping("optionList")
	public String optionList(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
		List<Map<String,Object>> optionList = car_service.optionList();
		model.addAttribute("optionList",optionList);
		return "html/admin/option_list";
	}
	
    // 옵션등록폼 이동
    @GetMapping("optionInsert")
    public String optionInsert(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
        return "html/admin/option_register";
    }
    
    // 옵션명 중복체크
    @ResponseBody
    @GetMapping("optCheckRdndn")
    public int optCheckRdndn(@RequestParam Map<String, String> map) {
    	return car_service.isOptNameCheck(map);
    }
    
    // 옵션등록
    @PostMapping("optionRegisterPro")
    public String optionRegisterPro(
            @RequestParam String option_name, 
            @RequestParam MultipartFile option_image, 
            HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
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

        int insertCount = car_service.optionRegister(option_name, option_image_url);
        if(insertCount > 0) {
            try {
                mFile.transferTo(new File(saveDir, option_image_url));
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return "inc/close";
        } else {
            model.addAttribute("msg","옵션 등록 실패");
            return "inc/fail_back";
        }
    }
    
    // 옵션수정폼 이동
    @GetMapping("optionUpdate")
    public String optionUpdate(int option_idx, HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
    	Map<String, Object> option = car_service.optionSelect(option_idx);
    	model.addAttribute("option",option);
    	return "html/admin/option_update";
    }
    
    
    
    // 옵션수정
    @PostMapping("optionUpdatePro")
    public String optionUpdatePro(
    		@RequestParam Map<String, Object> map
    		, @RequestParam(value = "option_image", required = false) MultipartFile option_image
    		, HttpSession session
    		, Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
    	int updateCount = 0;
    	if(option_image == null) {
    		updateCount = car_service.optionUpdate(map);
    		if(updateCount > 0) {
    			return "inc/close";
    		} else {
    			model.addAttribute("msg","수정 실패");
    			return "inc/fail_back";
    		}
    	} else {
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
			try {
				Path path = Paths.get(saveDir+"/"+map.get("option_image_url"));
				Files.deleteIfExists(path);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
    		map.put("option_image_url", option_image_url);
    		updateCount = car_service.optionUpdate(map);
    		if(updateCount > 0) {
    			try {
    				mFile.transferTo(new File(saveDir, option_image_url));
    			} catch (IllegalStateException e) {
    				e.printStackTrace();
    			} catch (IOException e) {
    				e.printStackTrace();
    			}
    			return "inc/close";
    		} else {
    			model.addAttribute("msg","옵션 등록 실패");
    			return "inc/fail_back";
    		}
    	}
    }
    
    // 옵션 삭제(파일 포함)
    @GetMapping("optionDeletePro")
    public String optionDeletePro(int option_idx, HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
    	Map<String, Object> map = car_service.optionSelect(option_idx);
    	int deleteCount = car_service.optionDelete(option_idx);
    	if(deleteCount > 0) {
    		try {
				String uploadDir = "/resources/upload/car_options";
				String saveDir = session.getServletContext().getRealPath(uploadDir);
				Path path = Paths.get(saveDir+"/"+map.get("option_image_url"));
				Files.deleteIfExists(path);
			} catch (IOException e) {
				e.printStackTrace();
			}
    	} else {
    		model.addAttribute("msg","옵션 삭제 실패");
    		return "inc/fail_back";
    	}
    	return "redirect:/optionList";
    }
    
	//예약리스트 이동
	@GetMapping("admResList")
	public String admResList(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
		return "redirect:/ResListForm";
	}

	// 예약리스트 조회
	@GetMapping("ResListForm")
	public String resList(
		@RequestParam(name = "searchType", defaultValue = "") String searchType, 
		@RequestParam(name = "searchKeyword", defaultValue = "") String searchKeyword, 
		@RequestParam(defaultValue = "1") int pageNum,
		HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
		
		int listLimit = 10; // 한 페이지에서 표시할 목록 갯수 지정
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행(레코드) 번호
		
		List<ResInfoVO> resList = res_service.getResList(searchType, searchKeyword, startRow, listLimit);
		
		int listCount = res_service.getResListCount(searchType, searchKeyword);
		
		int pageListLimit = 50;
		
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);		
		
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		QstPageInfoVO PageInfo = new QstPageInfoVO(listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("resList", resList);
		model.addAttribute("pageInfo", PageInfo);
		
		return "html/admin/adm_res_list";
		}
	
	
	// 예약 상세
    @RequestMapping(value = "AdmResDetail", method = RequestMethod.GET)
    public String admResDetail(
    		@ModelAttribute("searchVO") ResInfoVO searchVO
    		, @RequestParam("res_idx") int res_idx
    		, HttpSession session
    		, Model model) {
    	String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
    	ResInfoVO resDetail = res_service.getResDetail(res_idx);
    	model.addAttribute("resDetail", resDetail);
    	
    	return "html/admin/adm_res_detail";
    }

	// 회원리스트 이동
	@GetMapping("admMemList")
	public String admMemList(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
		return "redirect:/MemListForm";     	
	}

	// 회원리스트 조회
	@GetMapping("MemListForm")
	public String memList(
			@RequestParam(name = "searchType", defaultValue = "") String searchType, 
			@RequestParam(name = "searchKeyword", defaultValue = "") String searchKeyword, 
			@RequestParam(defaultValue = "1") int pageNum, 
			HttpSession session,
			Model model) {
		String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
		
		int listLimit = 5; // 한 페이지에서 표시할 목록 갯수 지정
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행(레코드) 번호
		
		List<MemberVO> memList = mem_service.getMemList(searchType, searchKeyword, startRow, listLimit);
		
		int listCount = mem_service.getMemListCount(searchType, searchKeyword);
		
		int pageListLimit = 2;
		
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);		
		
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		QstPageInfoVO PageInfo = new QstPageInfoVO(listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("memList", memList);
		model.addAttribute("pageInfo", PageInfo);
		
		return "html/admin/adm_mem_list";
	}
	
	// 회원 상세
    @RequestMapping(value = "AdmMemDetail", method = RequestMethod.GET)
    public String admMemDetail(
    		@ModelAttribute("searchVO") MemberVO searchVO
    		, @RequestParam("mem_idx") int mem_idx
    		, HttpSession session
    		, Model model) {
    	String sId = (String)session.getAttribute("sId");
		if (sId == null || !sId.equals("admin@admin.com")) {
			model.addAttribute("msg","접근권한이 없습니다.");
			model.addAttribute("targetURL","/project_gabolcar");
			return "inc/success_forward";
		}
    	MemberVO memDetail = mem_service.getMemDetail(mem_idx);
    	model.addAttribute("memDetail", memDetail);
    	
    	return "html/admin/adm_mem_detail";
    }
    
    @ResponseBody
	@GetMapping("carCheckRdndn")
	public int carCheckRdndn(@RequestParam Map<String,String> map) {
		return car_service.isCarNumberCheck(map);
	}
    
}