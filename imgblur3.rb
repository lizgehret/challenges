
class Image
  def initialize(pixels)
    @pixels = pixels
  end

  def output_image
    @pixels.each do |pixels|
      puts pixels.join
    end
  end

  def blur
    puts "Enter the Manhattan Distance for this Image Blur:"
    distance = gets.chomp.to_i - 1
    distance.times do 
      blur_coords
    end
  end

      #each_with_index takes two arguments: the value and the index
      #since this is an array of arrays, the first value set is the row, and it's corresponding x value
      #the second value set is the actual value in the row, and it's corresponding y value
    def blur_coords
      blur_coords = []
      @pixels.each_with_index do |row, x|
        row.each_with_index do |column, y|
          blur_coords << [x, y] if column == 1
        end
      end

      blur_coords.each do |coord|
        @pixels[coord[0]][coord[1]+1] = 1 if coord[1] + 1 <= @pixels[coord[0]].length - 1
        @pixels[coord[0]][coord[1]-1] = 1 if coord[1] - 1 >= 0
        @pixels[coord[0]+1][coord[1]] = 1 if coord[0] + 1 <= @pixels.length - 1
        @pixels[coord[0]-1][coord[1]] = 1 if coord[0] - 1 >= 0
      end
    end
end

#creating an instance of Image class
image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 1, 0, 0],
])

puts "Original Image"
image.output_image

# puts "Blurred Image"
image.blur
image.blur_coords
image.output_image

