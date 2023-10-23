import time
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver import FirefoxOptions
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# 1. Manually login
# login_button = WebDriverWait(driver, 20).until(EC.visibility_of_element_located((By.CSS_SELECTOR, "div[data-testid='login-button'][role='button']"))).click()
# login_button.click()
# login_button = WebDriverWait(driver, 20).until(EC.visibility_of_element_located((By.XPATH, "//div[@data-testid='login-button' and text()='Log in']")))
# login_button.click()
# login = driver.find_element(By.NAME, "login")
# login.click()

# driver.implicitly_wait(2)
# email = driver.find_element(By.ID, "username")
# email.send_keys('t.d.t.sijpkens@student.vu.nl' + Keys.ENTER)
# driver.implicitly_wait(2)
# password = driver.find_element(By.ID, "password") # type = password
# password.send_keys

# 2. Access cookie session with login credential with Pickle 
# import pickle
# cookies = pickle.load(open("cookies.pkl", "rb"))
# for cookie in cookies:
#     driver.add_cookie(cookie)

# 3. Use chromedriver
# stay logged in to ChatGPT
#options = Options()
#options.add_argument("user-data-dir=~/config/google-chrome/Default")

# options = webdriver.ChromeOptions()
# options.add_argument("user-data-dir=~/.config/google-chrome")
# options.add_experimental_option("detach", True)

options = Options()
options.add_argument("user-data-dir=home/ohnoyes/config/google-chrome")
driver = webdriver.Chrome(options=options)
# If you're running on a Unix-based operating system, you may need to update the permissions of chromedriver after downloading it in order to make it executable:
#chmod +x chromedriver

driver.get("https://chat.openai.com")

time.sleep(60)
# text_box = driver.find_element(by=By.ID, value="prompt-textarea")
# text_box.send_keys("Hello, how are you feeling?" + Keys.ENTER)

prompt = driver.find_element_by_xpath('//div[@data-slate-editor="true"]')
prompt.send_keys("Hello, ChatGPT!" + Keys.RETURN)

#driver.quit()
