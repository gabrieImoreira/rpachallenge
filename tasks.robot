*** Settings ***
Library	SeleniumLibrary

*** Variables ***

*** Keywords ***
Abrir Site
	Open Browser	https://www.rpachallenge.com/  chrome

*** Test Cases ***
Step 1: Open rpachallenge
	Abrir Site
	