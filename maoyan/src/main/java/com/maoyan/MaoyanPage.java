package com.maoyan;

import java.util.List;

public class MaoyanPage {
    //定义当前页数 默认为0
	int curPage=0;
    public List getName1() throws Exception {
		List list = MaoyanDao.getMaoyanList();
		return list;
	}
    
    public List getName2() throws Exception {
		List list = MaoyanDao.getPageMaoyanList(10, 10);
		return list;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		if (curPage<0) {
			this.curPage = 0;
		}else if (curPage>9) {
			this.curPage = 9;
		}else {
			this.curPage = curPage;
		}
	}
    
}
