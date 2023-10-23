from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time

driver = webdriver.Chrome()
driver.get("https://www.llama2.ai/")

prompt_box = driver.find_element(by = By.NAME, value = "prompt")

#send prompt 
prompts = []
with open('../input/generation.txt') as g:
    prompts = g.readlines()

for prompt in prompts:
    print(prompt)
    prompt_box.send_keys(prompt + Keys.RETURN)
    time.sleep(20) # 20 seconds per prompt

driver.quit()