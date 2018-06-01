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

queue = channel.queue('hello')
channel.default_exchange.publish('Hello World!', routing_key: queue.name)
puts "Sent 'Hello World!'"

connection.close
