## Challenge should have many tasks.  
As a user, when I created a challenge  
Then I should be redirected to task form to add task

- Create task model `rails g model task name:string type:string point:integer challenge_id:integer`
- Run migrate `bundle exec rake db:migrate`

