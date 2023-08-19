# Helpdesk Project

### Project Purpose/Business Question:
Create a database to store the tickets, transform the data as needed, make queries to gather information from the database and then create a dashboard system to visualize the data.

### Data Description:
The data for this project was sourced from Kaggle and the downloaded data is stored in the "Helpdesk_Dataset.csv" file.
Link: https://www.kaggle.com/datasets/sudhanshu746/analyze-helpdesk-tickets

### Project Overview:
I used a MySQL database to store the data, transform it and make queries. The reason I used MySQL is because it is the database system I have the most practical experience in. I am able to set up, modify and query a database both through the MySQL Server GUI and MySQL Workbench as well as the Terminal and MySQL Command Line Client.
I then created a simple dashboard in Microsoft Power BI to visualize the data as I am familiar with the tool having used it during my intership at the Ontario Power Generation. The dashboard shows an overview of the data which has no Satisfaction rating assigned to it which I am assuming to be tickets which are still open. The dashboard is split into two areas, the first shows general metrics about the tickets (such as the type of ticket, who is requesting tickets, ticket severity level and a breakdown of tickets based on the type of issue) and the second area focuses on specifically tickets marked as "Critical" and displays information on tickets open for longer than 3 and 7 days, ticket types and issue type.


## MySQL:

### Understanding The Data:
ticket: Represents the Ticket Number.
requestor: ID number of the individual who is requesting the Ticket.
RequestorSeniority: The seniority of the individual requesting the ticket. A higher number equates to higher level within the organization.
ITOwner: The ID number of the IT employee assigned to the ticket.
FiledAgainst: The names of the systems the ticket is filed against. These are: Access/Login, Hardware, Software, Systems.
TicketType: Specifies the type of ticket filed which can be either an issue or a request.
Severity: A scale which indicates the severity of the ticket. A higher number equates to higher severity.
Priority: A scale which indicates the priority of the ticket. A higher number equates to higher priority.
daysOpen: A numerical value of the number of days the ticket has been left open.
Satisfaction: A scale which indicates the how satisfied the individual who opened the ticket is with the resolution of the ticket. A higher number equates to higher satisfaction.

### Database Setup:
#### Explanation:
I created a MySQL Database named "Helpdesk" and imported the downloaded data (which can be found in the "Helpdesk_Dataset.csv" file) into the database in a table named "helpdesk_dataset".
The basic details of the database can be seen below:

![image](https://github.com/Yagnesh-Rajani/Helpdesk_Portfolio_Project/assets/129909709/ce0d0732-c59b-45b0-83b2-2de699f04da5)

The first 20 rows of the database can be seen below:

![image](https://github.com/Yagnesh-Rajani/Helpdesk_Portfolio_Project/assets/129909709/2c9be20a-7cbf-4580-9a18-e34751a0fb35)


### Transforming The Data:
There were several transformations I wanted to make to the database to make queries easier to create as well as a dashboard in Microsoft Power BI. The SQL code I used can be found in the "Formatting.sql" file.
#### Explanation:
The transformations can be broken down into two groups. The first was splitting data such as the "RequestorSeniority" column into two columns called "RequestorLevel" which held the numeric value from the "RequestorSeniority" column as an integer value and the "RequestorType" column which held the text portion of the "RequestorSeniority" column as varchar(25) datatype as future data would not need to be longer than 25 characters. I applied the same changes to the "Severity", "Priority" and "Satisfaction" columns.
The second was to rename the "ticket", "requestor" and "daysOpen" columns to "Ticket", "Requestor" and "DaysOpen" to make the naming conventions the same for the column titles. The code for these changes can be found below and in the "Formatting.sql" file. The outcome of these changes can be seen in the images below:

![image](https://github.com/Yagnesh-Rajani/Helpdesk_Portfolio_Project/assets/129909709/15117b93-ba22-4ccd-96ba-2e87a26492fe)

![image](https://github.com/Yagnesh-Rajani/Helpdesk_Portfolio_Project/assets/129909709/24efe494-e243-4b42-bc3c-e0b25efefbe1)


### Queries:
The queries can be found in the "Queries.sql" file.

#### Query Explanation:
The first query is designed to aggregate the number of tickets by the level of the requestors to see where the most tickets are coming from and how many are there.

![image](https://github.com/Yagnesh-Rajani/Helpdesk_Portfolio_Project/assets/129909709/2b1fe507-a67e-4cb1-a930-50542b1ef58e)

The second query is designed to aggregate the number of tickets by the system they are being filed against to see which assets have the most issues.

![image](https://github.com/Yagnesh-Rajani/Helpdesk_Portfolio_Project/assets/129909709/a6ec1aaa-7584-4c36-894a-4b4e383720dd)

The third query finds how many tickets have been open for more than 7 days ordered by each IT Owner. This allows for both performance analysis to see which IT Owners are not resolving tickets as well as the support analysis to see which IT Owners may need support or tend to be allocated more complex tickets which results in more effort being required to resolve tickets. The image below shows some of, but not all, the resulting output.

![image](https://github.com/Yagnesh-Rajani/Helpdesk_Portfolio_Project/assets/129909709/5670a3ef-45f5-4954-87e9-d1512a57f19d)

The fourth query is designed to find the number of tickets which are marked as unsatisfactory by the requestor. These tickets can be used to show a trend with an IT Owner or provide space for further analysis based on the type of tickets being resolved and the IT Owners skills - an Owner who has more experience may be recieving a lot of unsatisfactory reviews for hardware issues which leads to the possibility for streamlining the ticketing process to play towards the Owner's skillset. The image below shows some of, but not all, the resulting output.

![image](https://github.com/Yagnesh-Rajani/Helpdesk_Portfolio_Project/assets/129909709/e38d8a24-7817-46b7-abc8-bb2bde671b00)

Next, the fifth query is designed to find the number of critical issue tickets with a high priority status which have not been resolved within 7 days. I chose 7 days based on the assumption that critical tickets need to be at least assigned to an ITOwner if not resolved within 7 days.

![image](https://github.com/Yagnesh-Rajani/Helpdesk_Portfolio_Project/assets/129909709/2cdc7187-888e-4325-b198-6864780c987b)

The next query is designed to show the number of tickets without a satisfaction rating which I am assuming to be open tickets with closed tickets requiring feedback which includes a satisfaction rating.

![image](https://github.com/Yagnesh-Rajani/Helpdesk_Portfolio_Project/assets/129909709/a0eb4213-e56e-4eaf-b300-36d7b1519f41)

The final query was created with the idea of a cybersecurity metric. I assumed that more than 5 access/login requests per day would require some form of investigation or following with the idea that more than 5 requests could indicate a bruteforce password attack. The image below shows some of, but not all, the resulting output.

![image](https://github.com/Yagnesh-Rajani/Helpdesk_Portfolio_Project/assets/129909709/37ee9c35-ea40-45ba-a38b-ae6a50d55989)

Lastly, I created a view of the above query for the purpose of being able to see that query easily. Similarly to the query above, the image below shows some of the resulting output.

![image](https://github.com/Yagnesh-Rajani/Helpdesk_Portfolio_Project/assets/129909709/a7446ba3-acbf-49e2-b303-3ed052d922d2)

### Database Export:
I exported the table (not the entire database) to a csv file called "Helpdesk_Database_Export.csv". This included all of the changes I had made earlier which would make it easier to create the dashboard in Microsoft Power BI come to life in the way I visualized.


## Microsoft Power BI:
I imported the "Helpdesk_Database_Export.csv" into Microsoft Power BI to create the dashboard. As I had already formatted the data in the way I wanted, I did not make any changes in Power Query. The dashboard can be found in the "Helpdesk.pbix" file.

### Dashboard Explanation:
The dashboard I designed for this project is focused on tickets which are currently open. I assumed that tickets with no Satisfaction rating were open tickets and used the "SatisfactionType" field to filter for this data. I split the dashboard into two sections, the first (left side) of which is designed to show overall metrics and the second (right side) which is designed to show metrics about critical tickets. The dashboard can be seen below:

![image](https://github.com/Yagnesh-Rajani/Helpdesk_Portfolio_Project/assets/129909709/e44c9d62-942c-495a-ac3d-56f3a0aea06a)


For the "Overall Metrics" visuals, I decided to use a clustered bar chart to show the breakdown of the tickets based on the priority level and type of tickets. This would help show the proportion of each type of ticket for each priority type. I also used a bar chart to display the tickets by severity type which helps to see how many tickets are marked for each severity level. In order to show the breakdown of tickets by requestor type and issue type I chose to use a donut chart as they can show the proportion of tickets in an easy to understand manner and comparing the proportions was not as potentially important as the data shown in the bar charts (I am making the assumption that showing the proportions for the donut charts is not important enough to use a bar chart as I have never worked with this type of data before). Lastly a simple card shows the number of open tickets.

I used a different approach for the "Unassigned Critical Tickets" visuals as these were filtered to only show tickets which were at a critical level and had not been assigned to be resolved. I used two cards to show the number of tickets open for longer than 3 and 7 days with the assumption that critical tickets should be generally assigned within 3 days and most certainly assigned within 7 days. I used a clustered bar chart to show the type of these tickets and a donut chart to show the breakdown of the tickets by issue type. I also ensured that the color schemes of these two visuals matched their counterparts in the "Overall Metrics" visuals for consistency.
