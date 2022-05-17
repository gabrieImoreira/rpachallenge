*** Settings ***
Documentation       Template keyword resource.
Variables           MyVariables.py
Resource    variables.robot
Library    RPA.Browser    auto_close=${FALSE}

*** Keywords ***
Download Spreadsheet
    Open Available Browser    ${URL_RPACHALLENGE}

