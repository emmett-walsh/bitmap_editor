require "bitmap_editor"

describe "Bitmap editor" do
  let(:bitmap_editor) { BitmapEditor.new }
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
    expect(bitmap_editor.run(new_bitmap_file_path)).to eq white_bitmap
  end

  it "can change the colour of a specified pixel" do
    change_pixel_file_path = File.join(File.expand_path(Dir.pwd), "/examples/change_pixel.txt")
    expect(bitmap_editor.run(change_pixel_file_path)).to eq change_pixel_bitmap
  end

  it "clears a bitmap, setting all pixels to white" do
    clear_bitmap_file_path = File.join(File.expand_path(Dir.pwd), "/examples/clear.txt")
    expect(bitmap_editor.run(clear_bitmap_file_path)).to eq white_bitmap
  end

  it "draws a vertical line of colour between specified pixels" do
    vertical_line_file_path = File.join(File.expand_path(Dir.pwd), "/examples/vertical_line.txt")
    expect(bitmap_editor.run(vertical_line_file_path)).to eq vertical_line_bitmap
  end

  it "draws a horizontal line of colour between specified pixels" do
    horizontal_line_file_path = File.join(File.expand_path(Dir.pwd), "/examples/horizontal_line.txt")
    expect(bitmap_editor.run(horizontal_line_file_path)).to eq horizontal_line_bitmap
  end

  it "can process large bitmaps" do
    big_bitmap_file_path = File.join(File.expand_path(Dir.pwd), "/examples/big_bitmap.txt")
    expect(bitmap_editor.run(big_bitmap_file_path)).to eq big_bitmap
  end

  it "only accepts \"I\" as first command" do
    wrong_first_command_file_path = File.join(File.expand_path(Dir.pwd), "/examples/wrong_first_command.txt")
    expect(STDOUT).to receive(:puts).with("Invalid first command. List of commands must start with \"I\"")
    bitmap_editor.run(wrong_first_command_file_path)
  end

  it "won't accept \"I\" after first command" do
    multiple_new_commands_file_path = File.join(File.expand_path(Dir.pwd), "/examples/multiple_new_commands.txt")
    expect(STDOUT).to receive(:puts).with("Calling \"I\" multiple times will clear the bitmap.")
    bitmap_editor.run(multiple_new_commands_file_path)
  end

  it "limits grid size to 250 x 250 pixels" do
    oversize_bitmap_file_path = File.join(File.expand_path(Dir.pwd), "/examples/oversize_bitmap.txt")
    expect(STDOUT).to receive(:puts).with("Bitmap must be between 1 and 250 pixels.")
    bitmap_editor.run(oversize_bitmap_file_path)
  end

  it "rejects grid references less than 1 for \"I\" command" do
    negative_grid_reference_file_path = File.join(File.expand_path(Dir.pwd), "/examples/negative_grid_reference.txt")
    expect(STDOUT).to receive(:puts).with("Invalid grid reference.")
    bitmap_editor.run(negative_grid_reference_file_path)
  end
end
