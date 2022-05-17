*** Settings ***
Documentation       Template keyword resource.
Variables           MyVariables.py
Resource    variables.robot
Library    RPA.Browser.Selenium    auto_close=${FALSE}
Library    RPA.HTTP
Library    RPA.FileSystem
Library    RPA.Excel.Files

*** Keywords ***
Download Spreadsheet
    Open Available Browser    ${URL_RPACHALLENGE}
    Download  ${URL_DOWN_EXCEL}    overwrite=True
    Move File    challenge.xlsx    input/challenge.xlsx    overwrite=True

Get table from Excel
    Open Workbook    input/challenge.xlsx
    ${table}=    Read Worksheet As Table    header=True
    Close Workbook
    RETURN    ${table}

Start, Fill and Submit form
    Click Button    Start


