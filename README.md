# gnu-parallel-yourself
Template script and instructions for using GNU Parallel in place of the TACC Launcher on Stampede2.

## Prerequisites
GNU Parallel is not supported by TACC so it must be built. The 'Personal installation' method shown here will work on Stampede2: https://github.com/martinda/gnu-parallel.
```
wget http://ftpmirror.gnu.org/parallel/parallel-latest.tar.bz2
bzip2 -dc parallel-*.tar.bz2 | tar xvf -
cd parallel-*
./configure --prefix=$HOME && make && make install
```
Add the $HOME/bin directory to your PATH variable in .bashrc:
```
...
export PATH="$HOME/bin:$PATH"
```

## Installation
To get an idea of how to use GNU Parallel clone this repository to some directory on Stampede2. For example:
```
 git clone git@github.com:hurwitzlab/gnu-parallel-yourself.git
 ```

Replace `<developer>@email.arizona.edu` with your email address on the following line of `gnu_parallel_stampede2.job`:
```
#SBATCH --mail-user <developer>@email.arizona.edu
```

### Submit launcher_stampede2.job to a single node
Submit `gnu_parallel_stampede2.job` to SLURM with `-N 1` to get 1 node.
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
Submitted batch job 1461399
```
When the job completes you will have a file named something like `gnu-parallel-yourself.job.o1461399` which shows what happened.

### Submit launcher_stampede2.job to two nodes
Submit `launcher_stampede2.job` to SLURM with `-N 2` to get 2 nodes.

```
```


