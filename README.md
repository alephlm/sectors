# Getting Started

## Prerequisites to Run the Application
- Ensure Docker, Docker Compose, and curl are installed on your local machine.
- Make sure ports **5123** and **5433** are free on your local machine.
- The script should be run on Bash (macOS, Linux, or Windows emulator).

## How to Run
- Simply execute the `start-app.sh` script located at the root of the directory.
- This will create all the necessary containers and data.

## Accessing the Application
- Once the app is up and running, it can be accessed at [http://localhost:5123](http://localhost:5123).

# Development Notes
- The provided `index.html` file is located in the `/scripts` folder and is used as a source for extracting sector data.
- Implementation is done using **Spring Boot** MVC.
- Contents of `index.html` are now located at:
  - `src/main/resources/templates/employeeEdit.html`
  - `src/main/resources/templates/employeeForm.html`
  
  These two pages are responsible for displaying, creating, and updating employee details.
- Primary effort for this project was focused on making it as easy as possible to start up.
- The script `/scripts/sql_html_extraction.sh` is used to extract data from the HTML file and create database inserts. By running it with `/scripts/index.html` as a parameter, it generates `/scripts/populate_sectors.sql` as output.
- After our Spring Boot application completes initialization, `/scripts/populate_sectors.sql` will be executed.
- If a database dump is needed, it is provided at the root path as `dump.sql`.

#
#
#

## Given Tasks

1 - Correct all of the deficiencies in `index.html`

2 - "Sectors" selectbox:
   2.1. Add all the entries from the "Sectors" selectbox to database
   2.2. Compose the "Sectors" selectbox using data from database

3 - Perform the following activities after the "Save" button has been pressed:
   3.1. Validate all input data (all fields are mandatory)
   3.2. Store all input data to database (Name, Sectors, Agree to terms)
   3.3. Refill the form using stored data
   3.4. Allow the user to edit his/her own data during the session

**Write us Your best code!**

After completing the tasks, please provide us with:
1. Full database dump (structure and data)
2. Source code