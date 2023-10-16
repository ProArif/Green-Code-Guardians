from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By

# driver = webdriver.Firefox()
driver = webdriver.Chrome()
driver.get("https://www.selenium.dev/selenium/web/web-form.html")
#driver.get("https://chat.openai.com")
title = driver.title

# Waiting strategy: needs to be changed.
driver.implicitly_wait(0.5)

text_box = driver.find_element(by=By.NAME, value="my-text")
submit_button = driver.find_element(By.CSS_SELECTOR, value="button")

text_box.send_keys("Selenium")
submit_button.click()