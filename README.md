# Flutter GrowthGenie Clairvoyant Hackathon Dashboard

--------------------------------------------------------

This project is a prototype of GrowthGenie Hackathon. The challenge entails crafting a platform that provides a comprehensive view of users' financial journeys, from budgeting and investing to tax planning and retirement savings. With GrowthGenie, users could gain insights into their spending habits, identify investment opportunities, and develop personalized financial strategies tailored to their unique needs.

_________________________________________________________

Participants must have minimum 2 years of experience. Team size can be a maximum of 5 members. Some how we were 4 team members out of which 3 members were Java Developer and since I was also a team leader I decided to go with front end development. Multiple submissions were allowed, but only the last submitted entry will be considered.

__________________________________________________________

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

______________________________________________________________________

This additional task aims to enhance the wealth management platform by providing valuable insights and tools to assist users in making informed investment decisions while also addressing their tax-related concerns and showcasing their portfolio's historical performance.

## Evaluation Criteria: Hackathon participants will be evaluated based on the following criteria:

1 Code Quality

2 Presentation skills

3 Data Processing

4 Data Modeling

5 Working prototype explanation

6 High-level architecture (Bonus: if cloud (any cloud) services are used)

7 User Interface experience

8 Innovative and Market-promising application.

9 Fault tolerance mechanism

10 Bonus: if users can think of a few use cases that are not listed in the problem statement

____________________________________________________________________________

Create an interactive dashboard as part of the wealth management platform that provides insights from different use cases shared in the problem statement.

Build data pipelines which provide analytical capabilities for the use cases shared in the problem statement.

Snippet of the code submission which is highly efficient with optimized performance. Flow chart with design architecture

Application/Solution source: should contain all the necessary source files.

Presentation pptx : This should contain a description of what you have tried to build, what problem you are solving and why your Application/solution should be considered for the final round. Video showing the demo functionalities.

_____________________________________________________________________________

## Solution Approach

To tackle with the problem I needed to group a team of like minded techies. I searched for the people in the hackathon participants list and invited members to the team. And finally came up with the group of 4 talents. We had a several meetings on what should be our approach to go with this prototype. Finally we came to the conclusion with HLD which adheres not only the solution to the problem but also the best approach on how we scale this prototype in the future. And keeping in mind all those obstacle we may face during the development, with the help of schema provided with this hackathon we workaround with the inputs we were given in the form of table and outputs to be delivered, out of our expertise.

_______________________________________________________________________________

Being a team leader of this hackathon, with the help of my team, my responsibility was to make our solutions is inline with the context. And you will love your work if people with positive and right mindsets work together. We thoroughly enjoyed this session, with no pressure and tension. After a first round selection, we often chat in a group, try to make fun discuss on the solutions and our achievements. Finally team came up with the solutions of backend in the form of api which i need to integrate with. Since Im a mobile developer, having knowledge of css, js, but to deliver a top notch user experience with basic css is next to impossible, since I was not pro tailwind guy. So I decided to go with flutter which allows me to develop cross platform application for web, mobile and desktop. I followed a minimalistic approach, with highly accepted state management framework in industry i.e Business Logic Component (Bloc)

________________________________________________________________________________

This application adheres to SOLID design principles in compliance to industry practices. The architecture is designed with a focus on scalability, high availability for the future expansion. Cubit is used where no user intervention is needed on UI like fetching data from the server, and Bloc is used where user pass some event into the UI eg. validating the username and passowrd. Followed a clean code architecture where repository directory contains all files that are responsible for network call, similarly bloc contains the files used to make that bolc work eg. bloc, state and event and similar for cubit directory for cubit and state. Further I used the reusable widgets for the components wherever I felt to reuse the widgets later on other classes.

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

My deepest appreciation goes to the Growthgenie team for their dedication and hard work in making this event possible. The dedication of each team member, from the organizers to the volunteers, was evident throughout the hackathon, and it contributed significantly to the positive and productive environment. I also want to express my heartfelt thanks to all the fellow participants who supported me throughout the hackathon. The collaborative spirit, brainstorming sessions, and shared knowledge were invaluable to my experience. Your encouragement and assistance were instrumental in helping me develop and refine my ideas. The Growthgenie Hackathon provided me with an invaluable learning opportunity and a platform to challenge myself and explore new ideas. I am incredibly grateful for the experience and the connections I made. I look forward to applying the knowledge and skills I gained to future endeavors and contributing to the entrepreneurial community. Thank you once again for making the Growthgenie Hackathon such a remarkable event. I am truly grateful for the opportunity to have been a part of it.

Screenshot

![Screenshot 2023-12-08 at 11 26 14 AM](https://github.com/HackathonGrowthGenie/Clairvoyant-FrontEnd/assets/16430056/959af78a-2b0c-4f93-9a66-11d3b6792ce5)



