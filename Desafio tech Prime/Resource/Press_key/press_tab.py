import pyautogui
import time
from validate_docbr import CPF


def create_cpf_validator():
    return CPF()


def click_element_with_timeout(locator_type, locator_value):
        if not self.driver:
            raise Exception("Selenium instance not set!")
        
        by = None
        if locator_type.lower() == "id":
            by = By.ID
        elif locator_type.lower() == "xpath":
            by = By.XPATH
        # ... Adicione outras condições para diferentes tipos de localizadores

        try:
            element = WebDriverWait(self.driver, self.timeout).until(
                EC.element_to_be_clickable((by, locator_value))
            )
            element.click()
        except TimeoutException:
            raise Exception(f"Element {locator_value} was not clickable after {self.timeout} seconds.")


def upload_file():
    time.sleep(2)
    file_path = "C:\\Users\\bruno\\OneDrive\\Imagens"
    pyautogui.press('enter')
    pyautogui.press('tab')
    time.sleep(2)
    pyautogui.press('tab')
    time.sleep(2)
    pyautogui.press('tab')
    time.sleep(2)
    pyautogui.press('tab')
    time.sleep(2)
    pyautogui.press('tab')
    time.sleep(2)
    pyautogui.press('enter')
    time.sleep(2)
    pyautogui.write(file_path)
    time.sleep(2)    
    pyautogui.press('enter')
    time.sleep(2)    
    pyautogui.press('tab')
    time.sleep(2)
    pyautogui.press('tab')
    time.sleep(2)
    pyautogui.press('tab')
    time.sleep(2)
    pyautogui.press('tab')
    time.sleep(2)
    pyautogui.press('tab')
    time.sleep(2)
    pyautogui.write('teste.txt')
    time.sleep(2)
    pyautogui.press('enter')



def press_tab_key():
    pyautogui.press('tab')

def press_enter_key():
    pyautogui.press('enter')

def press_down_arrow_key():
    pyautogui.press('down')

def press_down_arrow_key_2():
    pyautogui.press('down')
    pyautogui.press('down')

def press_down_arrow_key_3():
    pyautogui.press('down')
    pyautogui.press('down')
    pyautogui.press('down')

def press_a_key():
    pyautogui.press('a')

def press_b_key():
    pyautogui.press('b')

def press_c_key():
    pyautogui.press('o')

def type_text(text_to_type):
    pyautogui.write(text_to_type)

def press_backspace_key():
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')
    pyautogui.press('backspace')