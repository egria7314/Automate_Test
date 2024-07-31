from selenium.webdriver.common.by import By
from robot.libraries.BuiltIn import BuiltIn
from SeleniumLibrary import SeleniumLibrary


def retrieve_texts_from_each_row(rows_xpath, cells_xpath):
    seleniumlib = BuiltIn().get_library_instance("SeleniumLibrary")
    driver = seleniumlib.driver
    rows = driver.find_elements(By.XPATH, rows_xpath)
    all_texts = []
    for row in rows:
        cells = row.find_elements(By.XPATH, cells_xpath)
        texts = [cell.text for cell in cells]
        all_texts.append(texts)
    print(f"All texts: {all_texts}")
    return all_texts


def click_button_by_index(index, xpath):
    seleniumlib = BuiltIn().get_library_instance("SeleniumLibrary")
    driver = seleniumlib.driver
    buttons = driver.find_elements(By.XPATH, xpath)
    if int(index) < 1 or int(index) > len(buttons):
        raise IndexError(f"Index {index} is out of range for buttons list.")
    buttons[int(index) - 1].click()


def get_row_index_from_table(table, row_data):
    for i in range(len(table)):
        if row_data == table[i]:
            return i + 1
    return None