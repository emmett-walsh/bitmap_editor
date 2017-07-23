class CommandCleaner
  def self.clean(command_string)
    command = command_string.split
    case command[0]
    when "I"
      raise "Invalid arguments." if invalid_arguments_i?(command)
      return clean_i(command)
    when "L"
      raise "Invalid arguments." if invalid_arguments_l?(command)
      return clean_l(command)
    when "C"
      raise "Invalid arguments." if invalid_arguments_c_or_s?(command)
      return { command: "C" }
    when "V"
      raise "Invalid arguments." if invalid_arguments_v_or_h?(command)
      return clean_v(command)
    when "H"
      raise "Invalid arguments." if invalid_arguments_v_or_h?(command)
      return clean_h(command)
    when "S"
      raise "Invalid arguments." if invalid_arguments_c_or_s?(command)
      return { command: "S" }
    else
      raise "Unrecognised command."
    end
  end

  private

  def self.invalid_arguments_i?(command)
    !positive_integer_string?(command[1]) || !positive_integer_string?(command[2]) || command.length != 3
  end

  def self.invalid_arguments_l?(command)
    !positive_integer_string?(command[1]) || !positive_integer_string?(command[2]) || !single_letter_string?(command[3]) || command.length != 4
  end

  def self.invalid_arguments_c_or_s?(command)
    command.length != 1
  end

  def self.invalid_arguments_v_or_h?(command)
    !positive_integer_string?(command[1]) || !positive_integer_string?(command[2]) || !positive_integer_string?(command[3]) || !single_letter_string?(command[4]) || command.length != 5
  end

  def self.positive_integer_string?(string)
    /^\d+$/.match(string)
  end

  def self.single_letter_string?(string)
    /^[A-Z]$/.match(string)
  end

  def self.clean_i(command)
    {
      command: "I",
      number_of_columns: command[1].to_i,
      number_of_rows: command[2].to_i
    }
  end

  def self.clean_l(command)
    {
      command: "L",
      column_number: command[1].to_i,
      row_number: command[2].to_i,
      colour: command[3]
    }
  end

  def self.clean_v(command)
    {
      command: "V",
      column: command[1].to_i,
      start_row: command[2].to_i,
      end_row: command[3].to_i,
      colour: command[4]
    }
  end

  def self.clean_h(command)
    {
      command: "H",
      start_column: command[1].to_i,
      end_column: command[2].to_i,
      row: command[3].to_i,
      colour: command[4]
    }
  end
end
