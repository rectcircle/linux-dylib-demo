#include <stdio.h>
#include <bar.h>

asm(".symver __print_bar_a_1_0,print_bar_a@BAR_1.0");
void __print_bar_a_1_0() {
    printf("libbar1.0.0 a\n");
}

asm(".symver __print_bar_a_1_1,print_bar_a@@BAR_1.1");
void __print_bar_a_1_1() {
    printf("libbar1.1.0 a\n");
}


asm(".symver __print_bar_b_1_0,print_bar_b@BAR_1.0");
void __print_bar_b_1_0() {
    printf("libbar1.0.0 b\n");
}

asm(".symver __print_bar_b_1_1,print_bar_b@@BAR_1.1");
void __print_bar_b_1_1() {
    printf("libbar1.1.0 b\n");
}


void print_bar_c() {
    printf("libbar1.1.0 c\n");
}

void print_bar_d() {
    printf("libbar1.1.0 d\n");
}
