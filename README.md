# MerchEgg 🍳
##hosted at [https://sleepy-mesa-20928.herokuapp.com/](https://sleepy-mesa-20928.herokuapp.com/)

## Semester 2 project at CoderFactoryAcademy
## A site for artists to upload and share their work
### Problem 🐙
Artists want to offer merch without the hassle of:
- Printing CD's / shirts / poster
- Outlaying money on merch that may not sell
- Risk making products that people don't want (for example, CD's when some people no longer have CD players)

Fans want to support artists and get something in return (that they want!)

### Solution 🐿
A service that allows artists to upload files / songs / pictures etc. and instead of selling physical merch, sell codes which give users access to their files. 

### Setup on your local machine! 💻 
- Clone repository
- Ensure you have keys for Cloudinary and Twilio API's loaded into the ENV variables
- Navigate into app folder
- run rails db:setup
- run rails s
- navigate to localhost:3000 to see project in action!

### Assignment Criteria 📑
✔️ = Done 😊 | ❌ = Not Done 😞 | ❎ = Kinda Done 😑

- ✔️ Design Documentation
- ✔️ One page summary of your application including problem definition, solution.
- ❌ A workflow diagram of the user journey/s. (User stories in Trello, but no diagram)
- ✔️ Wireframes for at least 5 screens.
- ✔️ User stories for the whole application.
- ✔️ Entity Relationship Diagram (ERD).
- ❌ Project plan and estimation. (Planned, but couldn't estimate as I didn't know how long thigns would take)
- ✔️ Trello or similar project management tool to be used to track progress of build.
- ❌ Show evidence of Slack conversations or use of other communication tools. (Talked about it... verbally. No evidence though!)
- ❌ Code review. Demonstrate that you have had your code reviewed by other students and that you have provided a code review for others. (Ran out of time for this)
- ✔️ Github. Demonstrate use of frequent commits, pull requests, documentation.
- ✔️ Use Agile development methodologies.
- ❎ Provide evidence you have used code quality tools (eg. Traceroute, Bullet, Brakeman, Rails Best Practices tool, RuboCop, RubyCritic, CodeClimate).
- ✔️ Create your application using Ruby on Rails.
- ✔️ Use postgresql database in development.
- ✔️ Use an API (eg. Omniauth, Geocoding, Maps, other..). (Twilio, Stripe)
- ✔️ Use environmental variables to protect API keys etc.
- ✔️ Implement a payment system for your product.
- ❌ Your app must send transactional emails (eg. using Mailgun). (Ran out of time)
- ❎ Your app should have an internal user messaging system. (works, but not pretty!)
- ✔️ Your app will have some type of searching, sorting and or filtering capability.
- ✔️ Your app will have some type of file uploading capability (eg. images).
- ✔️ Your app will have authentication (eg. Devise, must have full functionality in place).
- ❎ Your app will have authorisation (users have restrictions on what they can see and edit). (basic implementation)
- ❌ Your app will have an admin dashboard for the admin user to administrate the site. (Ran out of time to implement an overall admin dash. Been administrating through console)
- ✔️ Document your application with a README that explains how to setup, configure and use your application.

### Tools Used 🔨
- DBDesigner.net - For laying out, determining relationships and revising DB structure for project.
- Trello - For documenting process, sprints, models and user stories.
- Figma - Wireframing and prototyping the look and feel of the product.
- Microsoft VS Code - Code editor.

- Gems
..- Devise - Authentication
..- Cloudinary - For use with the Cloudinary image storage service.
..- Twilio - Integrates with Twilio to provide SMS functionality.
..- Stripe - Payments.
..- Boostrap - Easy implementation fo Bootstrap styling.
..- PG - Alternate DB required to deploy to Heroku.

## ERD 📊
![Project ERD](http://res.cloudinary.com/hinchy/image/upload/v1479963295/project_erd_sqnow2.png "ERD Diagram")

## Mockups / Wireframes 🖼
[Hosted on Figma](https://www.figma.com/file/Mg97uXLtxdUPRn7eT7qpDEY0/merch.ey)

## Github Link 🍔
[github.com/jfhinchcliffe/merchegg](https://github.com/jfhinchcliffe/merchegg)

## Trello 😏
[Trello - Project 2 - Ruby on Rails - CoderFactoryAcademy](https://trello.com/b/WCU6yBf9/project-2-ruby-on-rails-coderfactoryacademy)

Trello Contains:
- Sprint breakdown
- Models
- Resources
- User Stories

## To Do 🔥🔥🔥
- Improve messaging (currently ugly implementation and logic in inbox view (bad Jason! 👿 )
- Better define difference between Pro and Basic plans
- Better authorisation rather than constantly querying if current user owns the object
- Transactional emails and distribution of codes (ran out of time)
- Add FriendlyID
- Set username in stone?
