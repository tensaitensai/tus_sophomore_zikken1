//ex5-1.c 辰川力駆
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>

#define MAX_LINE_IN 1000
#define MAX_ARGS 30

int main(int argc, char *argv[])
{
    int pid, status;
    char line_in[MAX_LINE_IN];
    char *args[MAX_ARGS];
    int nargs;

    //tokenize
    for (;;)
    {
        printf("> ");
        if (fgets(line_in, MAX_LINE_IN, stdin) == NULL)
            exit(0);
        line_in[strlen(line_in) - 1] = '\0';

        char *token = strtok(line_in, " ");
        nargs = 0;
        args[nargs++] = token;
        while (token != NULL)
        {
            if (token != NULL)
            {
                token = strtok(NULL, " ");
                args[nargs++] = token;
            }
        }

        args[nargs] = '\0';

        execvp(args[0], args);
    }
    return 0;
}