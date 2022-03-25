package com.t_train.train.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class TrainService {

	//공공 데이터 REST API 요청 
	public String xml_list(StringBuilder url) throws Exception {
		String result = url.toString();
		
		try {
				HttpURLConnection con = (HttpURLConnection)new URL(result).openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("content-type", "application/json");
				BufferedReader rd;
			if(con.getResponseCode() >= 200 && con.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
			}else {
				rd = new BufferedReader(new InputStreamReader(con.getErrorStream(), "utf-8"));
			}
		StringBuilder sb = new StringBuilder();
		String line;
		while((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		con.disconnect();
				result = sb.toString();
				log.info("result : " + result);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			log.info(e.getMessage());
		}
		return result;
	}
	
	//JSON
	public String json_list(StringBuilder url) throws Exception {
		JSONObject json = null;
		
		try {
			json = (JSONObject) new JSONParser().parse(xml_list(url));
			json = (JSONObject) json.get("response");
			json = (JSONObject) json.get("body");
			int count = json.get("totalCount") == null ? 0 : Integer.parseInt(json.get("totalCount").toString());
			
			if(json.get("items") instanceof JSONObject) {
				json = (JSONObject) json.get("items");
			}
			json.put("count", count);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return json.toJSONString();
	}
}
