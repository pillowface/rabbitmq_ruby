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
queue = channel.queue('', exclusive: true)

queue.bind(exchange)

puts ' [*] Waiting for logs. To exit press CTRL+C'

begin
  queue.subscribe(block: true) do |_delivery_info, _properties, body|
    puts " [x] #{body}"
  end
rescue Interrupt => _
  channel.close
  connection.close
end
