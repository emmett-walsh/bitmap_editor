require "command_cleaner"
require "command_processor"
require "renderer"

class BitmapEditor
  MAX_GRID_SIZE = 250

  def initialize(command_cleaner_class = CommandCleaner, command_processor_class = CommandProcessor, renderer_class = Renderer)
    @command_cleaner_class = command_cleaner_class
    @command_processor_class = command_processor_class
    @renderer_class = renderer_class
  end

  def run(file)
    return puts "Please provide correct file" if file_missing?(file)
    @first_command = true
    File.open(file).each do |line|
      command = @command_cleaner_class.clean(line.chomp)
      return puts "Invalid first command. List of commands must start with \"I\"" if invalid_first_command?(command)
      return puts "Calling \"I\" multiple times will clear the bitmap." if multiple_new_commands?(command)
      return puts "Invalid grid reference." if invalid_grid_reference?(command)
      case command[:command]
      when "I"
        return puts "Bitmap must be between 1 and 250 pixels." unless valid_command?(command)
        @bitmap_array = @command_processor_class.create(command[:number_of_columns], command[:number_of_rows])
      when "L"
        @bitmap_array = @command_processor_class.set_pixel(@bitmap_array, command[:column_number], command[:row_number], command[:colour])
      when "C"
        @bitmap_array = @command_processor_class.clear(@bitmap_array)
      when "V"
        @bitmap_array = @command_processor_class.draw_vertical_line(@bitmap_array, command[:column], command[:start_row], command[:end_row], command[:colour])
      when "H"
        @bitmap_array = @command_processor_class.draw_horizontal_line(@bitmap_array, command[:start_column], command[:end_column], command[:row], command[:colour])
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
    @first_command && command[:command] != "I"
  end

  def multiple_new_commands?(command)
    !@first_command && command[:command] == "I"
  end

  def invalid_grid_reference?(command)
    case command[:command]
    when "I"
      return command[:number_of_columns].to_i < 0 || command[:number_of_rows].to_i < 0
    else
      return false
    end
  end

  def valid_command?(command)
    command[:number_of_columns].to_i <= MAX_GRID_SIZE && command[:number_of_rows].to_i <= MAX_GRID_SIZE
  end
end
