
class Image
  def initialize(pixels)
    @pixels = pixels
  end

  def output_image
    @pixels.each do |pixels|
      # transform array into string with no specified separator
      puts pixels.join
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