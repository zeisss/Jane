require 'rubygems'
require 'net/ping'

include Net

Ping::TCP.service_check = true

hosts = ['192.168.2.109', '192.168.1.999']
threads = []
ping_objects = []

hosts.each do |ip|
   ping_objects << Net::Ping::TCP.new(ip)
   threads << Thread.new(ip, ping_objects.last) do |ip, p|
     loop do
     	if hosts[0] || hosts [1]
     		puts 'execute command'
     	end
       sleep 2
     end
   end
end
threads.each { |th| th.join }

