# CovidLatCorr
![COVID Header](https://github.com/xavier-lim/covidLatCorr/blob/master/images/covid_header.png)

The purpose of this exploratory data analysis (EDA) is to examine the relationship between a country’s distance from the equator and their total number of COVID-19 cases and deaths. Earlier on in the pandemic, many hypothesized that warmer temperatures may prevent or slow down COVID-19. Thus, warmer countries may be less susceptible to the disease. However, research has shown that this notion is false. The World Health Organization (WHO) has proven you can catch COVID-19 no matter how sunny or hot the weather is. To further test this hypothesis, I will utilize a correlation analysis to test whether countries farther away from the equator (which are assumed to have lower temperatures) tend to have more COVID-19 cases and deaths than countries near the equator (assumed to have warmer temperatures).


## Table of Contents
1.	[Project Tools](https://github.com/xavier-lim/covidLatCorr#project-tools)
2.	[Data Sources](https://github.com/xavier-lim/covidLatCorr#data-sources)
3.	[Tableau Project Dashboards](https://github.com/xavier-lim/covidLatCorr#tableau-project-dashboards)
4.	[Conclusion](https://github.com/xavier-lim/covidLatCorr#conclusion)
5.	[References](https://github.com/xavier-lim/covidLatCorr#references)
6.	[Author](https://github.com/xavier-lim/covidLatCorr#author)


## Project Tools
1.	SAS Studio - [Download SAS Studio](https://www.sas.com/en_ca/software/studio.html)
2.	COVID-19 Statistics Data Frame Source – owid-covid-data.csv
3.	Latitude by Country Data Frame Source – latitude_data.xlsx

## Data Sources
1.	The **COVID-19 Statistics** data set presents a variety of information about each country and their COVID-19 statistics. The variables of interest for this project include each country (location) and their: total cases (total_cases), total deaths (total_deaths), cases per million people (total_cases_per_million), and deaths per million people (total_deaths_per_million). This data set, consisting of *22,033* rows, was collected from: [OWID: COVID-19 Data](https://github.com/owid/covid-19-data/tree/master/public/data)
2.	The **Latitude by Country** data set presents *246* countries (location) and their latitude (latitude) collected from: [DSPL: Countries](https://developers.google.com/public-data/docs/canonical/countries_csv)

After data cleaning and feature engineering, the final compiled data set looked like:

![Data Screenshot](https://github.com/xavier-lim/covidLatCorr/blob/master/images/data_screenshot.PNG)


## Tableau Project Dashboards
![Cases](https://github.com/xavier-lim/covidLatCorr/blob/master/images/cases.PNG)

Interactive Version: [COVID-19 Cases and Deaths Dashboards](https://xavier-lim.github.io/CasesAndDeaths.html)

![Per Million](https://github.com/xavier-lim/covidLatCorr/blob/master/images/per_million.PNG)

Interactive Version: [COVID-19 Cases and Deaths Per Million Dashboards](https://xavier-lim.github.io/PerMillion.html)


## Conclusion
In conclusion, there appears to be close to no correlation between a country’s distance from the equator and their number of COVID-19 cases and deaths. However, there is a moderate positive correlation between a country’s distance from the equator and COVID-19 deaths per million. Thus, although countries far from the equator are not necessarily more likely to contract COVID-19, it may be important to explore whether countries far from the equator are more susceptible to die from COVID-19 once they get it. However, there may be other confounding variables impacting the correlation analysis results. For example, countries far from the equator tend to have an older population distribution which may lead to a higher COVID-19 death rate. 

## References
1.	[World Health Organization (WHO)](https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters)

## Author

* **Xavier Lim** - [LinkedIn](https://www.linkedin.com/in/xavier-lim14/) | [Portfolio Website](https://xavier-lim.github.io/)
