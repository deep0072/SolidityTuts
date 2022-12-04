# SolidityTuts

# Errors

## error handling are moslty done to prevent the uneceesary use of gas. means refund of gas, any variable that is updated will be reverted

## error handling done using require, assert, revert

### require ==> it is mostly used to validate the user inputs and for access control who gets to call the function

## require used where we get input from outside world, user or from other function.

## in case of require when some error thrown then whatever gas cossumed will be gone but remaining will be given to user

![image](https://user-images.githubusercontent.com/46425800/170763867-672e473e-377f-4eda-958d-fdb9c432ab58.png)

### revert ==> it is also does same thing as require but it is mostly used to prefer in nested condtions.

![image](https://user-images.githubusercontent.com/46425800/170763999-a4c8bd56-b029-4896-84d1-f4393675bb8f.png)

### assert ==> it will be always used to check for conditions that should always be true. these are used only for internal checking

### not used for user input. in case of error it will consume gas will not revert back to user so it should use only for internal checks

![image](https://user-images.githubusercontent.com/46425800/170764125-f739ef1b-bbbb-4d57-a5ce-6b47491dc1a3.png)

# 3 ways to send ether

## transfer ==> ### use 2308 gas, if trasfer fail for some reason then whole function fails.

### trasfer will be useful there when hacker try to call trasfer again and again then it will fail because it will cross 2300 gas. so it stops transfer

## send ==> ### use 2300 gas, returns bool in case of successful trasaction or not.

## call - ### all gas, returns bool and data. can use custom gas value

# fallback and recieve inbuilt function

### fallback ==> must have external visibility, and payable

### fallback function always receives data, but in order to also receive Ether it must be marked payable.

### If the version with parameters is used, input will contain the full data sent to the contract (equal to msg.data) and can return data in output

### receive ==> must have external visibility, and payable

### but in order to also receive Ether it must be marked payable
