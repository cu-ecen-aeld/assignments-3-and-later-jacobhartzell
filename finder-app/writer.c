#include <syslog.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

void main(int argc, char *argv[])
{
    int fd;

    if ( 3 != argc )
    {
       printf("Usage: writer fliename string\n");
       return;
    }

    fd = creat(argv[1], O_CREAT | O_TRUNC);

    if (fd == -1)
    {
	    printf("error opening file\n");
	    return;
    }


    openlog (NULL,0,LOG_USER); 
    syslog (LOG_ERR,"Writing %s to %s", argv[2], argv[1]);

 //    write(fd, argv[2], strlen(argv[2]));
//    write(fd, "\n", 1);

    close(fd);
    closelog();

}
