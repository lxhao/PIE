#include "bm_oopsla.h"

int main() {
  int k = 1, w = 1;
  INITIALIZE(2, k, w);

  while(unknown1()) {
    PRINT_VARS();
    /*
    int z = unknown2();
    if(z > 5) w++;
    */
    if(unknown2()) w++;
    k += w;
  }
  PRINT_VARS();

  assert(k > 0);
  return 0;
}