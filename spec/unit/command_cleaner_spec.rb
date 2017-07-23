require 'command_cleaner'

describe CommandCleaner do
  describe ".clean" do
    it "guards against unknown commands" do
      expect { CommandCleaner.clean("Y") }.to raise_error("Unrecognised command.")
    end

    it "processes the \"I\" command" do
      expect(CommandCleaner.clean("I 5 6")).to eq({
        command: "I",
        number_of_columns: 5,
        number_of_rows: 6
      })
    end

    it "guards against invalid arguments for the \"I\" command" do
      expect { CommandCleaner.clean("I dog tree") }.to raise_error("Invalid arguments.")
    end

    it "guards against wrong number of arguments for the \"I\" command" do
      expect { CommandCleaner.clean("I 5 6 4") }.to raise_error("Invalid arguments.")
    end

    it "processes the \"L\" command" do
      expect(CommandCleaner.clean("L 12 3 A")).to eq({
        command: "L",
        column_number: 12,
        row_number: 3,
        colour: "A"
      })
    end

    it "guards against invalid arguments for the \"L\" command" do
      expect { CommandCleaner.clean("L 1 2 YS") }.to raise_error("Invalid arguments.")
    end

    it "guards against wrong number of arguments for the \"L\" command" do
      expect { CommandCleaner.clean("L 5 6 Y 5") }.to raise_error("Invalid arguments.")
    end

    it "processes the \"C\" command" do
      expect(CommandCleaner.clean("C")).to eq({ command: "C" })
    end

    it "guards against wrong number of arguments for the \"C\" command" do
      expect { CommandCleaner.clean("C 1") }.to raise_error("Invalid arguments.")
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

    it "guards against invalid arguments for the \"V\" command" do
      expect { CommandCleaner.clean("V 1 2 3 YS") }.to raise_error("Invalid arguments.")
    end

    it "guards against wrong number of arguments for the \"V\" command" do
      expect { CommandCleaner.clean("V 1 3 4 A 4") }.to raise_error("Invalid arguments.")
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

    it "guards against invalid arguments for the \"H\" command" do
      expect { CommandCleaner.clean("H 1 2 3 YS") }.to raise_error("Invalid arguments.")
    end

    it "guards against wrong number of arguments for the \"H\" command" do
      expect { CommandCleaner.clean("H 1 3 4 A 4") }.to raise_error("Invalid arguments.")
    end

    it "processes the \"S\" command" do
      expect(CommandCleaner.clean("S")).to eq({
        command: "S"
      })
    end

    it "guards against wrong number of arguments for the \"S\" command" do
      expect { CommandCleaner.clean("S 1") }.to raise_error("Invalid arguments.")
    end
  end
end
