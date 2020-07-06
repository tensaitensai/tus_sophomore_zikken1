//shell-1.c 辰川力駆
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
//#include<sys/types.h>
//#include<sys/wait.h>

#define MAX_LINE_IN 1000

int main(int argc, char *argv[])
{
    int pid, status;
    char line_in[MAX_LINE_IN];

    for (;;)
    {
        printf("> ");
        if (fgets(line_in, MAX_LINE_IN, stdin) == NULL)
            exit(0);
        line_in[strlen(line_in) - 1] = '\0';
        printf("%s\n", line_in);
    }

    return 0;
}