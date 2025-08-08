record RGBPixel, red : UInt8 = 0, green : UInt8 = 0, blue : UInt8 = 0, alpha : UInt8 = 255

def image_ramp_green(n)
  img = Slice.new(n) { RGBPixel.new }
  f = (255/(n - 1))
  (0...n).each do |i|
    img.update(i, &.copy_with(green: (i * f).to_u8!))
  end
  img
end

def image_to_gray(img, n)
  (0...n).each do |i|
    y = (0.3 * img[i].red + 0.59 * img[i].green + 0.11 * img[i].blue).to_u8!
    img.update(i, &.copy_with(red: y, green: y, blue: y))
  end
end

N = 400 * 400
img = image_ramp_green(N)
(0...1000).each { image_to_gray(img, N) }
