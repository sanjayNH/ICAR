# ICAR Backend API

Serverless AWS Lambda and API Gateway for the ICAR mobile sales application.


## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.


### Prerequisites

You will need AWS Api keys for the ICAR AWS account before you will be able to work on the project.

The following applications and tools will need to be installed to run the application code on your dev machine:

1. [Docker for Windows](https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe) used to host development runtime environmnt.
1. [Visual Studio Code](https://code.visualstudio.com/download) used for code editing and debugging
1. [Postman](https://www.getpostman.com/) for executing api calls against dev environment
1. [AWS CLI](http://docs.aws.amazon.com/cli/latest/userguide/awscli-install-windows.html#install-msi-on-windows) to interact with AWS local and remote resources.
1. [Node 6.1.0](https://nodejs.org/en/blog/release/v6.1.0/) (scroll about halfway down to find installer links) required for lambda and aws sam local

Open an elevated(Run as Administrator) powershell session and execute the following command:

Configure AWS cli credential:
```
aws configure
```
Enable powershell script execution
```
Set-ExecutionPolicy Bypass -Scope CurrentUser
```
Install AWS SAM Local (used to run simulated AWS environment locally)
```
npm install -g aws-sam-local
```

### Running Code and Debugging

Clone this repository and open the root folder in Visual Studio Code.

Open the integrated terminal (ctrl+`) in vscode and execute the following commands:

Build docker environment and run SAM Local
```
.\scripts\start.ps1 
```

The application is running when you see the following:
>>You can now browse to the above endpoints to invoke your functions.
You do not need to restart/reload SAM CLI while working on your functions,
changes will be reflected instantly/automatically. You only need to restart
SAM CLI if you update your AWS SAM template.

If you wish to debug execute the following command instead
```
.\scripts\start.ps1 debug
```
you can now hit F5 in visual studio code and your code will break when functions are executed.

### Testing with Postman

1. Open Postman and import the following files:
```
db/tests/Postman/icar-samlocal.postman_environment
db/tests/Postman/ICAR.postman_collection
```
2. Select the icar-samlocal environment 
3. Select the ICAR collection and run the stubbed out requests under the Auth folder.
