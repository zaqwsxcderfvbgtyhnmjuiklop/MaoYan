from selenium import webdriver
from selenium.webdriver import ActionChains
from selenium.webdriver.common.by import By
import time
import pandas as pd
import os

class maoyanTop100:
    def __init__(self):
        self.driver = webdriver.Chrome("D:\\python\\Python爬虫\\venv\\Lib\\site-packages\\chromedriver.exe")
        self.df1 = pd.DataFrame()

    def a(self):
        self.driver.get("https://www.maoyan.com/board/4")
        time.sleep(3)
        self.c()

    def b(self):
        data = self.driver.find_elements(by=By.XPATH,value='//dl[@class="board-wrapper"]/dd')
        for i in data:
            name = i.find_element(by=By.XPATH,value='.//p[@class="name"]')
            url = name.find_element(by=By.XPATH,value='.//a').get_attribute("href")  # 电影页url
            name = name.text  # 电影名称
            star = i.find_element(by=By.XPATH,value='.//p[@class="star"]').text[3:]  # 主演
            releasetime = i.find_element(by=By.XPATH,value='.//p[@class="releasetime"]').text[5:]  # 上映时间
            score = i.find_element(by=By.XPATH,value='.//p[@class="score"]').text  # 评分
            board_img = i.find_element(by=By.XPATH,value='.//img[@class="board-img"]').get_attribute("data-src")  # 海报图片地址
            if board_img == None:
                board_img = i.find_element(by=By.XPATH, value='.//img[@class="board-img"]').get_attribute("src")

            self.driver.execute_script("window.open('{0}')".format(url))
            time.sleep(3)
            handles = self.driver.window_handles  # 获取所有浏览器窗口的句柄
            self.driver.switch_to.window(handles[-1])  # 切换到最新打开的浏览器
            self.c()

            producer_duration = self.driver.find_elements(by=By.XPATH,value='//li[@class="ellipsis"]')[1]
            synopsis = self.driver.find_element(by=By.XPATH,value='//span[@class="dra"]').text  # 简介
            producer_duration = producer_duration.text.split('/')
            producer = producer_duration[0].replace(" ","")  # 制片国家
            duration = producer_duration[1].replace(" ","")  # 时长
            self.e(e1=name, e2=star, e3=releasetime, e4=score, e5=board_img, e6=producer, e7=duration, e8=synopsis)

            self.driver.close()
            self.driver.switch_to.window(handles[0])

        pager = self.driver.find_elements(by=By.XPATH,value='//ul[@class="list-pager"]/li')[-1]
        if pager.text == "下一页":
            pager.click()
            time.sleep(3)
            self.c()
            self.b()

    def c(self):
        if self.driver.title == '猫眼验证中心':
            self.driver.switch_to.frame('tcaptcha_iframe')
            # 定义拖拽按钮
            element = self.driver.find_element(by=By.XPATH, value='//div[@class="tc-drag-thumb"]')
            # 定义拖拽的位置
            ActionChains(self.driver).drag_and_drop_by_offset(source=element,xoffset=210, yoffset=0).perform()
            element.click()
            time.sleep(3)
            if self.driver.title == '猫眼验证中心':
                self.driver.refresh()
                time.sleep(3)
                self.c()

    def d(self):
        path = './data/'
        if not os.path.exists(path):
            os.mkdir(path)

    def e(self,e1,e2,e3,e4,e5,e6,e7,e8):
        df2 = pd.DataFrame({'电影名称':[e1],'主演':[e2],'上映时间':[e3],'评分':[e4],
                            '海报图片地址':[e5],'制片国家':[e6],'时长':[e7],'简介':[e8]})
        self.df1 = pd.concat([self.df1,df2])

    def f(self):
        self.df1.to_csv('./data/MaoyanMovieNewTop100.csv', encoding='utf-8', index=None)

    def run(self):
        self.a()
        self.b()
        self.d()
        self.f()

if __name__ == '__main__':
    maoyan = maoyanTop100()
    maoyan.run()