# UuidIt

You need to assign UUIDs to your Model? UuidIt makes it as simple as adding one line of code to the according models.

For actually generating the uuids this plugin uses spectra's ruby-uuid (http://github.com/spectra/ruby-uuid) which is
based on ruby-uuid (http://raa.ruby-lang.org/project/ruby-uuid/).

## Installation

### Rails 2.3.x

#### As a plugin

```shell
script/plugin install git://github.com/aduffeck/uuid_it.git
script/generate uuid_it
rake db:migrate
```
#### As a gem
Add the following line to your config/environment.rb file:

```ruby
config.gem "uuid_it"
```

Then

```shell
gem install uuid_it
script/generate uuid_it
rake db:migrate
```

### Rails 3
#### As a plugin

```shell
rails plugin install git://github.com/aduffeck/uuid_it.git
rails generate uuid_it
rake db:migrate
```

#### As a gem
Add the following line to your Gemfile:

```ruby
gem "uuid_it"
```
Then

```shell
bundle install
rails generate uuid_it
rake db:migrate
```

## Usage

```ruby
class Car < ActiveRecord::Base
  uuid_it
end

@car.uuid # "9e5edacc-7163-11df-92bb-2d0a2c4dcb1c"

Car.find_by_uuid("9e5edacc-7163-11df-92bb-2d0a2c4dcb1c") # => @car
```

UUIDs will be assigned to new objects when they are created. Already existing objects will get a UUID when it is accessed
for the first time.

## Credits

Copyright (c) 2010 André Duffeck, released under the MIT license
