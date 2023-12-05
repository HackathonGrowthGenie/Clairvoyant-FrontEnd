# Flutter clairvoyant hackathon Dashboard

--------------------------------------------------------


This Repository contains the front end application of the wealth management app covering both theme 1 and theme 2.

Application adheres to SOLID design principles in compliance to industry practices. The architecture is designed
with a focus on scalability, high availability for the future expansion.

Cubit is used where no user intervention is needed on UI like fetching data from the server, and Bloc is used where user
pass some event into the UI eg. validating the username and passowrd. Followed a clean code architecture where repository
directory contains all files that are responsible for network call, similarly for bloc contains all the files used to make
that bolc work eg. bloc, state and event and similar for cubit directory. Further we used the reusable components wherever
we reuse the widgets later on other classes.


How to Use?

Create a database named "growthgenie"
import the Schema provided for this hackathon into the database,
Clone the Java project from https://github.com/kmrvivek/HackathonGrowthGenie/tree/vivek,
Run this project into your local environment using your preferred IDE. We used Intellij Idea.
Make sure your local server is listening to port 8080,
Clone the flutter project into your local machine
running the flutter pub get command to download all the dependencies.
Finally run flutter run command to run the project.

_____________________________________________________________________



