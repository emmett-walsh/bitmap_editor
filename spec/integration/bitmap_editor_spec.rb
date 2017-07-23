require "bitmap_editor"

describe "Bitmap editor" do
  let(:white_bitmap) do
    "OOOOO\n"\
    "OOOOO\n"\
    "OOOOO\n"\
    "OOOOO\n"\
    "OOOOO\n"\
    "OOOOO"
  end

  let(:change_pixel_bitmap) do
    "OOOOO\n"\
    "OOOOO\n"\
    "AOOOO\n"\
    "OOOOO\n"\
    "OOOOO\n"\
    "OOOOO"
  end

  it "creates a new bitmap" do
    new_bitmap_file_path = File.join(File.expand_path(Dir.pwd), "/examples/show.txt")
    expect(BitmapEditor.new.run(new_bitmap_file_path)).to eq white_bitmap
  end

  it "can change the colour of a specified pixel" do
    change_pixel_file_path = File.join(File.expand_path(Dir.pwd), "/examples/change_pixel.txt")
    expect(BitmapEditor.new.run(change_pixel_file_path)).to eq change_pixel_bitmap
  end
end
