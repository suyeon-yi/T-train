package com.t_train.train;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.ui.Model;

import com.google.gson.JsonArray;
import com.t_train.train.vo.CityCodeVO;

public class TrainIdAndName {

	@SuppressWarnings("null")
	 public static void main(String[] args, CityCodeVO vo) throws Exception {
	        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/TrainInfoService/getCtyAcctoTrainSttnList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=서비스키"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*데이터 타입(xml, json)*/
	        urlBuilder.append("&" + URLEncoder.encode("cityCode","UTF-8") + "=" + URLEncoder.encode(vo.getCityname(), "UTF-8")); /*시/도 ID*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
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
