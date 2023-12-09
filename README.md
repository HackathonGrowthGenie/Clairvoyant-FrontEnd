# Flutter GrowthGenie Clairvoyant Hackathon Dashboard

--------------------------------------------------------

This project is a frontend efforts made by Solution Team participated on GrowthGenie Hackathon. The challenge entails crafting a platform that provides a comprehensive view of users' financial journeys, from budgeting and investing to tax planning and retirement savings. With GrowthGenie, users could gain insights into their spending habits, identify investment opportunities, and develop personalized financial strategies tailored to their unique needs.

_________________________________________________________

## Problem Statement

There are two themes. The participants can choose either or both of the themes and have the solutions submitted.

## THEME 1 - User Experience, Application & API Platform :

Design a comprehensive wealth management platform for XYZ Bank, a leading financial institution in India, aimed at enhancing the financial well-being of its retail account holders. The application should be accessible through both mobile and web interfaces, catering to a diverse user base.

______________________________________________________________

The platform must provide a holistic view of each customer's financial journey, including historical investment decisions and performance metrics. Additionally, it should leverage user data such as portfolio composition (equity, mutual funds, deposits), age, outstanding loans, family dependencies, and financial objectives to “suggest” personalized investment strategies.

________________________________________________________________

## THEME 2 : Data Analytics Dashboards :

Create a dashboard that provides following insights for users and management.

Identify Popular Investments: Utilize historical data on customer investments to determine the most popular investment choices among users.
Display a list of the top-performing mutual funds, fixed deposits (FDs), and stocks based on customer preferences, with a focus on the top 10 in each category.

Top-Performing Investments: Highlight investments that have generated the highest returns over time, allowing users to explore potential high-return options.
Identify High-Net-Worth Investors: Identify and categorize 'rich' investors based on their portfolio size or other relevant criteria, helping the bank target specific services or promotions to this segment.

Historical Returns: Offer a visualization of the total returns for the past six months on a monthly basis for the top 5 customers with the highest portfolios, allowing users to track their investment performance over time.

Tax Assessment: Offer a visualization of the expected tax liability for the current assessment year based on the user's portfolio. Provide users with insights into their tax obligations.

_____________________________________________________________________________

## Solution Approach

- This application is developed using flutter and dart and compatible with browser, ios and android devices.

- This application adheres to SOLID design principles in compliance to industry practices.

- The architecture is designed with a focus on scalability, high availability for the future expansion.

- Cubit is used where no user intervention is needed on UI like fetching data from the server, and Bloc is used where user pass some event into the UI eg. validating the username and passowrd.

- Followed a clean code architecture where repository directory contains all files that are responsible for network call, similarly bloc contains the files used to make that bolc work eg. bloc, state and event and similar for cubit directory for cubit and state.

- Further we used the reusable components wherever required.

- Only those specific apis are called which are required to render the screen. The beauty of bloc archetecture.

- Here we did not use equatable because we did not need to compare between two states manually.

- Here we used multiblocprovider to handle multiple blocs/cubits throughout the application.

- We used fl_chart package to show the pi chart.

- We used pretty_dio_logger to view the log from netowrk call and to handle the exception.

- We followed minimalistic approach to develop this prototype for the best performance.

_________________________________________________________________________________

## Application comprises of following flow:

1. Login with email and password (For this prototype this is not functional. You may use any username and password). But it showcase how bloc can be used to validate the fields.
2. Client selection screen contains top Investors who made most out of thier investments. At the bottom you need to enter the customerID.
3. Dashboard Screen contains the following:
   - Inner Grid: Where user see the balance of user individual investments eg. (Mutual Fund, Stocks etc)
   - Transaction: Where recent user transactions are displayed
   - ROI: Where return on overall investments and individual fund investments are shown in pi chart.
   - Popular Investments count: Where top popular investments are shown in terms of count. Representing why the investment is so popular.
   - Historical returns: Where previous days returns are shown
   - Tax assessements: Where tax assessment are shown for last fiscal year.
4. All above screens are synced with local server endpoints. If you run this application without backend, this may cause an error.
__________________________________________________________________________________

## How to Use?

1. Create a database named "growthgenie"
2. import the Schema provided for this hackathon into the database. which is also provided inside assets directlory of this repository.
3. Clone the Java project from https://github.com/kmrvivek/HackathonGrowthGenie/tree/vivek,
4. Run this project into your local environment using your preferred IDE. We used Intellij Idea.
5. Make sure your local server is listening to port 8080,
6. Clone this flutter repository into your local machine
7. Set your environment to make flutter project to run. Run flutter doctor to diagnose if anything missing.
8. running the flutter pub get command to download all the dependencies given on pubspec.yaml file
9. Select your emulator. You can select google chrome for this project to run on your browser.
10. run flutter run command to run the project.

______________________________________________________________________

## Screenshot


![Screenshot 2023-12-09 at 3 14 22 PM](https://github.com/HackathonGrowthGenie/Clairvoyant-FrontEnd/assets/16430056/6a3a5b27-c378-4996-be55-ffeb89fb5e11)

![Screenshot 2023-12-09 at 3 15 32 PM](https://github.com/HackathonGrowthGenie/Clairvoyant-FrontEnd/assets/16430056/e4c66618-b2e6-4df9-8383-8d9e6d957421)

![Screenshot 2023-12-09 at 3 17 55 PM](https://github.com/HackathonGrowthGenie/Clairvoyant-FrontEnd/assets/16430056/80161c93-a80d-40d0-8037-8bedd612db78)
