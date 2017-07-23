class CommandCleaner
  def self.clean(command_string)
    command = command_string.split
    case command[0]
    when "I"
      return clean_i(command)
    when "L"
      return clean_l(command)
    when "C"
      return { command: "C" }
    when "V"
      return clean_v(command)
    when "H"
      return clean_h(command)
    when "S"
      return { command: "S" }
    end
  end

  private

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
