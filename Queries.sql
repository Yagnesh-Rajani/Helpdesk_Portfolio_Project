# _____________________________________________________________________________
#           QUERIES
# _____________________________________________________________________________

# Find the total number tickets submitted by each Requestor Group
SELECT RequestorLevel, COUNT(Ticket) AS Number_Of_Tickets
FROM helpdesk_dataset
GROUP BY RequestorLevel
ORDER BY RequestorLevel ASC;

# Find the total number tickets submitted by Type
SELECT FiledAgainst, COUNT(Ticket) AS Number_Of_Tickets
FROM helpdesk_dataset
GROUP BY FiledAgainst
ORDER BY FiledAgainst ASC;

# Find the total number of tickets open for more than 7 days, ordered by ITOwner
SELECT ITOwner, COUNT(FiledAgainst)  AS Tickets_Filed
FROM helpdesk_dataset
WHERE DaysOpen > 7
GROUP BY ITOwner;

# Find the total number of tickets which have an unsatisfied resolution, ordered by ITOwner
SELECT ITOwner, COUNT(FiledAgainst) AS Total_Unsatisfied
FROM helpdesk_dataset
WHERE SatisfactionType = "Unsatisfied"
GROUP BY ITOwner
ORDER BY ITOwner ASC;

# Find the number of critical issue tickets with a high priority and are open for longer than 7 days and list them by ITOWner
SELECT ITOwner, COUNT(SeverityLevel)
FROM helpdesk_dataset
WHERE SeverityLevel = 4
AND TicketType = "Issue"
AND daysOpen > 7
AND PriorityLevel = 3
GROUP BY ITOwner
ORDER BY ITOwner ASC;

# Find the total number of Tickets with an Unknown SatisfactionType (aka open tickets)
SELECT COUNT(Ticket) AS Open_Tickets
FROM helpdesk_dataset
WHERE SatisfactionType = 'Unknown';

# Assume that anyone making more than 5 Access/Login requests signals an attempted brute-force attack
# Find Requestors who have filed more than 5 Access/Login issue requests in 1 day
SELECT Requestor, IF(COUNT(Ticket) > 5, COUNT(Ticket), '') AS Over_5_Tickets
FROM helpdesk_dataset
WHERE SatisfactionType = 'Unknown'
AND DaysOpen = 0
AND FiledAgainst = 'Access/Login'
AND TicketType = 'Request'
GROUP BY Requestor
HAVING COUNT(Ticket) > 5
ORDER BY Over_5_Tickets DESC, Requestor;

# Save the above query as a view
CREATE VIEW Brute_Force_Indicator AS
SELECT Requestor, IF(COUNT(Ticket) > 5, COUNT(Ticket), '') AS Over_5_Tickets
FROM helpdesk_dataset
WHERE SatisfactionType = 'Unknown'
AND DaysOpen = 0
AND FiledAgainst = 'Access/Login'
AND TicketType = 'Request'
GROUP BY Requestor
HAVING COUNT(Ticket) > 5
ORDER BY Over_5_Tickets DESC, Requestor;