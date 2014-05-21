Technical Test
==============

##Rules

This is a simple Sinatra app which interacts with Workshare API. The rules for calculating gravity are as following:

* Gravity is equal to the file weight in MB multiplied by the gravity factor
* Gravity factor is 1.1 for Documents, 1.4 for Videos, 1.2 for Songs, 1 for  any other file types, with the results roundedup to the upper 0.05. 
* A fixed gravity of 100 is added to Text files.

#Set up

To run locally, save a file called config.yml to the root folder with the following content:
```yml
api_key: 'your Workshare API Key'
```

Alternatively store the API key as an ENV variable called WS_KEY. For the test suit to run, add your Workshare credentials to the config.yml file:

```yml
api_key: 'your Workshare API Key'
ws_email: 'your.workshare@email.com'
ws_password: 'yourworksharepassword'
```

## Usage

From the console:

```
$ shotgun
```

Then navigate to http://localhost:9393/

Alternatively, the app is available on Heroku: http://gravity-test.herokuapp.com/

## Assumptions
* Users only want to see the gravity report, nothing else.
* Users don't want their Workshare to be stored on the app.
* This is a one-time service and we do not need to store the data on all of the users who have logged in.

## Next Steps
Relaxing any of the above assumptions there is a lot of functionality one can add to the app, including database storage, statistics, user profiles etc.

