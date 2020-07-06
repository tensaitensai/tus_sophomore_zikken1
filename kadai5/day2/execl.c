//execl.c 辰川力駆
#include <unistd.h>
#include <stdio.h>

int main()
{
    execl("/usr/bin/cal", "name", "2020", (char *)0);
    return 0;
}