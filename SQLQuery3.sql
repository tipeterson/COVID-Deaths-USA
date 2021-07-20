/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Data as of]
      ,[Start Date]
      ,[End Date]
      ,[State]
      ,[County Name]
      ,[Urban Rural Code]
      ,[FIPS State]
      ,[FIPS County]
      ,[FIPS Code]
      ,[Indicator]
      ,[Total deaths]
      ,[COVID-19 Deaths]
      ,[Non-Hispanic White]
      ,[Non-Hispanic Black]
      ,[Non-Hispanic American Indian or Alaska Native]
      ,[Non-Hispanic Asian]
      ,[Non-Hispanic Native Hawaiian or Other Pacific Islander]
      ,[Hispanic]
      ,[Other]
      ,[Urban Rural Description]
      ,[Footnote]
  FROM [CovidDeaths].[dbo].[USA]


--Showing the percentage of COVID Deaths to Total Deaths
--Shows the highest COVID Death Percentage in each state
--Starts with the highest percentages and descends to lowest
--Results: New York had the highest percentages while Oregon had the lowest


select *
 from CovidDeaths..USA


select [state], [total deaths], [COVID-19 Deaths]
 from CovidDeaths..USA


select [state], [county name], [total deaths], [COVID-19 Deaths], ([COVID-19 Deaths]/[total deaths]) *100 as COVIDPercentage
 from CovidDeaths..USA
 order by COVIDPercentage desc


--Showing the average COVID Deaths Percentage for the entire USA

select AVG(([COVID-19 Deaths]/[total deaths]) *100) as COVIDPercentage
 from CovidDeaths..USA


--Showing the the order of Highest Covid Deaths by State

select SUM([COVID-19 Deaths]) as HighestCovidDeaths
 from CovidDeaths..USA


 select [state], MAX([COVID-19 Deaths]) as HighestCovidDeaths
 from CovidDeaths..USA
 group by [state] 
 order by HighestCovidDeaths desc


 select [state], [urban rural description], MAX([COVID-19 Deaths]) as HighestCovidDeaths
 from CovidDeaths..USA 
 group by [state], [urban rural description]
 order by HighestCovidDeaths desc


select [state], [urban rural description], MAX([COVID-19 Deaths]) as HighestCovidDeaths
 from CovidDeaths..USA 
 where [urban rural description] like 'large central metro' 
 group by [state], [urban rural description]
 order by HighestCovidDeaths desc

 --Looking at the Highest Covid Deaths in specific States

select [state], [urban rural description], MAX([COVID-19 Deaths]) as HighestCovidDeaths
 from CovidDeaths..USA 
 where ([state] like 'CA' or [state] like 'FL') and [urban rural description] like 'large central metro'
 group by [state], [urban rural description]
 order by HighestCovidDeaths desc