/*INTRODUCTION*/

/*To test the hypothesis that countries further from the equator (i.e. more likely to be cold) are 
more likely to contract COVID-19, I plan to perform a correlation analysis to analyze the relationship
between a country’s latitude and their number of COVID-19 cases and deaths*/

/*After determining each country's current total number of COVID-19 cases and deaths (as of June 5), I 
will calculate each country's distance from the equator by taking the absolue value of their latitude. 
Next, I will merge the data frames to show a country's COVID-19 cases and deaths next to their absolute
latitude. I will also create macro functions to remove outliers and set which countries will be labelled 
on graphs. Finally, I will carry out the correlation analysis.*/


/*DATA CLEANING & FEATURE ENGINEERING*/

/*COVID-19 Statistics*/
/* Import Excel File with Each Country's Population and Number of COVID-19 Deaths and Cases per Day*/
proc import
	datafile='/home/u44640293/owid-covid-data.csv'
	out=covid
	dbms=csv
	replace;
	getnames=yes;
	guessingrows= max;

/* Determine Each Country's Current Total Number of COVID-19 Cases & Deaths*/
data current_totals;
	set covid;
	if date="05JUN2020"d;
	keep location total_cases total_deaths total_cases_per_million total_deaths_per_million;

/* Sort by Country to Perform Correlation Analysis Later On*/
proc sort data=current_totals out=country_totals; 
  by location;
  
proc print data=country_totals(obs=10);
  
  
  
/*Latitude by Country*/  
/* Import Excel File with Each Country's Latitude*/
proc import
	datafile='/home/u44640293/latitude_data.xlsx'
	out=latitude
	dbms=xlsx
	replace;
	sheet=Sheet1;
	getnames=yes;
	
proc print data=latitude(obs=10);

/* Calculate Absolute Value of Each Country's Latitude To Get Their Distance From The Equator*/
data absLatitude;
	set latitude;
	AbsoluteLatitude=abs(Latitude);

/* Sort by Country to Perform Correlation Analysis Later On*/
proc sort data=absLatitude out=absoluteLatitude; 
  	by location;
  
proc print data=absoluteLatitude(obs=10);



/*COVID-19 Statistics and Absolute Latitude by Country*/
/* Merge Each Country's Absolute Latitude and Total COVID-19 Cases and Deaths*/
data covidAll;
   MERGE absoluteLatitude country_totals;
   BY location;
   
proc print data=covidAll(obs=10);
   
/* Remove Countries Without a Registered Latitude and/or Any COVID Cases*/
data covidFinal;
	set covidAll;	
	if latitude = ' ' or total_cases = ' ' then delete;
	
proc print data=covidFinal(obs=10);
	





/*MACRO FUNCTIONS*/

/* Macro Function to Set Cutoff Value to be Labelled on Graph*/
	/*The function below takes in a variable of interest, a cutoff 
	  value for the variable of interest, and the data set the variable 
	  belongs to. It returns an updated data set with only countries above 
	  the cutoff value for the specified variable.*/
%macro label_cutoff(cutoff_variable=, cutoff_value=, dataSet=);
data labels;
	set &dataSet;
	Label = location;
	if &cutoff_variable < &cutoff_value then
		Label = " ";
put Label;
%mend;


/* Macro Function to Remove Outlier Countries from Data Set*/
	/*The function below takes in the name of a country to be excluded 
	  from a data set and the name of the data set. It will return an 
	  updated data set without the selected country. */
%macro remove_country(country_to_remove=, dataSet=);
data covidWithout;
	set &dataSet;
	if location ~= &country_to_remove;
put covidWithout;
%mend;






/*CORRELATION ANALYSIS*/

/*Correlation Between Absolute Latitude and Variables of Interest*/
proc corr data=covidFinal;
	var absoluteLatitude;
	with total_cases total_deaths total_cases_per_million total_deaths_per_million;


/*Scatterplot Showing Relationship Between Absolute Latitude and Total Cases*/
%label_cutoff(cutoff_variable=total_cases, cutoff_value=50000, dataSet=covidFinal);
proc sgplot;
title "Correlation Between Absolute Latitude and Total Cases";
	scatter x=AbsoluteLatitude y=total_cases / datalabel=Label;
	reg x=AbsoluteLatitude y=total_cases;
	yaxis min=0 max=2000000;
	
	
/*Scatterplot Showing Relationship Between Absolute Latitude and Total Deaths*/
%label_cutoff(cutoff_variable=total_deaths, cutoff_value=5000, dataSet=covidFinal);
proc sgplot;
title "Correlation Between Absolute Latitude and Total Deaths";
	scatter x=AbsoluteLatitude y=total_deaths / datalabel=Label;
	reg x=AbsoluteLatitude y=total_deaths;
	yaxis min=0 max=150000;
	

/*Scatterplot Showing Relationship Between Absolute Latitude and Cases Per Million*/
%label_cutoff(cutoff_variable=total_cases_per_million, cutoff_value=3000, dataSet=covidFinal);
proc sgplot;
title "Correlation Between Absolute Latitude and Total Cases Per Million";
	scatter x=AbsoluteLatitude y=total_cases_per_million / datalabel=Label;
	reg x=AbsoluteLatitude y=total_cases_per_million;
	yaxis min=0 max=30000;
	
	
/*Scatterplot Showing Relationship Between Absolute Latitude and Deaths Per Million*/
%label_cutoff(cutoff_variable=total_deaths_per_million, cutoff_value=150, dataSet=covidFinal);
proc sgplot;
title "Correlation Between Absolute Latitude and Total Deaths Per Million";
	scatter x=AbsoluteLatitude y=total_deaths_per_million / datalabel=Label;
	reg x=AbsoluteLatitude y=total_deaths_per_million;
	yaxis min=0 max=1500;
	
/*Remove San Marino*/
%remove_country(country_to_remove="San Marino", dataSet=covidFinal);
proc corr;
	VAR AbsoluteLatitude total_deaths_per_million;
	
%label_cutoff(cutoff_variable=total_deaths_per_million, cutoff_value=150, dataSet=covidWithout);   
proc sgplot;
title "Correlation Between Absolute Latitude and Total Deaths Per Million (Excluding San Marino)";
	scatter x=AbsoluteLatitude y=total_deaths_per_million / datalabel=Label;
	reg x=AbsoluteLatitude y=total_deaths_per_million;
	yaxis min=0 max=1500;
		
		
