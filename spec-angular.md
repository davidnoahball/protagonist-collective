# Specifications for the Angular Assessment

Specs:
- [x] Use Angular to build the app
  - All html frontend requests are directed through Angular via app/assets/javascripts/app.js
- [x] Must contain some sort of nested views
  - Nested html via custom directives such as 'body-wrap' and 'second-header' in app/assets/javascripts/angular/directives
- [x] Must contain some sort of searching as well as filtering based on some criteria. Ex: All items in the "fruit" category, or all tasks past due
  - See Adventure Index and User Show
- [x] Must contain at least one page that allows for dynamic updating of a single field of a resource. Ex: Allow changing of quantity in a shopping cart
  - Updating search results count and index data
- [x] Links should work correctly. Ex: Clicking on a product in a list, should take you to the show page for that product
  - All links work correctly
- [ ] Data should be validated in Angular before submission
- [x] Must talk to the Rails backend using $http and Services
  - Angular frontent on /adventures talks to Rails backend on /adventures.json through app/assets/javascripts/angular/services/adventure.service.js
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
  - README has all those things

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message