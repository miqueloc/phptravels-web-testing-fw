## phptravels-web-testing-fw

This is a Project based in Robot Framework and Selenium2Library in order to create automated tests for https://www.phptravels.net which is a demo website to practice.

### WHERE CAN I RUN THE TEST CASES?

You have two options to run the test cases:

**1. IN YOUR OWN ENVIRONMENT:**

You need to have installed the following drivers, libraries, and others:
- OS: Linux, Mac or Windows
- JDK or OpenJDK 8

If you want run the test in Chrome Browser you need:
- Google Chrome Web Browser (https://www.google.com/chrome/)
- Chrome Driver (http://chromedriver.chromium.org/downloads)
Note: To choose the driver version you need to check in the documentation the compatibility with the Chrome Browser version installed

If you want run the test in Firefox Browser you need:
- Firefox Web Browser (https://www.mozilla.org/en-US/firefox/new/)
- Gecko Driver (https://github.com/mozilla/geckodriver/releases/)
Note: To choose the driver version you need to check in the documentation the compatibility with the Firefox Browser version installed

- Python 2.7
- Pip (Package management system used to install and manage software packages written in Python)
- Using pip you need to install the following packages:
  * robotframework
  * robotframework-selenium2library
  * robotframework-faker

**2. CREATING A DOCKER IMAGE USING DOCKERFILE IN DOCKER/ DIRECTORY**

You need to have installed Docker (https://docs.docker.com/)

In order to create the image you need to run the following command in docker/ directory:

```
sudo docker build -t [docker_image_name] .
```

Example: 
```
sudo docker build -t docker-web-tests .
```

### HOW TO RUN THE TEST CASES

**YOUR OWN ENVIRONMENT:**

- Go to project root directory phptravels-web-testing-fw/
- Run:
```
robot --variable BROWSER:chrome --outputdir output tests/success_reservation.robot
```

**DOCKER CONTAINER:**
```
docker run --net host --rm -v path_to_phptravels-web-testing-fw_repo_directory:/home/robot/ --shm-size=256m -i --name docker_container_name docker_image_name:latest ./execute_tests.sh chrome test_suite_name.robot
```
Example:
```
docker run --net host --rm -v /home/user/Desktop/phptravels-web-testing-fw/:/home/robot/ --shm-size=256m -i --name phptravels-testing docker-web-tests:latest ./execute_tests.sh chrome success_reservation.robot
```
### HOW TO CHECK THE REPORT
You can check the HTML report in output/ directory

### HOW TO ADD MORE TEST CASES WHITIN THE SUITE FILE (success_reservation.robot)
This suite file has a test case to validate a successful reservation 

1. Open the suite file tests/success_reservation.robot
2. Add more test cases in section '*** Test Cases ***' 
2.1. Add a test name 
2.2. Add argument values to be used in the test case

Test Arguments to be defined are:
- ${from} : Airport or City Name. You can use Acronym too. There are two constants in the project (${BCN_CITY} and ${LCY_CITY}) if you want use it
- ${to} : Airport or City Name. You can use Acronym too
- ${departure_date} : [Important] You need to set as value the number of days to add to the current date. Example: if the value is 20; the test will calculate the date with the expression: current_date + 20 days
- ${return_date} : [Important] You need to set as value the number of days to add to the current date. Example: if the value is 20; the test will calculate the date with the expression: current_date + 20 days
- ${travel_class} : You need to use one of these constants (${ECONOMY_TRAVEL_CLASS}, ${FIRST_TRAVEL_CLASS} or ${BUSINESS_TRAVEL_CLASS}) 
- ${adults} : Number of adults for the reservation
- ${children} : Number of children for the reservation
- ${infants} : Number of infants for the reservation
- ${name} : The name of the person making the reservation
- ${lastname} : The last name of the person making the reservation
- ${email} : The email of the person making the reservation
- ${contact_number} : The phone number of the person making the reservation
- ${address} : The address of the person making the reservation
- ${country} : The country of the person making the reservation. Example: Venezuela

(!) Important!! -> Variables will be defined in the same order as previous list

You can use global variables or text plain in suite test case file.

Global varibales are defined in resources/global_variables.robot

**Do you want use random values for personal data: name, lastname, address and others? ?**
You can write in *Guest* global variables or directly in the test case definition the key: _random and these variables/arguments will has a random valid value (using robotframework-faker library)

 
### POSIBLE PROBLEMS
- Webpage is changing constantly. Flights section can be missing or is possible that some element searching by xpath could not be found
- Driver, Selenium and Browser version incompatibility
- Cities/Airports and Country to select is possible that there are not in the webpage

#BUGS FOUND
- Departure and Return date in flight list and invoice page are not correct. Always are the current date or tomorrow 
- Guest Contact Number and other guest values are cutted in Invoice page where exceeds a limit

Enjoy it!!
