# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
  - Adventures have many Pages
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  - Pages belong to Adventures
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  - Adventures have many Users through Pages
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  - Pages have many user-submittable attributes, e.g. body
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  - Users and Pages both have validations.
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  - Sum site stats on main page, URL: '/', Page.word_count
- [ ] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
  - Adventure new form writes to the Page model.
- [x] Include signup (how e.g. Devise)
  - /signup
- [x] Include login (how e.g. Devise)
  - /login
- [x] Include logout (how e.g. Devise)
  - post /logout from User Show
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  - Login through Google available via /login
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  - /adventures/1/pages/1
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
  - Upon reaching an unfinished story you are given the option to extend or end the line (URL unavailable because the New Page form requires that it be linked from a Page Show).
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
  - Attempt to signup with a mismatched password

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate