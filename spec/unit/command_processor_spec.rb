require "command_processor"

describe CommandProcessor do
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

  describe ".create" do
    it "creates a white grid" do
      expect(CommandProcessor.create(5,6)).to eq five_by_six_white_array
    end

    it "creates a white grid of any specified size" do
      expect(CommandProcessor.create(2,3)).to eq two_by_three_white_array
    end
  end

  describe ".set_pixel" do
    let(:five_by_six_set_pixel_array) do
      [
        ["O","O","O","O","O"],
        ["O","O","O","O","O"],
        ["A","O","O","O","O"],
        ["O","O","O","O","O"],
        ["O","O","O","O","O"],
        ["O","O","O","O","O"]
      ]
    end

    let(:two_by_three_set_pixel_array) do
      [
        ["A","O"],
        ["O","O"],
        ["O","O"]
      ]
    end

    it "sets the colour of a specified pixel" do
      expect(CommandProcessor.set_pixel(five_by_six_white_array, 1, 3, 'A')).to eq five_by_six_set_pixel_array
    end

    it "sets the colour of any specified pixel" do
      expect(CommandProcessor.set_pixel(two_by_three_white_array, 1, 1, 'A')).to eq two_by_three_set_pixel_array
    end
  end
end
