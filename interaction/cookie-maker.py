import pickle
import time
from selenium import webdriver

browser = webdriver.Chrome()
browser.get("https://chat.openai.com")
# browser.get("https://bard.google.com/chat")
time.sleep(5000)
pickle.dump(browser.get_cookies(), open("cookies.pkl", "wb"))