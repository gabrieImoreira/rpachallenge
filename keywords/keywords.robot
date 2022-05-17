*** Settings ***
Documentation       Template keyword resource.
Variables           MyVariables.py
Resource    variables.robot
Library    RPA.Browser.Selenium    auto_close=${FALSE}
Library    RPA.HTTP
Library    RPA.Excel.Application
Library    RPA.FileSystem

*** Keywords ***
Download Spreadsheet
    Open Available Browser    ${URL_RPACHALLENGE}
    Download  ${URL_DOWN_EXCEL}    overwrite=True
    Move File    challenge.xlsx    input/challenge.xlsx    overwrite=True

Start, Fill and Submit form
    Click Button    Start

Get table from Excel
    Open Workbook    challenge.xlsx
