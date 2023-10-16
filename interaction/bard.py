from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

options = webdriver.ChromeOptions()
options.add_argument("user-data-dir=~/.config/google-chrome")
options.add_experimental_option("detach", True)

driver = webdriver.Chrome(options)
driver.get("https://bard.google.com/chat")

prompt_box = driver.find_element(By.NAME, 'p')

prompts = []
with open('generation.txt') as g:
    prompts = g.readlines()

for prompt in prompts:
    print(prompt)

#send prompt 
prompt_box.send_keys('What is the sum of all its parts?' + Keys.RETURN)

