# INSTALLATION

* Ruby version  
~ruby 2.3.3p222

* Configuration  
  You will need to create .env file found in the root folder as they have been excluded in .gitignore for security.  
  Instructions for installation:  

  Clone the repo then change into the directory.  
Run ```bundle install``` in terminal.  
Run ```rails db:migrate``` in terminal.  
Find and edit the .env file in the root of the directory, then add your own ENV variables:    
```CLOUDINARY_KEY=  
CLOUDINARY_SECRET=
MAILGUN_DOMAIN=
MAILGUN_USER=
MAILGUN_PASSWORD=
STRIPE_PUBLISHABLE_KEY=
STRIPE_SECRET_KEY=
MAPS_KEY=```



# Design Document
## Design Contents
* Problem Definition  
* Problem Solution  
  * Proposed Solution
  * Ethical Considerations
* User Stories
* Flowcharts
  * Volunteer Interaction
  * Charity Interaction
* Wireframes
  * Desktop  
  * Mobile
* ERD
* Design Decisions
* Agile Workflow Timetable


## PROBLEM DEFINITION

  Charities always need more volunteers, particularly during variable event seasons. (Yearly fundraisers etc.) Not for profit's in Australia source 6.1 million volunteers each year. These volunteers work for a combined 713 million hours each year. This is an average of 100 hours per person per year. (Although it is worth noting the unreliability of self-reported data.)
  Source: https://www.volunteeringaustralia.org/wp-content/uploads/VA-Key-statistics-about-Australian-volunteering-16-April-20151.pdf

  To see how the general public felt about volunteering I created a short survey to ask people's experiences and their barriers to volunteering. Whilst a large amount of people (50%+) already volunteer, many feel as though they don't volunteer enough with a whopping 100% of people feeling they do not volunteer enough. A survey I created found the number one reason people were unlikely to volunteer is time constraints with 76% of respondents.
  Full results can be found: https://www.surveymonkey.com/results/SM-PT3G8YHVL/

  ![alt text][survey_pic]

  [survey_pic]:docs/images/survey.png "Survey Results"


## PROBLEM SOLUTION
### PROPOSED SOLUTION
  A proposed solution is a digital, online platform that will connect charities to volunteers. The platform will allow charities to 'crowd source' volunteers by posting opportunities online. Volunteers will be able to search available opportunities filtering based on skills, time and location.  
  Volumeteer will aim to create a sense of community and self-fulfillment. This will be done by allowing charities and user to create a personal profile including a picture. Hours given by volunteers will be tracked and top volunteers could be highlighted each month.

### ETHICAL CONSIDERATIONS  
  First, safety. All volunteers should expect a safe, inclusive experience. Also, those traditionally susceptible to negligence and malice (i.e. elderly and sick) must be able to use the platform without fear. This could be solved via a peer-rating system or, provided full production, working with a background check.  
  Secondly, workplace legislation. All opportunities must be a legitimate volunteer opportunity, allowing a volunteer a fulfilling experience that is not paid labour in disguise. This could be solved by the expectation that all charities or people offering opportunities will adhere to current legislation and a code of conduct. Moderation (physical or automated) could also enable a better service.

## USER STORIES
  User stories were created using Trello. The original stories comprise of MVP features. Aswell as one column of non-mvp features.

![alt text][userStories]

[userStories]:docs/images/userStories.png "User Stories for project"

![alt text][userStoriesExtra]

[userStoriesExtra]:docs/images/userStoriesExtra.PNG "Non-MVP User Stories for project"
## WORKFLOW
### USER INTERACTION DIAGRAM
![alt text][volunteerFlow]

[volunteerFlow]:docs/images/volunteerFlow.png "Volunteer flow for project"

![alt text][charityFlow]

[charityFlow]:docs/images/charityFlow.png "charityFlow for project"

## WIREFRAMES

   Wireframes were created using Figma.com, all of which can be found here: https://www.figma.com/file/fdwSZtMhDU6XQafWcBPT97Qq/Volumeteer_Wireframes
   DESKTOP
   ![alt text][wireframe]

   [wireframe]:docs/images/wireframes.png "Wireframes for project"

   MOBILE  
   ![alt text][wireframes]

   [wireframes]:docs/images/mobileUserWireframe.PNG "Mobile Wireframes for project"


## ERD
![alt text][erd_pic]

[erd_pic]:docs/images/erd.PNG "ERD"


## DESIGN DECISIONS

   Pinterest.com.au was originally used to help find inspiration for a general design.
   A quote from the Lorax was the largest piece of inspiration design wise.

   ![alt text][lorax_pic]

   [lorax_pic]:docs/images/lorax.PNG "Lorax"
   As such the primary colour chosen was blue. A lighter shade of blue is hopefully going to remind users of child-like story books and paintings. Blues and greens are also proven to be calming and work well with those that are short-sighted.

## AGILE WORKFLOW
   ![alt text][agile_pic]

   [agile_pic]:docs/images/agileFlow.PNG "Agile Timetable"
