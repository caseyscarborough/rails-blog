# Rails Blog

This is a very basic blog built using Rails 4 and Ruby 2.0. It currently has the functionality of
creating, updating, and deleting posts, as well as a commenting system. More functionality to come.

## Using the application

If you'd like to check out the application or contribute to it, follow the instructions below.

Clone the repository and use the bundle command to install dependencies.

```bash
git clone http://github.com/caseyscarborough/rails-blog.git
cd rails-blog
bundle install
```

Update the config/config.yml file with the information about your blog (this step is optional).

```yaml
title: Rails Blog
author: Casey Scarborough
```

Then proceed to migrate and populate the database (optional) and run the rails server. See
lib/tasks/sample_data.rake for more info about the database population task.

```bash
rake db:migrate
rake db:populate
rails server
```

Then navigate to [http://localhost:3000](http://localhost:3000) in your web browser to see the application in action.

## To-Do

* Add tags to posts.
* Add users.
* Implement authentication and authorization.


## Contributing

Please feel free to contribute to the application by following the steps below:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request