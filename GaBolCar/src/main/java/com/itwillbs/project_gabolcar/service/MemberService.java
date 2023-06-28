
package com.itwillbs.project_gabolcar.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.net.http.HttpRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.itwillbs.project_gabolcar.mapper.MemberMapper;
import com.itwillbs.project_gabolcar.vo.MemberVO;
import com.itwillbs.project_gabolcar.vo.PageInfo;



@Service
public class MemberService{
	@Autowired
	private MemberMapper mapper;

		//아이디 중복체크 mapper 접근
		public int idCheck(String id) {
			int cnt = mapper.idCheck(id);
			System.out.println("cnt: " + cnt);
			return cnt;
		}
		
		//회원가입 요청 작업을 위한 registMember()메서드 정의
		public int registMember(MemberVO member) {
			System.out.println("MemberService-registMember()");
			return mapper.insertMember(member);
		}

		// 로그인 정보 조회(아이디와 패스워드가 일치하는 레코드 조회)
		public MemberVO selectCorrectUser(MemberVO member) {
			System.out.println("서비스-selectCorrectUser()");
			return mapper.selectCorrectUser(member);
		}


		// 로그인 정보 조회(아이디가 일치하는 레코드의 패스워드 조회
		public String getPasswd(MemberVO member) {
			// TODO Auto-generated method stub
			return mapper.selectPasswd(member);
		}
		
		//아이디 찾기
		public String getId(MemberVO member) {
			System.out.println("아디찾기");
			return mapper.getId(member);
		}
		

		//회원 정보 띄우기
		public MemberVO getMemberInfo(String id) {
			
			return mapper.selectMemberinfo(id);
		}
		
		//회원 정보 수정하기
		public int ModifyMember(MemberVO member, String newPasswd, @RequestParam String newPasswd1) {
			return mapper.updateMember(member,newPasswd, newPasswd1);
			
		}
		
		//회원 탈퇴
		public int removeMember(MemberVO member) {
			return mapper.deleteMember(member);
		}
		
		//일치하는 회원 레코드 있는지 확인(비밀번호 찾기 과정 1)
		public String isExistUser(MemberVO member) {
			// TODO Auto-generated method stub
			return mapper.isExistUser(member);
		}

		public int changePw(MemberVO member) {
			return mapper.changePw(member);
		}

		public List<Map<String, Object>> dsbUserAges() {
			return mapper.dsbUserAges();
		}
		
		
		//-----------------------------------------------------------
		
		// 1:1 문의 게시판 DB 값 넘겨주기
		public List<MemberVO> memQuestionList() {
			return mapper.selectMemQuestionList();
		}

		// 1:1 문의게시판 로그인 상태 이름 넘겨주기
		public int getCurrentUserMemIdx(String mem_name) {
		    return mapper.getMemIdxByMemName(mem_name);
		}

		// 회원이름 가져오기
		public MemberVO memName(String sId) {
			
			return mapper.getMemName(sId);
		}
		
		// 1:1 문의게시판 로그인 상태 idx 넘겨주기
		public String getMemNameByIdx(int mem_idx) {
			// TODO Auto-generated method stub
			return mapper.getMemNameByMemIdx(mem_idx);
		}
		
	
		// 회원 목록 조회
		public List<Map<String, Object>> memList(Map<String, Object> map) {
			PageInfo pageInfo = null;
			if(map.get("pageInfo") != null) {			
				pageInfo = (PageInfo)map.get("pageInfo");
				map.put("pageItemStart", pageInfo.getNowPage() * pageInfo.getPageListLimit());
			}
			
			return mapper.selectMemList(pageInfo,map);
		}
		
		// 로그인된 회원 아이디 조회
		public MemberVO getMemberInfoById(String mem_id) {
			return mapper.getMemberInfoById(mem_id);
		}

		// 카카오 로그인 액세스 토큰 발급
		public String getKakaoAccessToken(String code) {
			String accessToken = "";
		    String refreshToken = "";
		    String requestURL = "https://kauth.kakao.com/oauth/token";
		    try {
		        URL url = new URL(requestURL);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		        conn.setRequestMethod("POST");
		        // setDoOutput()은 OutputStream으로 POST 데이터를 넘겨 주겠다는 옵션이다.
		        // POST 요청을 수행하려면 setDoOutput()을 true로 설정한다.
		        conn.setDoOutput(true);

		        // POST 요청에서 필요한 파라미터를 OutputStream을 통해 전송
		        BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		        String sb = "grant_type=authorization_code" +
		                "&client_id=95e47f76b9c01aeee37be0fc58f153e8" + // REST_API_KEY
		                "&redirect_uri=http://localhost:8080/project_gabolcar/kakaoLogin" + // REDIRECT_URI
		                "&code=" + code;
		        bufferedWriter.write(sb);
		        bufferedWriter.flush();

		        int responseCode = conn.getResponseCode();
		        System.out.println("responseCode : " + responseCode);

		        // 요청을 통해 얻은 데이터를 InputStreamReader을 통해 읽어 오기
		        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String line = "";
		        StringBuilder result = new StringBuilder();

		        while ((line = bufferedReader.readLine()) != null) {
		            result.append(line);
		        }
		        System.out.println("response body : " + result);
		        JsonParser jsonParser = new JsonParser();
		        JsonElement element = jsonParser.parse(result.toString());

		        accessToken = element.getAsJsonObject().get("access_token").getAsString();
		        refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();

		        System.out.println("accessToken : " + accessToken);
		        System.out.println("refreshToken : " + refreshToken);

		        bufferedReader.close();
		        bufferedWriter.close();
		    } catch (IOException e) {
		        e.printStackTrace();
		    }

		    return accessToken;
		}

		// 액세스토큰을 통한 카카오 사용자정보 받아오기
		public Map<String, Object> getUserInfo(String accessToken) {
			Map<String, Object> userInfo = new HashMap<>();
		    String postURL = "https://kapi.kakao.com/v2/user/me";

		    try {
		        URL url = new URL(postURL);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("POST");

		        conn.setRequestProperty("Authorization", "Bearer " + accessToken);

		        int responseCode = conn.getResponseCode();
		        System.out.println("responseCode : " + responseCode);

		        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        String line = "";
		        StringBuilder result = new StringBuilder();

		        while ((line = br.readLine()) != null) {
		            result.append(line);
		        }
		        System.out.println("response body : " + result);

		        JsonParser jsonParser = new JsonParser();
		        JsonElement element = jsonParser.parse(result.toString());
//		        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
		        JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

//		        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
		        String email = kakaoAccount.getAsJsonObject().get("email").getAsString();
//		        String mtel = kakaoAccount.getAsJsonObject().get("phone_number").getAsString();

//		        userInfo.put("nickname", nickname);
		        userInfo.put("email", email);

		    } catch (IOException exception) {
		        exception.printStackTrace();
		    }

		    return userInfo;
		}
			

		// ======== 0628 배경인 추가 =======
		// 네이버 로그인 회원 조회
		public Map<String,Object> getUserInfoNaver(HttpServletRequest request, String clientId, String clientSecret){
			
			// 토큰 받아오기
			Map<String, Object> resultMap = new HashMap<>();
		    String code = request.getParameter("code");
		    String state = request.getParameter("state");
		    String redirectURI = "";
		    try {		    	
		    	redirectURI = URLEncoder.encode("http://localhost:8089/project_gabolcar/login/oauth2/code/naver", "UTF-8");
		    }
		    catch(Exception e) {
		    	System.out.println(e);
		    	return null;
		    }
		    String apiURL;
		    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		    apiURL += "client_id=" + clientId;
		    apiURL += "&client_secret=" + clientSecret;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&code=" + code;
		    apiURL += "&state=" + state;
		    String access_token = "";
		    String refresh_token = "";
		    System.out.println("apiURL="+apiURL);
		    try {
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		      System.out.print("responseCode="+responseCode);
		      if(responseCode==200) { // 정상 호출
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // 에러 발생
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      if(responseCode==200) {
		    	  // 토큰 받아왔으면 로그인 정보 받아오기
		    	  // json 분리
		    	  JsonParser parsing = new JsonParser();
		    	  JsonElement jsonObj = parsing.parse(res.toString());
		    	  
		    	  // 정보 받기위한 토큰 셋팅
		    	  Map<String, String> setTokenMap =  new HashMap<>();
		    	  setTokenMap.put("Authorization", "Bearer "+ jget(jsonObj,"access_token"));
		    	  JsonElement infoObj = parsing.parse(getNaverLoginInfo("https://openapi.naver.com/v1/nid/me",setTokenMap));
		    	  // 해당 Json 에서 response 만 가져오기
		    	  JsonElement responseObj = infoObj.getAsJsonObject().get("response");
		    	  
		    	  resultMap.put("id",jget(responseObj,"id"));
		    	  resultMap.put("email",jget(responseObj,"email"));
		    	  resultMap.put("gender",jget(responseObj,"gender"));
		    	  resultMap.put("mobile",jget(responseObj,"mobile"));
		    	  resultMap.put("name",jget(responseObj,"name"));
		    	  resultMap.put("birthday",jget(responseObj,"birthday"));
		    	  resultMap.put("birthyear",jget(responseObj,"birthyear"));
		    	  System.out.println(resultMap);
		      }
		    } catch (Exception e) {
		      System.out.println(e);
		      return null;
		    }
		    return resultMap;
		}
		
		// getUserInfoNaver() 에서 받은 토큰값을 토대로 info 찾기 
	    private String getNaverLoginInfo(String apiUrl, Map<String, String> requestHeaders){
	        HttpURLConnection con = connect(apiUrl);
	        try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }


	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	                return readBody(con.getInputStream());
	            } else { // 에러 발생
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API 요청과 응답 실패", e);
	        } finally {
	            con.disconnect();
	        }
	    }
	    
	    private HttpURLConnection connect(String apiUrl){
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	        } catch (IOException e) {
	            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	        }
	    }
	    
	    private String readBody(InputStream body){
	        InputStreamReader streamReader = new InputStreamReader(body);


	        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	            StringBuilder responseBody = new StringBuilder();


	            String line;
	            while ((line = lineReader.readLine()) != null) {
	                responseBody.append(line);
	            }


	            return responseBody.toString();
	        } catch (IOException e) {
	            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
	        }
	    }
	    
	    //============ 네이버 로그인 api 끝 ============
	    
	    public String jget(JsonElement json,String key) {
	    	return json.getAsJsonObject().get(key).getAsString();
	    }
		
}
