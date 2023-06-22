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

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	public String admDash() {
		return "html/admin/adm_dash";
	}
	
	// 차량리스트 이동
	@GetMapping("admCarList")
	public String admCarList() {
		return "html/admin/adm_car_list";
	}
	
	// 차량리스트 조회
    @ResponseBody
    @RequestMapping(value= "carList.ajax", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
    public String carSearch(@RequestParam Map<String, Object> map, Model model) {
		System.out.println(map);
		
		int listLimit = 15;
		int pageNum = Integer.parseInt(String.valueOf(map.get("pageNum")));
		int startRow = (pageNum -1) * listLimit;
		
		map.put("startRow", startRow);
		map.put("listLimit", listLimit);
		List<Map<String, Object>> carList = car_service.carList(map);
		
		JSONArray jsonArray = new JSONArray(carList);
    	return jsonArray.toString();
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
	public String carRegisterPro(CarOptionVO caroption ,CarVO car, HttpSession session, Model model) {
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
	
	// 지점등록폼 이동
	@GetMapping("brcRegister")
	public String brcRegister() {
		return "html/admin/brc_register";
	}
	
	// 지점등록
	@PostMapping("brcRegisterPro")
	public String brcRegisterPro(@RequestParam Map<String, String> map, Model model) {
		int insertCount = 0;
		insertCount = brc_service.brcRegister(map);
		if (insertCount == 0) {
			model.addAttribute("msg","등록 실패");
			return "inc/fail_back";
		}
		return "inc/close";
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
		System.out.println(map);
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
	public String brcDeletePro(int brc_idx,Model model) {
		int deleteCount = brc_service.brcDelete(brc_idx);
		if (deleteCount > 0) {
			return "redirect:/admBrcList";
		} else {
			model.addAttribute("msg","삭제 실패");
			return "inc/fail_back";
		}
	}
	
	// 차량수정폼 이동
	@GetMapping("carUpdate")
	public String carUpdate(CarVO car,Model model) {
		Map<String, Object> map = car_service.carSelect(car);
		model.addAttribute("car",map);
		List<Map<String, Object>> brcList = brc_service.brcList();
		model.addAttribute("brcList",brcList);
		// 0620 차량수정으로 가져갈 optionList
		List<Map<String, Object>> optionList = car_service.optionList();
		model.addAttribute("optionList",optionList);
		// 0620 차량수정폼에 가져갈 car_options 
		List<Map<String, Object>> carOptionList = car_service.carOptionList(car);
		model.addAttribute("carOptionList", carOptionList);
		return "html/admin/car_update";
	}
	
	// 차량수정
//	@PostMapping("carUpdatePro")
//	public String carUpdatePro(@RequestParam Map<String, String> map, Model model) {
//		int updateCount = car_service.carUpdate(map);
//		if (updateCount > 0) {
//			model.addAttribute("msg","수정 완료");
//			return "redirect:/admCarList";
//		} else {
//			model.addAttribute("msg","수정 실패");
//			return "inc/fail_back";
//		}
//	}
	
	// 차량 수정 0619
	@PostMapping("carUpdatePro")
    public String carUpdatePro(@RequestParam(value = "option_idx", required = false) List<Integer> optionIdxList, CarVO car, HttpSession session, Model model) {

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

                    car.setCarFileAt(i+1, carFileName); // 파일명을 해당 car_file에 저장

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

        return "redirect:/admCarList";
    }
	
	
	
	
	
	
	
	// 차량삭제
	@GetMapping("carDeletePro")
	public String carDeletePro(int car_idx,Model model) {
		int deleteCount = car_service.carDelete(car_idx);
		if (deleteCount > 0) {
			model.addAttribute("msg","삭제 완료");
			return "redirect:/admCarList";
		} else {
			model.addAttribute("msg","삭제 실패");
			return "inc/fail_back";
		}
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
            @RequestParam String option_name, 
            @RequestParam MultipartFile option_image, 
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
    public ModelAndView optionUpdate(int option_idx) {
    	Map<String, Object> option = car_service.optionSelect(option_idx);
    	return new ModelAndView("html/admin/option_update","option",option);
    }
    
    // 옵션수정
    @PostMapping("optionUpdatePro")
    public String optionUpdatePro(
    		@RequestParam Map<String, Object> map,
    		@RequestParam(value = "option_image", required = false) MultipartFile option_image,
            HttpSession session, Model model) {
    	
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
    
    @ResponseBody
    @RequestMapping(value = "dsbCarStatus",method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
    public String dsbCarStatus() {
    	List<Map<String, Object>> carStatus = car_service.dsbCarStatus();
    	// 전달데이터
    	JSONObject data = new JSONObject();
    	// cols 설정
    	JSONObject col1 = new JSONObject();    //cols의 1번째 object를 담을 JSONObject
    	JSONObject col2 = new JSONObject();    //cols의 2번째 object를 담을 JSONObject
    	JSONArray cols = new JSONArray();        //위의 두개의 JSONObject를 담을 JSONArray
    	
    	col1.put("id", "");
    	col1.put("label", "차량상태");
    	col1.put("pattern", "");
    	col1.put("type", "string");
    	 
    	col2.put("id", "");
    	col2.put("label", "통계");
    	col2.put("pattern", "");
    	col2.put("type", "number");

    	cols.put(col1);
    	cols.put(col2);

    	// rows 설정
    	JSONArray rows = new JSONArray();        //row JSONObject를 담을 JSONArray
    	for (Map<String, Object>map : carStatus){        //JSONArray의 size만큼 돌면서 형식을 만듭니다.
    	    JSONObject legend = new JSONObject();
    	    legend.put("v", map.get("car_status"));
//    	    legend.put("f", null);
    	    
    	    JSONObject value = new JSONObject();
    	    value.put("v", map.get("state_total"));
//    	    value.put("f", null);
    	 
    	    JSONArray cValueArry = new JSONArray();
    	    cValueArry.put(legend);
    	    cValueArry.put(value);
    	 
    	    JSONObject cValueObj = new JSONObject();
    	    cValueObj.put("c", cValueArry);
    	 
    	    rows.put(cValueObj);
    	}
    	
    	// 전달데이터 cols, rows 추가
    	data.put("rows", rows);
    	data.put("cols", cols);
    	System.out.println(data.toString());
    	return data.toString();
    }
    
    @ResponseBody
    @RequestMapping(value = "dsbCarType",method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
    public String dsbCarType() {
    	List<Map<String, Object>> carType = car_service.dsbCarType();
    	// 전달데이터
    	JSONObject data = new JSONObject();
    	// cols 설정
    	JSONObject col1 = new JSONObject();    //cols의 1번째 object를 담을 JSONObject
    	JSONObject col2 = new JSONObject();    //cols의 2번째 object를 담을 JSONObject
    	JSONArray cols = new JSONArray();        //위의 두개의 JSONObject를 담을 JSONArray
    	
    	col1.put("id", "");
    	col1.put("label", "차종");
    	col1.put("pattern", "");
    	col1.put("type", "string");
    	
    	col2.put("id", "");
    	col2.put("label", "통계");
    	col2.put("pattern", "");
    	col2.put("type", "number");
    	
    	cols.put(col1);
    	cols.put(col2);
    	
    	// rows 설정
    	JSONArray rows = new JSONArray();        //row JSONObject를 담을 JSONArray
    	for (Map<String, Object>map : carType){        //JSONArray의 size만큼 돌면서 형식을 만듭니다.
    		JSONObject legend = new JSONObject();
    		legend.put("v", map.get("car_type"));
//    	    legend.put("f", null);
    		
    		JSONObject value = new JSONObject();
    		value.put("v", map.get("count"));
//    	    value.put("f", null);
    		
    		JSONArray cValueArry = new JSONArray();
    		cValueArry.put(legend);
    		cValueArry.put(value);
    		
    		JSONObject cValueObj = new JSONObject();
    		cValueObj.put("c", cValueArry);
    		
    		rows.put(cValueObj);
    	}
    	
    	// 전달데이터 cols, rows 추가
    	data.put("rows", rows);
    	data.put("cols", cols);
    	System.out.println(data.toString());
    	return data.toString();
    }
    @ResponseBody
    @RequestMapping(value = "dsbUserAges",method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
    public String userAges() {
    	List<Map<String, Object>> userAges = mem_service.dsbUserAges();
    	// 전달데이터
    	JSONObject data = new JSONObject();
    	// cols 설정
    	JSONObject col1 = new JSONObject();    //cols의 1번째 object를 담을 JSONObject
    	JSONObject col2 = new JSONObject();    //cols의 2번째 object를 담을 JSONObject
    	JSONArray cols = new JSONArray();        //위의 두개의 JSONObject를 담을 JSONArray
    	
    	col1.put("id", "");
    	col1.put("label", "연령대");
    	col1.put("pattern", "");
    	col1.put("type", "string");
    	
    	col2.put("id", "");
    	col2.put("label", "이용통계");
    	col2.put("pattern", "");
    	col2.put("type", "number");
    	
    	cols.put(col1);
    	cols.put(col2);
    	
    	// rows 설정
    	JSONArray rows = new JSONArray();        //row JSONObject를 담을 JSONArray
    	for (Map<String, Object>map : userAges){        //JSONArray의 size만큼 돌면서 형식을 만듭니다.
    		JSONObject legend = new JSONObject();
    		legend.put("v", map.get("ages"));
//    	    legend.put("f", null);
    		
    		JSONObject value = new JSONObject();
    		value.put("v", map.get("count"));
//    	    value.put("f", null);
    		
    		JSONArray cValueArry = new JSONArray();
    		cValueArry.put(legend);
    		cValueArry.put(value);
    		
    		JSONObject cValueObj = new JSONObject();
    		cValueObj.put("c", cValueArry);
    		
    		rows.put(cValueObj);
    	}
    	
    	// 전달데이터 cols, rows 추가
    	data.put("rows", rows);
    	data.put("cols", cols);
    	System.out.println(data.toString());
    	return data.toString();
    }
    
    @ResponseBody
    @RequestMapping(value = "dsbBrcHoldStatus",method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
    public String brcHoldStatus() {
    	List<Map<String, Object>> brcHoldStatus = car_service.dsbBrcHoldStatus();
    	// 전달데이터
    	JSONObject data = new JSONObject();
    	// cols 설정
    	JSONObject col1 = new JSONObject();    //cols의 1번째 object를 담을 JSONObject
    	JSONObject col2 = new JSONObject();    //cols의 2번째 object를 담을 JSONObject
    	JSONArray cols = new JSONArray();        //위의 두개의 JSONObject를 담을 JSONArray
    	
    	col1.put("id", "");
    	col1.put("label", "지점명");
    	col1.put("pattern", "");
    	col1.put("type", "string");
    	
    	col2.put("id", "");
    	col2.put("label", "보유현황");
    	col2.put("pattern", "");
    	col2.put("type", "number");
    	
    	cols.put(col1);
    	cols.put(col2);
    	
    	// rows 설정
    	JSONArray rows = new JSONArray();        //row JSONObject를 담을 JSONArray
    	for (Map<String, Object>map : brcHoldStatus){        //JSONArray의 size만큼 돌면서 형식을 만듭니다.
    		JSONObject legend = new JSONObject();
    		legend.put("v", map.get("brc_name"));
//    	    legend.put("f", null);
    		
    		JSONObject value = new JSONObject();
    		value.put("v", map.get("count"));
//    	    value.put("f", null);
    		
    		JSONArray cValueArry = new JSONArray();
    		cValueArry.put(legend);
    		cValueArry.put(value);
    		
    		JSONObject cValueObj = new JSONObject();
    		cValueObj.put("c", cValueArry);
    		
    		rows.put(cValueObj);
    	}
    	
    	// 전달데이터 cols, rows 추가
    	data.put("rows", rows);
    	data.put("cols", cols);
    	System.out.println(data.toString());
    	return data.toString();
    }
    
    @ResponseBody
    @RequestMapping(value = "dsbBrcMonthlyCount",method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
    public String brcMonthlyCount() {
    	List<Map<String, Object>> brcList = brc_service.brcList();
    	List<Map<String, Object>> brcMonthlyCount = res_service.dsbBrcMonthlyCount(brcList);
    	// 전달데이터
    	JSONObject data = new JSONObject();
    	// cols 설정
    	JSONObject colt = new JSONObject();    //cols의 1번째 object를 담을 JSONObject
    	JSONArray cols = new JSONArray();        //위의 두개의 JSONObject를 담을 JSONArray
    	// colt 설정
    	colt.put("id", "");
    	colt.put("label", "월");
    	colt.put("pattern", "");
    	colt.put("type", "string");
    	cols.put(colt);
    	// 아래 for문이 돌면서 column 지점명컬럼 자동생성 및 B
    	String[] brcName = new String[brcList.size()];
    	for (int i=0; i < brcList.size(); i++) {
    		Map<String,Object> brc = brcList.get(i);
    		JSONObject col = new JSONObject();    //cols에 담을 JSONObject
    		col.put("id", "");
    		col.put("label", brc.get("brc_name"));
    		col.put("pattern", "");
    		col.put("type", "number");
    		cols.put(col);
    		brcName[i] = (String) brc.get("brc_name");
    	}
    	
    	// rows 설정
    	JSONArray rows = new JSONArray();        //row JSONObject를 담을 JSONArray
    	for (int i=0; i < brcMonthlyCount.size(); i++){        //brcMonthlyCount의 size만큼 실행
    		Map<String, Object> map = brcMonthlyCount.get(i);
    		JSONObject legend = new JSONObject();
    		legend.put("v", map.get("월"));
    		
    		JSONArray cValueArry = new JSONArray();
    		cValueArry.put(legend);
    		
    		for (int j=0; j < brcList.size(); j++) { // brcList 만큼 실행
    			JSONObject value = new JSONObject();
    			value.put("v", map.get(brcName[j]));
        		cValueArry.put(value);
    		}
    		
    		JSONObject cValueObj = new JSONObject();
    		cValueObj.put("c", cValueArry);
    		rows.put(cValueObj);
    	}
    	
    	// 전달데이터 cols, rows 추가
    	data.put("rows", rows);
    	data.put("cols", cols);
    	System.out.println(data.toString());
    	return data.toString();
    }
    
}
