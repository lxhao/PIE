#include "bm_oopsla.h"

int main(int argc, char * argv[]) {
  RECORD(7, a, b, x, y, s, t, flag);

  INIT_flag(unknown1);

  t = 0;
  s = 0;
  a = 0;
  b = 0;

  while (unknown1()) {
    a++;
    b++;
    s += a;
    t += b;
    if (flag == 1) {
      t += a;
    }
    t = t;
  }
  // 2s >= t
  x = 1;
  if (flag) {
    x = t - 2 * s + 2;
  }
  // x <= 2
  y = 0;
  while (y <= x) {
    if (unknown2())
      y++;
    else
      y += 2;
    y = y;
  }

  assert(y < 5);
}
