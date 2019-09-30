# AL5D-LYNX-Simulator
AL5D LYNX simulatior on V-REP using C v1.0 BETA

## User Guide

1. Download the V-REP PLAYER in [this page](http://www.coppeliarobotics.com/downloads.html) 
2. Access the V-REP PLAYER folder and run V-REP:
```
user@host:~/V-REP_PLAYER$ ./vrep.sh
```
3. Click **File ---> Open scene**. Browse the repository folder **AL5D-LYNX-Simulator ---> scene**, and choose the file *al5d_lynx.ttt*.
4. Push the **Start/resume simulation** button at the top of the screen.
5. Browse the repository folder **AL5D-LYNX-Simulator ---> build**. In terminal, run *cmake* and *make* commands as shown below:
```
user@host:~/AL5D-LYNX-Simulator/build$ cmake ../

user@host:~/AL5D-LYNX-Simulator/build$ make

```
6. Now, run the *demo* application:

```
user@host:~/AL5D-LYNX-Simulator/build$ ./demo

```
7. If you make any changes in the *demo.c* file you need to **repeat step 5**.
