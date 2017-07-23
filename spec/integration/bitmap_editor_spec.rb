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

  let(:vertical_line_bitmap) do
    "OOOOO\n"\
    "OOOOO\n"\
    "OWOOO\n"\
    "OWOOO\n"\
    "OWOOO\n"\
    "OWOOO"
  end

  let(:horizontal_line_bitmap) do
    "OOOOO\n"\
    "OOZZZ\n"\
    "OOOOO\n"\
    "OOOOO\n"\
    "OOOOO\n"\
    "OOOOO"
  end

  let(:big_bitmap) do
    "OOOOOOOOOOOOOOO\n"\
    "OOOOOOOOOOOOOOO\n"\
    "OOOOOOOOOOOOOOO\n"\
    "OOOOOOOOOOOOOOO\n"\
    "OOOOOOOOOOOOOOO\n"\
    "OOOOOOOOOOOOOOO\n"\
    "OOOOOOOOOOOOOOO\n"\
    "OOOOOOOOOOOOOOO\n"\
    "OOOOOOOOOOOOOOO\n"\
    "OOOOOOOOOOOOOOO\n"\
    "OOOOOOOOOOOOOOO\n"\
    "OOOOOOOOOOOOOOO\n"\
    "OOOOOOOOOOOOOOO\n"\
    "OOOOOOOOOOOOOOO\n"\
    "OOOOOOOOOOOOOOO"
  end

  it "creates a new bitmap" do
    new_bitmap_file_path = File.join(File.expand_path(Dir.pwd), "/examples/display.txt")
    expect(BitmapEditor.new.run(new_bitmap_file_path)).to eq white_bitmap
  end

  it "can change the colour of a specified pixel" do
    change_pixel_file_path = File.join(File.expand_path(Dir.pwd), "/examples/change_pixel.txt")
    expect(BitmapEditor.new.run(change_pixel_file_path)).to eq change_pixel_bitmap
  end

  it "clears a bitmap, setting all pixels to white" do
    clear_bitmap_file_path = File.join(File.expand_path(Dir.pwd), "/examples/clear.txt")
    expect(BitmapEditor.new.run(clear_bitmap_file_path)).to eq white_bitmap
  end

  it "draws a vertical line of colour between specified pixels" do
    vertical_line_file_path = File.join(File.expand_path(Dir.pwd), "/examples/vertical_line.txt")
    expect(BitmapEditor.new.run(vertical_line_file_path)).to eq vertical_line_bitmap
  end

  it "draws a horizontal line of colour between specified pixels" do
    horizontal_line_file_path = File.join(File.expand_path(Dir.pwd), "/examples/horizontal_line.txt")
    expect(BitmapEditor.new.run(horizontal_line_file_path)).to eq horizontal_line_bitmap
  end

  it "can process large bitmaps" do
    big_bitmap_file_path = File.join(File.expand_path(Dir.pwd), "/examples/big_bitmap.txt")
    expect(BitmapEditor.new.run(big_bitmap_file_path)).to eq big_bitmap
  end
end
