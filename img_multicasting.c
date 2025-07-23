#include <stdint.h>
#include <stdlib.h>

typedef struct {
  uint8_t red;
  uint8_t green;
  uint8_t blue;
  uint8_t alpha;
} rgba_pixel;

rgba_pixel *image_ramp_green(int n) {
  rgba_pixel *img = calloc(n, sizeof(rgba_pixel));
  float f = 255.0 / (float)(n - 1);
  for (int i = 0; i < n; i++) {
    img[i].green = (int)((float)i * f);
    img[i].alpha = 255;
  }
  return img;
}

void image_to_grey(rgba_pixel *img, int n) {
  for (int i = 0; i < n; i++) {
    float y = (0.3 * (float)img[i].red + 0.59 * (float)img[i].green +
               0.1 * (float)img[i].blue);
    img[i].red = (int)y;
    img[i].green = (int)y;
    img[i].blue = (int)y;
  }
}

int main(void) {
  int n = 400 * 400;
  rgba_pixel *img = image_ramp_green(n);
  for (int i = 0; i < 1000; i++) {
    image_to_grey(img, n);
  }
  return EXIT_SUCCESS;
}
