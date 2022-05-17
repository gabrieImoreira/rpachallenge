*** Settings ***
Documentation       Template keyword resource.
Variables           MyVariables.py
Resource    variables.robot
Library    RPA.Browser.Selenium    auto_close=${FALSE}
Library    RPA.HTTP

*** Keywords ***
Download Spreadsheet
    Open Available Browser    ${URL_RPACHALLENGE}
    Download  ${URL_DOWN_EXCEL}    overwrite=True

