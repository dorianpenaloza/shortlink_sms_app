# Short Link SMS Application
[https://shortlinksms.herokuapp.com/]

* Uses [Ruby on Rails] as the framework.
* [Bitly] to create short url links.
* [Twilio] to send text messages.
* [Semantic UI] for styling.

#### Install locally

1. Make sure Ruby is installed on your system. Open your terminal and run command:
```
$ ruby -v
```

2. Make sure Rails is installed
```
$ rails -v
```

3. Clone repository
```
$ git clone https://github.com/dorianpenaloza/shortlink_sms_app.git
```

4. Install all gem dependencies
```
$ bundle install
```

5. Create db and migrate schema
```
$ rake db:create
$ rake db:migrate
```

6. Run the app
```
$ rails server
```

#### Room for improvement
* Making the UI responsive for mobile.
* Adding `alt` tags for visually impaired accessibility.
* Anything else you like!

[https://shortlinksms.herokuapp.com/]: <https://shortlinksms.herokuapp.com/>
[Ruby on Rails]: <http://rubyonrails.org/>
[Bitly]: <https://bitly.com/>
[Twilio]: <https://www.twilio.com/>
[Semantic UI]: <http://semantic-ui.com/>
