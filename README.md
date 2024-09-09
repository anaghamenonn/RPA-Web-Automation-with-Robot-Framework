# Introduction

This project is a web scraping script written in Robot Framework. The script automates the process of searching for mobile phones under 10,000 on Flipkart, collecting the data about the mobile phones, and saving it to an Excel file.

# Getting Started
To run this script, you need to have Robot Framework and the necessary libraries installed. 
The libraries used in this project are:
1. RPA.Browser.Selenium
2. RPA.Excel.Files
3. Collections
4. String
5. BuiltIn
6. random
7. OperatingSystem. \
You also need to have the Chrome driver installed and set up correctly for Selenium to interact with the Chrome browser.

# Usage
The script is organized into tasks and keywords. The tasks are:
1. Minimal Task: This is the main task that calls all the keywords in the correct order to perform the web scraping task. \
The keywords are:
1. Setup chromedriver: Sets up the Chrome driver.
2. Open Google With Signed In Account: Opens Google with a signed-in account.
3. Search For Flipkart: Searches for Flipkart on Google and clicks on the first search result.
4. Search For Mobile Phones Under 10000: Searches for mobile phones under 10,000 on Flipkart.
5. Collect Mobile Data And Save To Excel: Collects the names and prices of the mobile phones and saves them to an Excel file.
6. Close All Browsers: Closes all open browsers.


# Contact
If you have any questions, feel free to reach out to me at anaghamenon7377@gmail.com.

# Acknowledgements
I would like to thank Robot Framework and its community for the resources and support provided in developing this project.

