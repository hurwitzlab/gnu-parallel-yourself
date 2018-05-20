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
```

Replace `<developer>@email.arizona.edu` with your email address on the following line of `gnu_parallel_stampede2.job`:
```
#SBATCH --mail-user <developer>@email.arizona.edu
```

### Submit launcher_stampede2.job to a single node
Submit `gnu_parallel_stampede2.job` to SLURM with `-N 1` to get 1 node. When the job completes you will have a file named something like `gnu-parallel-yourself.job.o8688690` which shows what happened.

```
```

### Submit launcher_stampede2.job to two nodes
Submit `launcher_stampede2.job` to SLURM with `-N 2` to get 2 nodes.

```
```


