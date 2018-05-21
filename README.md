# gnu-parallel-yourself
Template script and instructions for using GNU Parallel in place of the TACC Launcher on Stampede2.

Documentation on GNU Parallel: https://www.gnu.org/software/parallel/

Handy information for using GNU Parallel on a cluster: https://www.msi.umn.edu/support/faq/how-can-i-use-gnu-parallel-run-lot-commands-parallel

## Prerequisites
GNU Parallel is not supported by TACC so it must be built. The 'Personal installation' method shown here will work on Stampede2: https://github.com/martinda/gnu-parallel.
```
wget http://ftpmirror.gnu.org/parallel/parallel-latest.tar.bz2
bzip2 -dc parallel-*.tar.bz2 | tar xvf -
cd parallel-*
./configure --prefix=$HOME && make && make install
```
Add the $HOME/bin directory to your PATH variable and source `env_parallel.bash` in `.bashrc`.
```
...
export PATH="$HOME/bin:$PATH"
. $(which env_parallel.bash)
```

## Installation
To get an idea of how to use GNU Parallel clone this repository to some directory on Stampede2:
```
 git clone git@github.com:hurwitzlab/gnu-parallel-yourself.git
```

Replace `<developer>@email.arizona.edu` with your email address on the following line of `gnu_parallel_stampede2.job`:
```
#SBATCH --mail-user <developer>@email.arizona.edu
```

### Submit gnu_parallel_stampede2.slurm to a single node
Submit `gnu_parallel_stampede2.slurm` to SLURM with `-N 1` to get 1 node.
```
[imicrobe@login3:/work/05066/imicrobe/stampede2/jklynch/gnu-parallel-yourself]$ sbatch -N 1 gnu_parallel_stampede2.slurm

-----------------------------------------------------------------
          Welcome to the Stampede2 Supercomputer
-----------------------------------------------------------------

No reservation for this job
--> Verifying valid submit host (login3)...OK
--> Verifying valid jobname...OK
--> Enforcing max jobs per user...OK
--> Verifying availability of your home dir (/home1/05066/imicrobe)...OK
--> Verifying availability of your work dir (/work/05066/imicrobe/stampede2)...OK
--> Verifying availability of your scratch dir (/scratch/05066/imicrobe)...OK
--> Verifying valid ssh keys...OK
--> Verifying access to desired queue (skx-normal)...OK
--> Verifying job request is within current queue limits...OK
--> Checking available allocation (iPlant-Collabs)...OK
Submitted batch job 1462910
[imicrobe@login3:/work/05066/imicrobe/stampede2/jklynch/gnu-parallel-yourself]$ squeue -u imicrobe
             JOBID   PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
           1462910  skx-normal gnu-para imicrobe  R       0:07      1 c476-001
[imicrobe@login3:/work/05066/imicrobe/stampede2/jklynch/gnu-parallel-yourself]$ ls -l
total 28
-rw------- 1 imicrobe G-818024  874 May 20 21:19 gnu_parallel_stampede2.slurm
-rw------- 1 imicrobe G-818024 2920 May 20 21:27 gnu-parallel-yourself.job.o1462910
-rw------- 1 imicrobe G-818024  368 May 20 16:27 joblist
-rw------- 1 imicrobe G-818024 1068 May 20 15:59 LICENSE
-rw------- 1 imicrobe G-818024    9 May 20 21:27 nodelist
-rw------- 1 imicrobe G-818024  810 May 20 21:27 paralleljobs.log
-rw------- 1 imicrobe G-818024 1312 May 20 15:59 README.md
```

When the job completes you will have a file named something like `gnu-parallel-yourself.job.o1462910` which shows what happened. See file `paralleljobs.log` for information on each job, e.g.:

```
Seq     Host    Starttime       JobRuntime      Send    Receive Exitval Signal  Command
2       c476-001        1526869641.976       1.631      0       359     0       0       sleep 1 && ls -l $HOME  && echo $SLURM_NODEID
1       c476-001        1526869641.960       1.664      0       359     0       0       sleep 1 && ls -l $HOME  && echo $SLURM_NODEID
3       c476-001        1526869641.990       1.648      0       359     0       0       sleep 1 && ls -l $HOME  && echo $SLURM_NODEID
4       c476-001        1526869642.005       1.648      0       359     0       0       sleep 1 && ls -l $HOME  && echo $SLURM_NODEID
6       c476-001        1526869643.639       1.508      0       359     0       0       sleep 1 && ls -l $HOME  && echo $SLURM_NODEID
5       c476-001        1526869643.624       1.523      0       359     0       0       sleep 1 && ls -l $HOME  && echo $SLURM_NODEID
8       c476-001        1526869643.669       1.496      0       359     0       0       sleep 1 && ls -l $HOME  && echo $SLURM_NODEID
7       c476-001        1526869643.654       1.543      0       359     0       0       sleep 1 && ls -l $HOME  && echo $SLURM_NODEID
```

### Submit gnu_parallel_stampede2.slurm to two nodes
Submit `gnu_parallel_stampede2.slurm` to SLURM with `-N 2` to get 2 nodes.

```
[imicrobe@login3:/work/05066/imicrobe/stampede2/jklynch/gnu-parallel-yourself]$ sbatch -N 2 gnu_parallel_stampede2.slurm

-----------------------------------------------------------------
          Welcome to the Stampede2 Supercomputer
-----------------------------------------------------------------

No reservation for this job
--> Verifying valid submit host (login3)...OK
--> Verifying valid jobname...OK
--> Enforcing max jobs per user...OK
--> Verifying availability of your home dir (/home1/05066/imicrobe)...OK
--> Verifying availability of your work dir (/work/05066/imicrobe/stampede2)...OK
--> Verifying availability of your scratch dir (/scratch/05066/imicrobe)...OK
--> Verifying valid ssh keys...OK
--> Verifying access to desired queue (skx-normal)...OK
--> Verifying job request is within current queue limits...OK
--> Checking available allocation (iPlant-Collabs)...OK
Submitted batch job 1462913
[imicrobe@login3:/work/05066/imicrobe/stampede2/jklynch/gnu-parallel-yourself]$ squeue -u imicrobe
             JOBID   PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
           1462913  skx-normal gnu-para imicrobe PD       0:00      2 (Priority)
[imicrobe@login3:/work/05066/imicrobe/stampede2/jklynch/gnu-parallel-yourself]$ ls -l
total 24
-rw------- 1 imicrobe G-818024  874 May 20 21:19 gnu_parallel_stampede2.slurm
-rw------- 1 imicrobe G-818024  368 May 20 16:27 joblist
-rw------- 1 imicrobe G-818024 1068 May 20 15:59 LICENSE
-rw------- 1 imicrobe G-818024    9 May 20 21:27 nodelist
-rw------- 1 imicrobe G-818024  810 May 20 21:27 paralleljobs.log
-rw------- 1 imicrobe G-818024 1312 May 20 15:59 README.md
```
See file `paralleljobs.log` for the node on which each job ran, e.g.:

```
Seq     Host    Starttime       JobRuntime      Send    Receive Exitval Signal  Command
6       c476-001        1526869790.610       2.755      0       359     0       0       sleep 1 && ls -l $HOME  && echo $SLURM_NODEID
2       c476-001        1526869790.547       2.818      0       359     0       0       sleep 1 && ls -l $HOME  && echo $SLURM_NODEID
4       c476-001        1526869790.579       2.786      0       359     0       0       sleep 1 && ls -l $HOME  && echo $SLURM_NODEID
8       c476-001        1526869790.641       2.724      0       359     0       0       sleep 1 && ls -l $HOME  && echo $SLURM_NODEID
3       c476-002        1526869790.563       2.812      0       359     0       0       sleep 1 && ls -l $HOME  && echo $SLURM_NODEID
1       c476-002        1526869790.533       2.842      0       359     0       0       sleep 1 && ls -l $HOME  && echo $SLURM_NODEID
7       c476-002        1526869790.626       2.763      0       359     0       0       sleep 1 && ls -l $HOME  && echo $SLURM_NODEID
5       c476-002        1526869790.595       2.795      0       359     0       0       sleep 1 && ls -l $HOME  && echo $SLURM_NODEID
```

