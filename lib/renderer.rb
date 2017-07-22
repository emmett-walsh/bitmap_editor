class Renderer
  def self.render(bitmap_array)
    @bitmap_string = ""
    bitmap_array.each do |row|
      insert_row(row)
    end
    @bitmap_string.chomp
  end

  private

  def self.insert_row(row)
    row.each do |pixel|
      @bitmap_string << pixel
    end
    @bitmap_string << "\n"
  end
end
