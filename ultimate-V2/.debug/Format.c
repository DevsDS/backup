/*=============================================================================
#
#        Author : shmily - shmily@mail.dlut.edu.cn
#            QQ : 723103903
# Last modified : 2013-01-10 18:21
#      Filename : Format.c
#   Description : not thing...
#
=============================================================================*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <memory.h>
#include <string.h>

void GetStream(FILE *fp, char *pbuff);

int main(int argc, char ** argv)
{
    FILE *fp;
    FILE *fpstream;
    char buff[2048];

    if(argc!=3){ 
        printf("input error!\n");
        return 1;
    }

    fp = fopen(argv[2], "w");
    fpstream = fopen(argv[1], "r");

    memset(buff, '\0', 2048);

    GetStream(fpstream, buff);

    fprintf(fp, "{\n");
    fprintf(fp, "%s", buff);
    fprintf(fp, "};\n");

    fclose(fp);
    fclose(fpstream);

    return 0;
}

void GetStream(FILE *fp, char *pbuff)
{
    char ch;
    int  count;

    count = 0;
    while(1)
    {
        ch = getc(fp);

        if(ch == EOF)  break;
        if((ch==' ')||(ch==0x0a)){
            *(pbuff++) = ',';
            *(pbuff++) = ' ';
            count++;

            if((count)%16==0) {
                *(pbuff++) = '\n';
            }

            *(pbuff++) = '0';
            *(pbuff++) = 'x';
          
        }else{ 
            *(pbuff++) = ch;
        }
    }
}
