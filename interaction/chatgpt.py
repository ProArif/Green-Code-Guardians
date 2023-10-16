import pickle
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC



# stay logged in to ChatGPT
#options = Options()
#options.add_argument("user-data-dir=~/config/google-chrome/Default")
options = webdriver.ChromeOptions()
options.add_argument("user-data-dir=~/.config/google-chrome")
options.add_experimental_option("detach", True)

driver = webdriver.Chrome(executable_path='/chromedriver_linux64/chromedriver', options = options) # If you're running on a Unix-based operating system, you may need to update the permissions of chromedriver after downloading it in order to make it executable:
        #chmod +x chromedriver

# cookies = pickle.load(open("cookies.pkl", "rb"))
# for cookie in cookies:
#     driver.add_cookie(cookie)

driver.get("https://chat.openai.com")




# Login
#login_button = WebDriverWait(driver, 20).until(EC.visibility_of_element_located((By.CSS_SELECTOR, "div[data-testid='login-button'][role='button']"))).click()
#login_button.click()
# login_button = WebDriverWait(driver, 20).until(EC.visibility_of_element_located((By.XPATH, "//div[@data-testid='login-button' and text()='Log in']")))
# login_button.click()
# login = driver.find_element(By.NAME, "login")
# login.click()

# driver.implicitly_wait(2)
# email = driver.find_element(By.ID, "username")
# email.send_keys('t.d.t.sijpkens@student.vu.nl' + Keys.ENTER)
# driver.implicitly_wait(2)
# password = driver.find_element(By.ID, "password") # type = password
# password.send_keys("VUAmsterdam2023" + Keys.ENTER)

driver.implicitly_wait(2)
text_box = driver.find_element(by=By.ID, value="prompt-textarea")

# enter_prompt = driver.find_element(by=By.CSS_SELECTOR, value="button")

# TODO: loop through prompts here
text_box.send_keys("Hello, how are you feeling?" + Keys.ENTER) 
# enter_prompt.click()

# driver.quit()
