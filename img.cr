struct RGBPixel
  property red, blue, green, alpha

  def initialize(@red : UInt8 = 0, @blue : UInt8 = 0, @green : UInt8 = 0, @alpha : UInt8 = 255)
  end

  def set_red(r)
    @red = r
    self
  end

  def set_green(r)
    @green = r
    self
  end

  def set_blue(r)
    @blue = r
    self
  end
end

def image_ramp_green(n)
  img = Array.new(n) { RGBPixel.new }
  f = (255/(n - 1))
  # puts f
  (0...n).each do |i|
    img[i] = img[i].set_green((i.to_f * f).to_u8!)
  end
  img
end

def image_to_gray(img, n)
  (0...n).each do |i|
    y = (0.3 * img[i].red + 0.59 * img[i].green + 0.11 * img[i].blue).to_u8!

    imgi = img[i].set_red(y)
    imgi = imgi.set_green(y)
    img[i] = imgi.set_blue(y)
    # puts img[i].green
  end
end

N = 400 * 400
img = image_ramp_green(N)
(0...1000).each { image_to_gray(img, N) }
