package com.t_train.train.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestTrainController {

	@GetMapping("/apitest")
	public String callApiXml() {
		StringBuffer result = new StringBuffer();
		try {
			String apiUrl = "http://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo?"
					+ "serviceKey=Jxwqcdkk560ifanyQyzs7RdyYjABCow9oOnsYt%2FaIgqOOdfpS615bY%2B4AvnnC5l7qtPQERSgw30wZtL6%2FP%2Fm%2BA%3D%3D"
					+ "&depPlaceId=NAT010000"
					+ "&arrPlaceId=NAT011668"
					+ "&depPlandTime=20211201"
					+ "&trainGradeCode=00"
					+ "&numOfRows=10"
					+ "&pageNo=1"
					+ "&_type=xml";
			URL url = new URL(apiUrl);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
			urlConnection.setRequestMethod("GET");
			
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "utf-8"));
			
			String returnLine;
			result.append("<xmp>");
			while((returnLine = bufferedReader.readLine()) != null) {
				result.append(returnLine + "\n");
			}
			urlConnection.disconnect();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result + "</xmp>";
	}
	
	public String callApiJson() {
		StringBuffer result = new StringBuffer();
		String jsonPrintSpring = null;
		try {
			String apiurl = "http://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo?"
					+ "serviceKey=Jxwqcdkk560ifanyQyzs7RdyYjABCow9oOnsYt%2FaIgqOOdfpS615bY%2B4AvnnC5l7qtPQERSgw30wZtL6%2FP%2Fm%2BA%3D%3D"
					+ "&depPlaceId=NAT010000"
					+ "&arrPlaceId=NAT011668"
					+ "&depPlandTime=20211201"
					+ "&trainGradeCode=00"
					+ "&numOfRows=10"
					+ "&pageNo=1"
					+ "&_type=json";
			URL url = new URL(apiurl);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
			urlConnection.connect();
			BufferedInputStream bufferedInputStream = new BufferedInputStream(urlConnection.getInputStream());
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(bufferedInputStream, "utf-8"));
			String returnLine;
			while((returnLine = bufferedReader.readLine()) != null) {
				result.append(returnLine);
			}
			
			JSONObject jsonObject = XML.toJSONObject(result.toString());
			jsonPrintSpring = jsonObject.toString();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return jsonPrintSpring;
		
			
			
	}
}
