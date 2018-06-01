require 'bunny'

config = {
  host: '152.118.148.103',
  port: '5672',
  vhost: '/1406573822',
  user: '1406573822',
  password: '1406573822'
}
connection = Bunny.new(config)
connection.start

channel = connection.create_channel
exchange = channel.fanout('PING')

message = ARGV.empty? ? 'Hello World!' : ARGV.join(' ')

exchange.publish(message)
puts " [x] Sent #{message}"

connection.close
