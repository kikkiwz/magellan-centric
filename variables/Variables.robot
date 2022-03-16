*** Settings ***
Resource    ../variables/Variables_Request.robot   
Resource    ../variables/Variables_Datetime.robot 
Resource    ../variables/Variables_Data.robot
Resource    ../variables/Variables_Log.robot 
Resource    ../variables/Variables_Centric.robot 
Resource    ../variables/Variables_MongoDB.robot 



*** Variables ***
${timeout}    0.5 second
${delay}    0.3
${retry}    5x   
${retry_interval}    5s
