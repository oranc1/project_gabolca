package com.itwillbs.project_gabolcar.vo;

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
	private String car_file; // 파일명
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

}
