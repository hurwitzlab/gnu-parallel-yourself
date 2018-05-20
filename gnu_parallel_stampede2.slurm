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

cat joblist | parallel

echo " "
echo "GNU Parallel Job Complete"
echo " "
