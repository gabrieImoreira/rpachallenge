*** Settings ***
Documentation       Template keyword resource.
Variables           MyVariables.py
Resource    variables.robot
Library    RPA.Browser.Selenium    auto_close=${TRUE}
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
    [Arguments]    ${table}
    Click Button    Start
    FOR    ${person}    IN    @{table}
        Set value by XPath    //input[@ng-reflect-name="labelFirstName"]    ${person}[First Name]
        Set Value By XPath    //input[@ng-reflect-name="labelLastName"]    ${person}[Last Name]
        Set Value By XPath    //input[@ng-reflect-name="labelCompanyName"]    ${person}[Company Name]
        Set Value By XPath    //input[@ng-reflect-name="labelRole"]    ${person}[Role in Company]
        Set Value By XPath    //input[@ng-reflect-name="labelAddress"]    ${person}[Address]
        Set Value By XPath    //input[@ng-reflect-name="labelEmail"]    ${person}[Email]
        Set Value By XPath    //input[@ng-reflect-name="labelPhone"]    ${person}[Phone Number]
        Click Button    Submit
    END
    
Set value by XPath
    [Arguments]    ${xpath}    ${value}
    ${result}=
    ...    Execute Javascript
    ...    document.evaluate('${xpath}',document.body,null,9,null).singleNodeValue.value='${value}';
    RETURN    ${result}

End Task
    Capture Element Screenshot    css:div.congratulations
    Log    finished bot!