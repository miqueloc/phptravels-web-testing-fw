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

### HOW TO RUN THE TEST CASES?

**YOUR OWN ENVIRONMENT:**

- Go to project root directory phptravels-web-testing-fw/
- Run:
```
robot --variable BROWSER:[chrome|firefox] --outputdir output tests/success_reservation.robot
```
Example:
```
robot --variable BROWSER:chrome --outputdir output tests/success_reservation.robot
```
**DOCKER CONTAINER:**
```
sudo docker run --net host --rm -v path_to_phptravels-web-testing-fw_repo_directory:/home/robot/ --shm-size=256m -i --name robot docker_image_name:latest ./execute_tests.sh [chrome|firefox] test_suite_name.robot
```
Example:
```
sudo docker run --net host --rm -v /home/user/Desktop/phptravels-web-testing-fw/:/home/robot/ --shm-size=256m -i --name robot docker-web-tests:latest ./execute_tests.sh chrome success_reservation.robot
```
### HOW TO CHECK THE REPORT?
You can check the HTML report in output/ directory
