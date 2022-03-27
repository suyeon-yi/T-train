package com.t_train.train;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.t_train.train.vo.CityCodeVO;
import com.t_train.train.vo.TrainIdAndNameVO;
import com.t_train.train.vo.TrainVO;


public class TrainApi {

	private static String serviceKey = "Jxwqcdkk560ifanyQyzs7RdyYjABCow9oOnsYt%2FaIgqOOdfpS615bY%2B4AvnnC5l7qtPQERSgw30wZtL6%2FP%2Fm%2BA%3D%3D";
	
	 public static void cityCode(String[] args) throws IOException {
	        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/TrainInfoService/getCtyCodeList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + serviceKey); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*데이터 타입(xml, json)*/
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
	 }	
	 
	 public static void trainIdAndName(String[] args, CityCodeVO vo) throws IOException {
	        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/TrainInfoService/getCtyAcctoTrainSttnList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + serviceKey); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*데이터 타입(xml, json)*/
	        
	        String code = "cityCode";
	        String value = vo.getCityname();
	        
	        urlBuilder.append("&" + URLEncoder.encode(code,"UTF-8") + "=" + URLEncoder.encode(value, "UTF-8")); /*시/도 ID*/
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
	 }
	 
	 public static void main(String[] args) throws IOException {
	    	
	    	TrainIdAndNameVO nameVO = new TrainIdAndNameVO();
	    	TrainVO trainVO = new TrainVO();
	    	
	    	//1. URL을 만들기 위한 StringBuilder
	        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo"); /*URL*/
	        //2. 오픈 API의 요청 규격에 맞는 파라미터 생성, 발급받은 인증키
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + serviceKey); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*데이터 타입(xml, json)*/
	        
	        String key1 = "depPlaceId";
	        String val1 = trainVO.getDepPlaceId();
	        
	        urlBuilder.append("&" + URLEncoder.encode(key1,"UTF-8") + "=" + URLEncoder.encode(val1, "UTF-8")); /*출발기차역ID [상세기능3. 시/도별 기차역 목록조회]에서 조회 가능*/
	        
	        String key2 = "arrPlaceId";
	        String val2 = trainVO.getArrPlaceId();
	        
	        urlBuilder.append("&" + URLEncoder.encode(key2,"UTF-8") + "=" + URLEncoder.encode(val2, "UTF-8")); /*도착기차역ID [상세기능3. 시/도별 기차역 목록조회]에서 조회 가능*/
	        
	        String key3 = "depPlandTime";
	        String val3 = trainVO.getDepplandtime();
	        
	        urlBuilder.append("&" + URLEncoder.encode(key3,"UTF-8") + "=" + URLEncoder.encode(val3, "UTF-8")); /*출발일(YYYYMMDD)*/
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
	 }
	 
	 public ArrayList<TrainVO> getTrainList(String key1, String key2, String key3) throws IOException, ParserConfigurationException, SAXException {
		 ArrayList<TrainVO> list = new ArrayList<TrainVO>();
		 return list;
	 }
}
	 
