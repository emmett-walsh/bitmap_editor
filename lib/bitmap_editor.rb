require "command_processor"
require "renderer"

class BitmapEditor
  def initialize(command_processor_class = CommandProcessor, renderer_class = Renderer)
    @command_processor_class = command_processor_class
    @renderer_class = renderer_class
  end

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      command = line.chomp.split
      case command[0]
      when "I"
        @bitmap_array = @command_processor_class.create(command[1].to_i, command[2].to_i)
      when "L"
        @bitmap_array = @command_processor_class.set_pixel(@bitmap_array, command[1].to_i, command[2].to_i, command[3])
      when "C"
        @bitmap_array = @command_processor_class.clear(@bitmap_array)
      when "V"
        @bitmap_array = @command_processor_class.draw_vertical_line(@bitmap_array, command[1].to_i, command[2].to_i, command[3].to_i, command[4])
      when "H"
        @bitmap_array = @command_processor_class.draw_horizontal_line(@bitmap_array, command[1].to_i, command[2].to_i, command[3].to_i, command[4])
      when "S"
        return @renderer_class.render(@bitmap_array)
      else
        puts "unrecognised command :("
      end
    end
  end
end
