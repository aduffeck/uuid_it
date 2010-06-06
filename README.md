# UuidIt

You need to assign UUIDs to your Model? Simply uuid_it by adding one line of code.

For actually generating the uuids this plugin uses spectra's ruby-uuid (http://github.com/spectra/ruby-uuid) whih is
based on ruby-uuid (http://raa.ruby-lang.org/project/ruby-uuid/).

## Installation

    script/plugin install git@github.com:aduffeck/uuid_it.git
    script/generate uuid_it


## Usage

    class Car < ActiveRecord::Base
      uuid_it
    end

    @car.uuid # "9e5edacc-7163-11df-92bb-2d0a2c4dcb1c"

## Credits

Copyright (c) 2010 André Duffeck, released under the MIT license
