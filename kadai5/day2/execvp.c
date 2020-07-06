//execvp.c 辰川力駆
#include <unistd.h>
#include <stdio.h>

int main()
{
    char *const argv[] = {"cal", "2020", NULL};
    execvp(argv[0], argv);
    return 0;
}