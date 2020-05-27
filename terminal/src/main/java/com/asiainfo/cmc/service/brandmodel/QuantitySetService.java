package com.asiainfo.cmc.service.brandmodel;

import java.text.ParseException;
import java.util.Map;

public interface QuantitySetService {

	
	
	public Map showAll(String brand,String spec,
			String COMPETBRANDNAME1,String COMPETSPEC1,
			String COMPETBRANDNAME2,String COMPETSPEC2) throws ParseException;
	
	public Map showAllLi(String brand,String spec,
			String COMPETBRANDNAME1,String COMPETSPEC1,
			String COMPETBRANDNAME2,String COMPETSPEC2) throws ParseException;



   public Map showAllprice(String brand,String spec,
		String COMPETBRANDNAME1,String COMPETSPEC1,
		String COMPETBRANDNAME2,String COMPETSPEC2) throws ParseException;

   public Map showAllcover(String brand,String spec,
			String COMPETBRANDNAME1,String COMPETSPEC1,
			String COMPETBRANDNAME2,String COMPETSPEC2) throws ParseException;

   public Map showAllstock(String brand,String spec,
			String COMPETBRANDNAME1,String COMPETSPEC1,
			String COMPETBRANDNAME2,String COMPETSPEC2) throws ParseException;

   public Map showAllshare(String brand,String spec,
			String COMPETBRANDNAME1,String COMPETSPEC1,
			String COMPETBRANDNAME2,String COMPETSPEC2) throws ParseException;

   public Map showAllorder(String brand,String spec,
			String COMPETBRANDNAME1,String COMPETSPEC1,
			String COMPETBRANDNAME2,String COMPETSPEC2) throws ParseException;

   public Map showAllincome(String brand,String spec,
			String COMPETBRANDNAME1,String COMPETSPEC1,
			String COMPETBRANDNAME2,String COMPETSPEC2) throws ParseException;



}