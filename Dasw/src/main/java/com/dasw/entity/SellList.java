package com.dasw.entity;

import java.util.List;

public class SellList {
	
	private List<Sell> sell;

	public List<Sell> getSell() {
		return sell;
	}

	public void setSell(List<Sell> sell) {
		this.sell = sell;
	}

	@Override
	public String toString() {
		return "SellList [sell=" + sell + "]";
	}
	
	
}
