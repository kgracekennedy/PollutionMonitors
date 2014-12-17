PolutionMonitors
================

R scripts that read data from over 300 monitors spread across their individual files

##Data
Data from over 300 polution monitors are in the specdata folder.  rprog-data-specdata.zip contains the data from all monitors zipped into one file.  Each file contains the date of the observation, and the levels of sulfate and nitrate in the are on that day in parts per million.  Each montior saves its data in a separate file, and the file name is the number assigned to the monitor.  

InstructionsWk2.pdf includes the instructions for this programming assignment.

##Functions
pollutantmean.R takes in the directory (for us this is specdata), which pollutant that we are interested in, and the monitor id.  This function reads data from the file associated to the appropriate monitor and returns the average polutant level over the recorded observations.

complete.R takes in a directory and an id number (possibly multiple id numbers).  complete.R returns the number of complete cases for the monitor (i.e. the number of dates/times that have readings for both nitrate and sulfate).

corr.R takes in a directory and a threshold and returns a list of correlations (sulfate/nitrate) for each monitor meeting the threshold.  The threshold argument is defined by the user to be the minimum number of compelte cases required to be included in the list of correlations.

