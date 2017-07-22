require "renderer"

describe Renderer do
  let(:two_by_three_bitmap_array) do
    [
      ["O","O"],
      ["O","O"],
      ["O","O"]
    ]
  end

  let(:two_by_two_bitmap_array) do
    [
      ["O","O"],
      ["O","O"]
    ]
  end

  let(:two_by_three_grid_string) do
    "OO\n"\
    "OO\n"\
    "OO"
  end
  
  let(:two_by_two_grid_string) do
    "OO\n"\
    "OO"
  end

  it "converts a given array to a grid-string" do
    expect(Renderer.render(two_by_three_bitmap_array)).to eq two_by_three_grid_string
  end

  it "converts a given array to a grid-string of any given size" do
    expect(Renderer.render(two_by_two_bitmap_array)).to eq two_by_two_grid_string
  end
end
