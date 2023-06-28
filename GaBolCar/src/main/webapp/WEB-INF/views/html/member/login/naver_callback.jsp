<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
            charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<!-- 네이버 로그인 수정중 -->
callback

  <%
    String clientId = "iyG93Byk9xPFZKJeZAaH";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "0jr6g97yTD";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8089/project_gabolcar/login/oauth2/code/naver", "UTF-8");
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
        out.println(res.toString());
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  %>
<script type="text/javascript">
//     var naver_id_login = new naver_id_login("Client_ID", "http://localhost:8080/login/oauth2/code/naver");
//     // 접근 토큰 값 출력
//     alert(naver_id_login.oauthParams.access_token);
//     // 네이버 사용자 프로필 조회
//     naver_id_login.get_naver_userprofile("naverSignInCallback()");

//     // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
//     function naverSignInCallback() {
//         alert(naver_id_login.getProfileData('email'));
//         alert(naver_id_login.getProfileData('nickname'));
//         alert(naver_id_login.getProfileData('age'));
//         alert(naver_id_login.getProfileData('id'));
//         alert(naver_id_login.getProfileData('birthday'));
//         alert(naver_id_login.getProfileData('gender'));
//         alert(naver_id_login.getProfileData('mobile'));
//     }

</script>
</body>
</html>