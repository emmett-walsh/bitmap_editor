require 'command_cleaner'

describe CommandCleaner do
  describe ".clean" do
    it "processes the \"I\" command" do
      expect(CommandCleaner.clean("I 5 6")).to eq({
        command: "I",
        number_of_columns: 5,
        number_of_rows: 6
      })
    end

    it "processes the \"L\" command" do
      expect(CommandCleaner.clean("L 12 3 A")).to eq({
        command: "L",
        column_number: 12,
        row_number: 3,
        colour: "A"
      })
    end

    it "processes the \"C\" command" do
      expect(CommandCleaner.clean("C")).to eq({ command: "C" })
    end

    it "processes the \"V\" command" do
      expect(CommandCleaner.clean("V 2 3 6 W")).to eq({
        command: "V",
        column: 2,
        start_row: 3,
        end_row: 6,
        colour: "W"
      })
    end

    it "processes the \"H\" command" do
      expect(CommandCleaner.clean("H 3 5 2 Z")).to eq({
        command: "H",
        start_column: 3,
        end_column: 5,
        row: 2,
        colour: "Z"
      })
    end

    it "process the \"S\" command" do
      expect(CommandCleaner.clean("S")).to eq({
        command: "S"
      })
    end
  end
end
