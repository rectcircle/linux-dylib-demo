#include <stdio.h>

asm(".symver print_bar_a, print_bar_a@BAR_1.0");

void print_bar_a() {
    printf("libbar1.0.0 a\n");
}

void print_bar_b() {
    printf("libbar1.0.0 b\n");
}

