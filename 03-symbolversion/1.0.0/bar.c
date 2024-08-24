#include <stdio.h>
#include <bar.h>

asm(".symver __print_bar_a_1_0,print_bar_a@@BAR_1.0");
void __print_bar_a_1_0() {
    printf("libbar1.0.0 a\n");
}


void print_bar_b() {
    printf("libbar1.0.0 b\n");
}

