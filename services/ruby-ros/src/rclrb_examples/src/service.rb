require 'rclrb'

require 'example_interfaces/srv'

class MinimalService < Rclrb::Node
  def initialize
    super('minimal_service')
    self.create_service(ExampleInterfaces::Srv::AddTwoInts, 'add_two_ints') do |request, response|
      response.sum = request.a + request.b
      puts("Incoming request\na: #{request.a} b: #{request.b}")
    end
  end
end

def main(args)
  Rclrb.init(arguments: args)
  Rclrb.spin(MinimalService.new())
end

if $0 == __FILE__
  main(ARGV)
end
