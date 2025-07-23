struct RGBPixel
  property red, blue, green, alpha

  def initialize(@red : UInt8 = 0, @blue : UInt8 = 0, @green : UInt8 = 0, @alpha : UInt8 = 255)
  end
end

def image_ramp_green(n)
  img = Array.new(n) { RGBPixel.new }
  f = (255/(n - 1)).to_u8
  (0...n).each { |i| img[i].green = (i * f).to_u8 }
  img
end

def image_to_gray(img, n)
  (0...n).each do |i|
    y = (0.3 * img[i].red + 0.59 * img[i].green + 0.11 * img[i].blue).to_u8
    img[i].red = y
    img[i].green = y
    img[i].blue = y
  end
end

N = 400 * 400
img = image_ramp_green(N)
(0...1000).each { image_to_gray(img, N) }
