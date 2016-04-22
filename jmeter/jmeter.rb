#!/usr/bin/ruby
# Example: ruby flood.rb

require 'rubygems'
require 'ruby-jmeter'

HOST = '127.0.0.1'
PROTOCOL = 'http'
PORT = '3000'

test do

	# count: 		number of users to simulate
	# loop:  		number of time to repeat test procedure, in this case -1 is used so that duration will be used instead
	# ramp:  		time in seconds to start up all jmeter threads
	# scheduler: 		enable or disable jmeter scheduler configurations
	# duration: 		duration of the performance test in seconds
	# on_sample_error: 	choose what will happen when a sample error occurs, in this case move on to the next loop
	threads :count => 2, :loops => 5, :rampup => 60, :scheduler => true, :duration => 300, :delay => 0, :on_sample_error => "startnextloop" do

	# setup configs
	defaults({
	:domain => HOST, :protocol => PROTOCOL, :port => PORT,
	:connect_timeout => '60', :response_timeout => '60'
	})

	# http request to API, using the test sinatra api created for this post
	visit name: 'Test Home Page', url: '/'

	# pause time in milliseconds
	think_time 200

	end
end.run(
	# debug mode
	debug: true,
	# path/name for the JMX file
	file: "jmeter/results/perf_test.jmx",
	# path/name to output JMeter logs
	log: "jmeter/results/perf_test_results.log",
	# path/name for JMeter results
	jtl: "jmeter/results/perf_test_results.jtl"
)
