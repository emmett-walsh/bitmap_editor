require "command_processor"

describe CommandProcessor do
  describe ".create" do
    let(:five_by_six_white_array) do
      [
        ["O","O","O","O","O"],
        ["O","O","O","O","O"],
        ["O","O","O","O","O"],
        ["O","O","O","O","O"],
        ["O","O","O","O","O"],
        ["O","O","O","O","O"]
      ]
    end

    let(:two_by_three_white_array) do
      [
        ["O","O"],
        ["O","O"],
        ["O","O"]
      ]
    end

    it "creates a white grid" do
      expect(CommandProcessor.create(5,6)).to eq five_by_six_white_array
    end

    it "creates a white grid of any specified size" do
      expect(CommandProcessor.create(2,3)).to eq two_by_three_white_array
    end
  end
end
