# Timetrap

Timetrap impelents a moving window data structure for keeping track of top-k things
as they are created (eg. tweets, exceptions in a log file, or :Q

## Installation

Add this line to your application's Gemfile:

    gem 'time_trap'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install time_trap

## Usage

    tt = TimeTrap.new
    tt.add("benedict")
    tt.add("cumberbatch")


## Contributing

1. Fork it ( http://github.com/<my-github-username>/timetrap/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
