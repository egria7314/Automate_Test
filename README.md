# Automate_Test

## Project Overview

There are 2 testcases for automation located in `test` folder.

Scenario: Add a user and validate the user has been added to the table

Scenario: Delete user User Name: novak and validate user has been deleted

## Project Structure
```
├── libs
│ └── common.robot 
├── pylibs
│ └── CustomLibrary.py 
├── test
│ └── tc_add_user_and_validate.robot
| └── tc_delete_user_and_validate.robot
├── README.md
├── chromedriver.exe
├── poetry.lock
├── pyproject.toml

```

## Prerequisites

We have following dependencies:

- Python (version 3.11)
- robotframework (version 7.0.1)
- selenium (version 4.23.1)
- robotframework-seleniumlibrary (version 6.5.0)

But don't worry about the dependency installation, we already listed in the `pyproject.toml`.

We also need chromedriver for testing

- ChromeDriver for Google Chrome (version 127.0.6533.72)

You can find other ChromeDriver version [here](https://googlechromelabs.github.io/chrome-for-testing/#stable)

## Poetry Installation

Poetry is a tool for dependency management and packaging in Python. It allows you to declare the libraries your project depends on and it will manage (install/update) them for you.

You can find the install instructions for poetry [here](https://python-poetry.org/docs/#installing-with-the-official-installer)

## Running the Tests
```
git clone https://github.com/egria7314/Automate_Test.git
cd Automate_Test
git switch danny_lai_challenge
poetry install
poetry env use python
poetry run robot .\test
```

## Generate the Report

After running, you can see the test results by `report.html`.
