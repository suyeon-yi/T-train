package com.t_train.train;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.ui.Model;

import com.google.gson.JsonArray;
import com.t_train.train.vo.TrainIdAndNameVO;

import java.io.BufferedReader;

public class ApiExplorer {
	
	
	
    @SuppressWarnings("null")
	public static void main(String[] args) throws Exception {
    	
    	TrainIdAndNameVO nameVO = new TrainIdAndNameVO();
    	
    	//1. URL을 만들기 위한 StringBuilder
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo"); /*URL*/
        //2. 오픈 API의 요청 규격에 맞는 파라미터 생성, 발급받은 인증키
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=Jxwqcdkk560ifanyQyzs7RdyYjABCow9oOnsYt%2FaIgqOOdfpS615bY%2B4AvnnC5l7qtPQERSgw30wZtL6%2FP%2Fm%2BA%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*데이터 타입(xml, json)*/
        urlBuilder.append("&" + URLEncoder.encode("depPlaceId","UTF-8") + "=" + URLEncoder.encode(nameVO.getNodename(), "UTF-8")); /*출발기차역ID [상세기능3. 시/도별 기차역 목록조회]에서 조회 가능*/
        urlBuilder.append("&" + URLEncoder.encode("arrPlaceId","UTF-8") + "=" + URLEncoder.encode(nameVO.getNodename(), "UTF-8")); /*도착기차역ID [상세기능3. 시/도별 기차역 목록조회]에서 조회 가능*/
        urlBuilder.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode("20211201", "UTF-8")); /*출발일(YYYYMMDD)*/
        urlBuilder.append("&" + URLEncoder.encode("trainGradeCode","UTF-8") + "=" + URLEncoder.encode("00", "UTF-8")); /*차량종류코드*/
        //3. URL 객체 생성
        URL url = new URL(urlBuilder.toString());
        //4. 요청하고자 하는 URL과 통신하기 위한 Connection 객체 생성
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        //5. 통신을 위하 메소드 SET
        conn.setRequestMethod("GET");
        //6. 통신을 위한 Content-type SET
        conn.setRequestProperty("Content-type", "application/json");
        //7. 통신 응답 코드 확인
        System.out.println("Response code: " + conn.getResponseCode());
        //8. 전달받은 데이터를 BufferedReader 객체로 저장
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        //9. 저장된 데이터를 라인별로 읽어 StringBuilder 객체로 저장
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        //10. 객체 해제
        rd.close();
        conn.disconnect();
        //11. 전달받은 데이터 확인
        System.out.println(sb.toString());
        
        //JSON형태로 변환
        //12. 문자열 형태의 JSON을 파싱하기 위한 JSONParser 객체 생성
        JSONParser parser = new JSONParser();
        //13. 문자열을 JSON 형태로 JSONObject 객체에 저장
        JSONObject obj = (JSONObject) parser.parse(sb.toString());
        //14. 필요한 리스트 데이터 부분만 가져와 JsonArray로 저장
        JsonArray dataArr = (JsonArray) obj.get("data");
        //4. model에 담아준다
        Model model = null;
        model.addAttribute("data", dataArr);
    }
}