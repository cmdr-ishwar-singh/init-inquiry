![Devise Logo](https://raw.githubusercontent.com/cmdr-ishwar-singh/init-inquiry/master/init_logo.png)

By [Initcoders](http://initcoders.com/).

Init-Inquiry is a flexible solution for Rails based. It:

* Is Rack based;
* Is a complete MVC solution based on Rails engines;

## Starting with Rails?

If you are building your first Rails application, we recommend you *do not* use Init-Inquiry.

## Getting started

Init-Inquiry 0.1.0 works with Rails 5.2.0 onwards. Add the following line to your Gemfile:

```ruby
gem 'init_inquiry'
```

Or install it yourself as:
```bash
$ gem install init_inquiry
```

Then run `bundle install`

Next, you need to run the generator:

```console
$ rails generate init-inquiry:install
```

In the following command you will replace `MODEL` with the class name used for the application’s inquiries (it’s frequently `Inquiry` but could also be `Contact`). This will create a model (if one does not exist) and configure it with the default Init-Inquiry modules. The generator also configures your `config/routes.rb` file to point to the Inquiry controller.

```console
$ rails generate init-inquiry MODEL
```

Next, check the MODEL for any additional configuration options you might want to add, such as confirmable or lockable. If you add an option, be sure to inspect the migration file (created by the generator if your ORM supports them) and uncomment the appropriate section.  For example, if you add the confirmable option in the model, you'll need to uncomment the Confirmable section in the migration.

Then run `rails db:migrate`

### Configuring views

We built Devise to help you quickly develop an application that uses authentication. However, we don't want to be in your way when you need to customize it.

Since Init-Inquiry is an engine, all its views are packaged inside the gem. These views will help you get started, but after some time you may want to change them. If this is the case, you just need to invoke the following generator, and it will copy all views to your application:

```console
$ rails generate init-inquiry:views
```

If you have more than one Inquiry model in your application (such as `Inquiry` and `Contact`), you will notice that Inquiry uses the same views for all models.

Init-Inquiry will use the default view at `app/views/inquiry`. You can also use the generator to generate scoped views:

```console
$ rails generate init-inquiry:views inquiries
```

### Configuring controllers

If the customization at the views level is not enough, you can customize each controller by following these steps:

1. Create your custom controllers using the generator which requires a scope:

    ```console
    $ rails generate init-inquiry:controllers [scope]
    ```

    If you specify `inquiries` as the scope, controllers will be created in `app/controllers/inquiries_controllers.rb`.
    will look like this:

    ```ruby
    class InquiriesController < ApplicationController
      # def new
      #   @inquiry = Inquiry.new
      # end
      ...
    end
    ```
    (Use the -c flag to specify a controller, for example: `rails generate init-inquiry:controllers inquiries `)


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
