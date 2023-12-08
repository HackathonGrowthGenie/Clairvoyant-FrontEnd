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

This application adheres to SOLID design principles in compliance to industry practices. The architecture is designed with a focus on scalability, high availability for the future expansion. Cubit is used where no user intervention is needed on UI like fetching data from the server, and Bloc is used where user pass some event into the UI eg. validating the username and passowrd. Followed a clean code architecture where repository directory contains all files that are responsible for network call, similarly bloc contains the files used to make that bolc work eg. bloc, state and event and similar for cubit directory for cubit and state. Further I used the reusable components wherever required.

_________________________________________________________________________________

## Application comprises of following flow:

1. Login with email and password (For this prototype this is not functional. You may use any username and password). But it showcase how bloc can be used to validate the fields.
2. Client selection screen contains top Investors who made most out of thier investments. At the bottom you need to enter the customer ID.
3. Dashboard Screen contains
   i.   Inner Grid: Where user see the balance of user individual investments eg. (Mutual Fund, Stocks etc)
   ii.  Transaction: Where recent user transactions are displayed
   iii. ROI: Where return on overall investments and individual investments are shown in pi chart.
   iv.  Popular Investments count: Where top popular investments are shown in terms of count. Representing why the investment is so popular.
   v.   Historical returns: Where previous days returns are shown
   vi.  Tax assessements: Where tax assessment are shown for last fiscal year.

__________________________________________________________________________________

## How to Use?

1. Create a database named "growthgenie"
2. import the Schema provided for this hackathon into the database. which is also provided inside assets directlory of this repository.
3. Clone the Java project from https://github.com/kmrvivek/HackathonGrowthGenie/tree/vivek,
4. Run this project into your local environment using your preferred IDE. I used Intellij Idea.
5. Make sure your local server is listening to port 8080,
6. Clone this flutter repository into your local machine
7. Set your environment to make flutter project to run. Run flutter doctor to diagnose if anything missing.
8. running the flutter pub get command to download all the dependencies given on pubspec.yaml file
9. Select your emulator. You can select google chrome for this project to run on your browser.
10. run flutter run command to run the project.

_____________________________________________________________________

                                                # THANK YOU!

______________________________________________________________________

## Screenshot

![Screenshot 2023-12-08 at 11 32 35 AM](https://github.com/HackathonGrowthGenie/Clairvoyant-FrontEnd/assets/16430056/dcc84312-5040-4a02-8133-cdff995697cf)




