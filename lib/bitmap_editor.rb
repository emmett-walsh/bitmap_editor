require "command_processor"
require "renderer"

class BitmapEditor
  def initialize(command_processor_class = CommandProcessor, renderer_class = Renderer)
    @command_processor_class = command_processor_class
    @renderer_class = renderer_class
  end

  def run(file)
    return puts "Please provide correct file" if file_missing?(file)
    @first_command = true
    File.open(file).each do |line|
      command = line.chomp.split
      return puts "Invalid first command. List of commands must start with \"I\"" if invalid_first_command?(command)
      return puts "Calling \"I\" multiple times will clear the bitmap." if multiple_new_commands?(command)
      case command[0]
      when "I"
        return puts "Bitmap must be between 1 and 250 pixels." unless valid_command?(command)
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
        return puts "unrecognised command :("
      end
      @first_command = false
    end
  end

  private

  def file_missing?(file)
    file.nil? || !File.exists?(file)
  end

  def invalid_first_command?(command)
    @first_command && command[0] != "I"
  end

  def multiple_new_commands?(command)
    !@first_command && command[0] == "I"
  end

  def valid_command?(command)
    command[1].to_i <= 250 && command[2].to_i <= 250
  end
end
