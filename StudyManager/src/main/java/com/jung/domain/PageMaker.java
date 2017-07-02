package com.jung.domain;

public class PageMaker {
	private int count;
	private int pageNum;
	private int pageCount;
	private int pageBlock;
	private int startPage;
	private int endPage;
	private int pageSize;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageNum() {
		return pageNum;
	}
	
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		calData();
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	private void calData(){
		pageCount = count/pageSize+(count%pageSize==0?0:1);
		startPage = ((pageNum-1)/pageBlock) * pageBlock+1;
		endPage = startPage + pageBlock-1;
		if(endPage > pageCount){
			endPage = pageCount;
		}
	}

}
