# myUMBC Degree Planning Prototype

IS 436 – Structured Systems Analysis & Design  
Deliverable 5: User Interface Design, Program Design, and System Implementation

## Project Overview

This project is a prototype degree-planning application developed for IS 436.  
It demonstrates user interface design, program logic, and data structures aligned with a relational database.

The prototype shows what a UMBC student would use to view progress toward graduation, check advisor notes, explore course recommendations, and review academic information.

## Features Implemented

### 1. Home Dashboard
- Displays greeting, credit summary, and navigation to all pages.

### 2. Student Information Page
- Shows name, email, major, GPA, and credits.
- Includes a form that allows editing student information and updates it on-screen.

### 3. Advisor Notes
- Shows a list of advisor notes.
- Each note can be opened to view full details in a modal.
- Includes a simple calendar to simulate scheduling an advising meeting.

### 4. Degree Planner
- Displays current semester schedule.
- Shows plan status (Draft, Submitted, Approved).
- Includes a 4-year academic plan layout.

### 5. Course Search
- Search by course name, code, or keywords.
- Filter by department, credits, or course level.
- Clicking a course opens a modal with full course details.

### 6. Recommendations
- Users enter interests and academic goals.
- System generates customized course recommendations based on input.

### 7. Progress Tracker
- Displays credits earned, credits remaining, GPA, and requirement completion bars.

## Database Integration

The SQL script (`sqlscript.sql`) defines the backend tables:

- Student  
- Advisor  
- DegreePlan  
- SemesterPlan  
- Course  
- Enrollment  
- Review  
- Recommendation  
- Notification  

The interface fields (like name, email, major) directly match the schema.  
This fulfills the requirement that the UI stores and displays data that aligns with the database table structure.

## System Implementation

This repository includes:

- `index.html` — Functional UI prototype with JavaScript logic  
- `sqlscript.sql` — Full database schema and sample records  
- `README.md` — Documentation  

### Docker Deployment
A GitHub Action workflow can be used to build and push a Docker image.  
The final submission includes:

- DockerHub image URL  
- Docker pull command  

## User Guide

### Running the Application
1. Clone the repository:  
git clone https://github.com/rainaz101/myUMBCfinal.git
2. Open `index.html` in any web browser.

### Editing Student Information
- Go to Student Info → Click "Edit Info" → Enter changes → Save.  
- Updated values appear immediately.

### Using Course Search
- Enter keywords in the search box.  
- Optionally filter by department, level, or credits.  
- Click a course for full details.

### Getting Recommendations
- Go to Recommendations page.  
- Enter interests or concerns.  
- View the generated personalized report. Last updated for DockerHub deployment.
