class CommandProcessor
  def self.create(number_of_columns, number_of_rows)
    row = create_row(number_of_columns)
    insert_rows(number_of_rows, row)
  end

  private

  def self.create_row(number_of_columns)
    row = []
    number_of_columns.times do
      row << "O"
    end
    row
  end

  def self.insert_rows(number_of_rows, row)
    bitmap_array = []
    number_of_rows.times do
      bitmap_array << row
    end
    bitmap_array
  end
end
