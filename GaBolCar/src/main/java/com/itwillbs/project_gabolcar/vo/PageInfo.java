package com.itwillbs.project_gabolcar.vo;

import lombok.*;

@Data
@AllArgsConstructor // 모든 전달인자를 받는 생성자 자동 정의(주의! 기본 생성자 자동 정의되지 않음!)
@NoArgsConstructor // 기본 생성자 자동 정의 => @AllArgsConstructor 어노테이션 사용 시 기본 생성자가 필요할 경우 반드시 추가해야햐는 어노테이션
public class PageInfo {
	private int listCount; // 전체 게시물 목록 갯수
	private int pageListLimit; // 페이지 당 표시할 페이지 번호 갯수
	private int maxPage; // 전체 페이지 수
	private int startPage; // 시작 페이지 번호
	private int endPage; // 끝 페이지 번호
	private int nowPage; // 현재 페이지 번호
}
