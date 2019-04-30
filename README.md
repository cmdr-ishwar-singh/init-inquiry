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



## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
