*** Settings ***
Documentation       Template robot main suite.

Library             Collections
Library             MyLibrary
Resource            keywords.robot
Variables           MyVariables.py


*** Tasks ***
Complete RPA challenge
    Download Spreadsheet
    ${table}=    Get table from Excel
    Start, Fill and Submit form    ${table}
    End Task
