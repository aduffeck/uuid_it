# UuidIt

You need to assign UUIDs to your Model? UuidIt makes it as simple as adding one line of code to the according models.

For actually generating the uuids this plugin uses spectra's ruby-uuid (http://github.com/spectra/ruby-uuid) whih is
based on ruby-uuid (http://raa.ruby-lang.org/project/ruby-uuid/).

## Installation

### Rails 2.3.x

#### As a plugin

    script/plugin install git://github.com/aduffeck/uuid_it.git
    script/generate uuid_it
    rake db:migrate

#### As a gem
Add the following line to your config/environment.rb file:

    config.gem "uuid_it"

Then

    gem install uuid_it
    script/generate uuid_it
    rake db:migrate

### Rails 3
#### As a plugin

    rails plugin install git://github.com/aduffeck/uuid_it.git
    rails generate uuid_it
    rake db:migrate

#### As a gem
Add the following line to your Gemfile:

    gem "uuid_it"

Then

    bundle install
    rails generate uuid_it
    rake db:migrate


## Usage

    class Car < ActiveRecord::Base
      uuid_it
    end

    @car.uuid # "9e5edacc-7163-11df-92bb-2d0a2c4dcb1c"

UUIDs will be assigned to new objects when they are created. Already existing objects will get a UUID when it is accessed
for the first time.

## Credits

Copyright (c) 2010 André Duffeck, released under the MIT license
