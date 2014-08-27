## As a user, I should be able to create a challenge        
- Create Challenge Model `rails g model Challenge name:string starts_on:date code:string description:string creator_id:integer`   
- Change limit of description to 500 character. 
Go to migration file `db/migrate/<version_key>_create_challenges.rb` change `t.string :description` to `t.string :description, :limit => 500`
- Run `rake db:migrate`
- Associations:
    + `belongs_to :creator, :foreign_key => :creator_id, :class_name => 'User'`
- Add *validations* to challenge:
    + `validates :name, :starts_on, :presence => true`  
    + `validates :name, :length => {:minimum => 10, :maximum => 50}`
    + `validates :description, :length => {:maximum => 500}`
    + `validate :starts_on_is_in_future, :on => :create`
- Create controller
    + `rails g controller challenges new create show`
    + Require user login to _create a challenge_
    + _new action_  
    + _create_action_ 
    + Define Strong Parameter    
    + _show action_
- Update router
    + Remove auto generated routes
    + Add `resources :challenges, :only => [:show, :new, :create]`