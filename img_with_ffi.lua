local ffi = require("ffi")

ffi.cdef([[
typedef struct { uint8_t red, green, blue, alpha;} rgba_pixel;
]])

local function image_ramp_green(n)
	local img = ffi.new("rgba_pixel[?]", n)
	local f = 255 / (n - 1)
	for i = 1, n do
		img[i].green = i * f
		img[i].alpha = 255
	end
	return img
end

local function image_to_gray(img, n)
	for i = 1, n do
		local y = 0.3 * img[i].red + 0.59 * img[i].green + 0.11 * img[i].blue
		img[i].red = y
		img[i].blue = y
		img[i].green = y
	end
end

local N = 400 * 400
local img = image_ramp_green(N)
for i = 1, 1000 do
	image_to_gray(img, N)
end
