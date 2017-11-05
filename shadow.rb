require 'pp'
require 'json'
require 'redis'

unless defined? $r
  $r = Redis.new :host => "172.16.0.240", :port => 6379
end


last = 0

while true 
  cur = $r.llen('MCC_SCT_VIP_REDIS_LISTENER_KEY').to_i
  puts cur
  if cur != 0 and cur == last
    puts `sh -x shadow.sh; ps -ef | grep mcc-22-shadow-1`
    puts "loop ********************************retsart *********"
  end
  last = cur

  sleep 10
end
