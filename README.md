# Rails Blog

This is a very basic blog built using Rails 4.0 and Ruby 2.0. It currently has the functionality of
creating, updating, and deleting posts, as well as a commenting system. It also has a basic user authorization
and authentication system that disallows editing of the blog by anyone but the admin user. More functionality to come.

A working copy of the application can be seen at [rails-blog.caseyscarborough.com](http://rails-blog.caseyscarborough.com).

## Installing the application

If you'd like to check out the application or contribute to it, follow the instructions below.

Clone the repository and use the bundle command to install dependencies.

```bash
git clone http://github.com/caseyscarborough/rails-blog.git
cd rails-blog
bundle install
```

## Configuring the application

First, you'll want to edit the [db/seeds.rb](https://github.com/caseyscarborough/rails-blog/blob/master/db/seeds.rb)
file and entering the information for your admin user's account.
```ruby
User.create({
  :username   => 'caseyscarborough',
  :email      => 'casey@caseyscarborough.com',
  :first_name => 'Casey',
  :last_name  => 'Scarborough',
  :password   => 'password',
  :password_confirmation => 'password',
  :is_admin   => true
})
```

Update the [config/config.yml](https://github.com/caseyscarborough/rails-blog/blob/master/config/config.yml)
file with the information about your blog (this step is optional).

```yaml
title: Rails Blog
author: Casey Scarborough
```

Then proceed to migrate, create admin user, and populate the database with sample data (optional) and
run the rails server. See the [lib/tasks/sample_data.rake](https://github.com/caseyscarborough/rails-blog/blob/master/lib/tasks/sample_data.rake)
file for more info about the database population task.

```bash
rake db:migrate db:seed db:populate
rails server
```

Then navigate to [http://localhost:3000](http://localhost:3000) in your web browser to see the application in action.

## To-Do

* Add tags to posts.


## Contributing

Please feel free to contribute to the application by following the steps below:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request