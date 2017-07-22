require "command_processor"
require "renderer"

class BitmapEditor
  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      command = line.chomp
      case command[0]
      when "I"
        @bitmap_array = CommandProcessor.create(command[2].to_i, command[4].to_i)
      when "S"
        return Renderer.render(@bitmap_array)
      else
        puts "unrecognised command :("
      end
    end
  end
end
