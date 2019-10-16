
class Image
  def initialize(pixels)
    @pixels = pixels
  end

  def output_image
    @pixels.each do |pixels|
      puts pixels.join
    end
  end

  def image_blur
    coords = []

    @pixels.each_with_index do |row, x|
      row.each_with_index do |column, y|
        if column == 1
          coords << [x, y]
        end
      end
    end

    #puts coords.inspect

    #each_with_index takes two arguments: the value and the index
    #since this is an array of arrays, the first value set is the row, and it's corresponding x value
    #the second value set is the actual value in the row, and it's corresponding y value
    @pixels.each_with_index do |row, x|
      row.each_with_index do |column, y|
        coords.each do |x_coord, y_coord|
          #puts String(x_coord) << " " << String(y_coord) << "..." << String(x) << " " << String(y)
          if x_coord == x && y_coord == y
            @pixels[row[x]+1][column[y]] = 1 if row[x] + 1 <= @pixels[row[x]].length - 1
            @pixels[row[x]-1][column[y]] = 1 if row[x] - 1 >= 0
            @pixels[row[x]][column[y]+1] = 1 if column[y] + 1 <= @pixels[column[y]].length - 1
            @pixels[row[x]][column[y]-1] = 1 if column[y] - 1 >= 0
            puts String(x) << " " << String(y)
          end
        end
      end
    end
  end
end

#creating an instance of Image class
image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

 image.output_image
 image.image_blur