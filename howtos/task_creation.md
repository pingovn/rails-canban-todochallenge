## Challenge should have many tasks.  
As a user, when I created a challenge  
Then I should be redirected to task form to add task

- Create task model `rails g model task name:string type:string point:integer challenge_id:integer`
- Run migrate `bundle exec rake db:migrate`
- Define association
    + belongs_to :challenge
    + challenge has many tasks
- Task validation:
    + Name, Type and Point should be presence
    + Type should be in *DailyTask*, *WeeklyTask*, and *MonthlyTask*
    + Point is a integer
    + Point should not greater than 50
- Create `DailyTask`, `WeeklyTask`, `MonthlyTask` models are inherited model of `Task`
- Task controller:
    + A children of challenge [nested resource](http://edgeguides.rubyonrails.org/routing.html#nested-resources)
    + Add actions: `create`, `update`, `edit`, `destroy` and `index` 

## Change update to Ajax

- Set add option `remote: true` to form
- Create `_task` partial
- Add `create.js.erb` to render *js* format
- Add `destroy.js.erb` for destroying by ajax

## Only host of challenge can add Task
- run `rails g pundit:install` to generate application policy. 
- add ` include Pundit` to `ApplicationController`
- run `rails g pundit:policy challenge` to generate challenge policies
- set challenge policies
- run `rails g pundit:policy task` to generate task policies
- go to `TaskPolicy` class to configure task polices 


 