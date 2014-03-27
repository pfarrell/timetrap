# TimeTrap

TimeTrap impelents a moving window data structure for keeping track of top-k things
as they are created (eg. tweets, exceptions in a log file, or :Q

## Installation

|||
|---|---|
|bundler|gem 'time_trap'|
|raw gem|gem install time_trap|

## Usage

    tt = TimeTrap.new
    tt.add("benedict")
    tt.add("cumberbatch")
