require 'rclrb'

require 'example_interfaces/srv'

class MinimalClientAsync < Rclrb::Node
  def initialize()
    super('minimal_client_async')
    @client = self.create_client ExampleInterfaces::Srv::AddTwoInts, 'add_two_ints'
    until @client.wait_for_service timeout_sec = 1.0
      puts 'service not available, waiting again...'
    end
  end
  def send_request(a, b)
    req = ExampleInterfaces::Srv::AddTwoInts::Request.new
    req.a = a
    req.b = b
    future = @client.call_async(req)
    return future.result
  end
end

def main(args)
  Rclrb.init(arguments: args)
  minimal_client = MinimalClientAsync.new()
  response = minimal_client.send_request(ARGV[0].to_i, ARGV[1].to_i())
  puts "Result of add_two_ints: for #{ARGV[0]} + #{ARGV[1]} = #{response.sum}' "
end

if $0 == __FILE__
  main(ARGV)
end
