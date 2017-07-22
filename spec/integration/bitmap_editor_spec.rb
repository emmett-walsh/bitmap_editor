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

  it "creates a new bitmap" do
    new_bitmap_file_path = File.join(File.expand_path(Dir.pwd), "/examples/show.txt")
    expect(BitmapEditor.new.run(new_bitmap_file_path)).to eq white_bitmap
  end
end
