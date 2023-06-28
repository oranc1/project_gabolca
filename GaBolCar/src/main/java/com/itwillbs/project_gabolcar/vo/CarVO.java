package com.itwillbs.project_gabolcar.vo;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.google.protobuf.Timestamp;

import lombok.Data;

@Data
public class CarVO {
	private int car_idx;
	private String car_type;
	private String car_number;
	private String car_company;
	private String car_model;
	private int car_old;
	private String car_shift_type;
	private String car_fuel_type;
	private int car_riding;
	private int car_age;
	private int car_career;
	private String car_license;
	private int car_weekdays;
	private int car_weekend;
	private String brc_name;
	private int[] option_idx;
	//private String car_file; // 파일명
	private String car_status;
	private String car_file_path; // 파일 업로드 경로
	private Timestamp car_date;
//	private MultipartFile file; // 단일 파일
	private MultipartFile[] files; // 복수개 파일 
	private String oldFilename;
//	private List<String> carFiles;
//	private List<String> carFile; //
	
	private String car_file1;
	private String car_file2;
	private String car_file3;
	private String car_file4;
	private String car_file5;
	private String car_file6;
	
	private int car_file_index;
	
	
	// 파일명을 carFile1 ~ carFile6 변수에 셋팅
    public void setCarFileAt(int index, String carFile){
        switch (index) {
            case 1:
                this.car_file1 = carFile;
                break;
            case 2:
                this.car_file2 = carFile;
                break;
            case 3:
                this.car_file3 = carFile;
                break;
            case 4:
                this.car_file4 = carFile;
                break;
            case 5:
                this.car_file5 = carFile;
                break;
            case 6:
                this.car_file6 = carFile;
                break;
            default:
                throw new IllegalArgumentException("Invalid index: " + index);
        }
    }
    
    public List<String> getCarFiles() {
        return Arrays.asList(car_file1, car_file2, car_file3, car_file4, car_file5, car_file6);
    }
    
    public String getUpdateCarFileAt(int index) {
        switch (index) {
            case 1: return getCar_file1();
            case 2: return getCar_file2();
            case 3: return getCar_file3();
            case 4: return getCar_file4();
            case 5: return getCar_file5();
            default: return getCar_file6();
        }
    }

    public void setUpdateCarFileAt(int index, String carFile) {
        switch (index) {
            case 1: setCar_file1(carFile); break;
            case 2: setCar_file2(carFile); break;
            case 3: setCar_file3(carFile); break;
            case 4: setCar_file4(carFile); break;
            case 5: setCar_file5(carFile); break;
            default: setCar_file6(carFile); break;
        }
    }

    public boolean checkCarFileAt(int index) {
        switch (index) {
            case 1:
                return car_file1 != null && !car_file1.isEmpty();
            case 2:
                return car_file2 != null && !car_file2.isEmpty();
            case 3:
                return car_file3 != null && !car_file3.isEmpty();
            case 4:
                return car_file4 != null && !car_file4.isEmpty();
            case 5:
                return car_file5 != null && !car_file5.isEmpty();
            case 6:
                return car_file6 != null && !car_file6.isEmpty();
            default:
                return false;
        }
    }

//    
//    public void setCarFileAt(int index, String carFile) {
//    	switch (index) {
//    	case 1: setCar_file1(carFile); break;
//    	case 2: setCar_file2(carFile); break;
//    	case 3: setCar_file3(carFile); break;
//    	case 4: setCar_file4(carFile); break;
//    	case 5: setCar_file5(carFile); break;
//    	default: setCar_file6(carFile); break;
//    	}
//    }

}
