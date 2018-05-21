#!/bin/bash
#
#SBATCH -J gnu-parallel-yourself.job # Job name
#SBATCH -N 1 # Total number of nodes
#SBATCH -n 8 # Total number of tasks
#SBATCH -p skx-normal # Queue name
#SBATCH -o gnu-parallel-yourself.job.o%j # Name of stdout output file (%j expands to jobid)
#SBATCH -t 00:01:00 # Run time (hh:mm:ss)
#SBATCH -A iPlant-Collabs
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user <developer>@email.arizona.edu

# assume parallel is already on $PATH
# define the env_parallel function (important!)
. $(which env_parallel.bash)

# nodelist
scontrol show hostnames $SLURM_JOB_NODELIST > nodelist

# $JOBFILE is the list of jobs
JOBFILE=joblist

# PPN is processes per node
PPN=4

# env_parallel sends the shell environment to each process it starts
 
env_parallel --max-procs ${PPN} --joblog paralleljobs.log  --sshloginfile nodelist --group < ${JOBFILE}

echo " "
echo "GNU Parallel Job Complete"
echo " "
