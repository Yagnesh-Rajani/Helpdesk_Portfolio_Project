# _____________________________________________________________________________
#           FORMATTING THE TABLE
# _____________________________________________________________________________

# Create new columns
# Create New Reqestor Columns
ALTER TABLE helpdesk_dataset ADD COLUMN RequestorLevel INT AFTER RequestorSeniority;
ALTER TABLE helpdesk_dataset ADD COLUMN RequestorType VARCHAR(25) AFTER RequestorLevel;
# Create New Severity Columns
ALTER TABLE helpdesk_dataset ADD COLUMN SeverityLevel INT AFTER Severity;
ALTER TABLE helpdesk_dataset ADD COLUMN SeverityType VARCHAR(25) AFTER SeverityLevel;
# Create New Priority Columns
ALTER TABLE helpdesk_dataset ADD COLUMN PriorityLevel INT AFTER Priority;
ALTER TABLE helpdesk_dataset ADD COLUMN PriorityType VARCHAR(25) AFTER PriorityLevel;
# Create New Satisfaction Columns
ALTER TABLE helpdesk_dataset ADD COLUMN SatisfactionLevel INT AFTER Satisfaction;
ALTER TABLE helpdesk_dataset ADD COLUMN SatisfactionType VARCHAR(25) AFTER SatisfactionLevel;

# Update new columns with data
UPDATE helpdesk_dataset
# Update Requestor Columns
SET RequestorLevel = SUBSTRING_INDEX(RequestorSeniority, ' - ', 1),
RequestorType = SUBSTRING_INDEX(RequestorSeniority, ' - ', -1),
# Update Severity Columns
SeverityLevel = SUBSTRING_INDEX(Severity, ' - ', 1),
SeverityType = SUBSTRING_INDEX(Severity, ' - ', -1),
# Update Priority Columns
PriorityLevel = SUBSTRING_INDEX(Priority, ' - ', 1),
PriorityType = SUBSTRING_INDEX(Priority, ' - ', -1),
# Update Satisfaction Columns
SatisfactionLevel = SUBSTRING_INDEX(Satisfaction, ' - ', 1),
SatisfactionType = SUBSTRING_INDEX(Satisfaction, ' - ', -1);

# Rename columns
ALTER TABLE helpdesk_dataset RENAME COLUMN ticket TO Ticket;
ALTER TABLE helpdesk_dataset RENAME COLUMN requestor TO Requestor;
ALTER TABLE helpdesk_dataset RENAME COLUMN daysOpen TO DaysOpen;

# Remove old columns
ALTER TABLE helpdesk_dataset DROP COLUMN RequestorSeniority;
ALTER TABLE helpdesk_dataset DROP COLUMN Severity;
ALTER TABLE helpdesk_dataset DROP COLUMN Priority;
ALTER TABLE helpdesk_dataset DROP COLUMN Satisfaction;