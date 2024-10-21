package com.example.demo.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.MemberMapper;

import jakarta.servlet.http.HttpServletRequest;

//필수
@Service

public class TempService {
	
		public void m(HttpServletRequest request,HashMap<String,Object> map) {
			
		}
		
		@Autowired
		private MemberMapper mapper;
		
		
		private final MemberMapper mapper2;
		public TempService(MemberMapper mapper2) {
			this.mapper2=mapper2;
		}
	

}
