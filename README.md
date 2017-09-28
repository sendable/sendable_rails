# Sendable Rails ActionMailer Client

[Sendable](https://sendable.io) is a service that makes it simpler to design, manage and optimize your Transactional Emails. Sendable has created a Ruby gem `sendable` that communicates with our REST API for sending your transactional emails.

Ruby on Rails developers use the ActionMailer interface for sending emails. This gem, `sendable_rails` implements a small layer over the `sendable` gem that provides an API similar to ActionMailer.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sendable_rails'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install sendable_rails
```
## Setup

### Environment Variables

Add the following environment variables to your application. You can get these values from the settings page of your Sendable dashboard.

`SENDABLE_PROJECT_ID`=`YOUR PROJECT ID`

`SENDABLE_API_KEY`=`YOUR API KEY`

## Usage

The only changes required in your existing `mail` method are:

- Replace `mail` with `sendable_mail`
- Pass a `template_id` that you can get from your Sendable dashboard
- Instance variables will be available in your templates as `mustache` attributes

Everything else will work as expected. Here is a before and after comparison:

### Before (Without Sendable)

```ruby
class UserMailer < ActionMailer::Base
  default from: 'no-reply@example.com'

  def welcome(user)
    @user = user
    mail( to: @user.email, subject: "Welcome to My Awesome Site!" )
  end
end
```


### After (Using Sendable)

```ruby
class UserMailer < ActionMailer::Base
  default from: 'no-reply@example.com'

  def welcome(user)
    @user = user
    sendable_mail to: @user.email, template_id: 1
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
