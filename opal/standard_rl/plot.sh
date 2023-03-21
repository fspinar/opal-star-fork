#!/bin/bash

# This is an example batch script for slurm on Oscar
# 
# The commands for slurm start with #SBATCH
# All slurm commands need to come before the program 
# you want to run.
#
# This is a bash script, so any line that starts with # is
# a comment.  If you need to comment out an #SBATCH line 
# use ##SBATCH 
#
# To submit this script to slurm do:
#    sbatch grid.search
# To use frank lab condo use:
#	 sbatch --account=bibs-frankmj-condo complexity.sh
# To use new cluster:
# 	 sbatch --account=carney-frankmj-condo complexity.sh
#
# Once the job starts you will see a file MySerialJob-****.out
# The **** will be the slurm JobID

# --- Start of slurm commands -----------

# use the frank carney clusters
#SBATCH --account=carney-frankmj-condo

# Request specified runtime:
#SBATCH --time=1:00:00

# Specify a job name:
#SBATCH -J RLplots-R

# Specify an output file
# %j is a special variable that is replaced by the JobID when 
# job starts
#SBATCH -o ./output/RLplots-R%j.out
#SBATCH -e ./output/RLplots-R%j.err	

#----- End of slurm commands ----

echo "Starting job $SLURM_ARRAY_TASK_ID"
python3 complexity_hist.py  "rich"		500 		5000 		100
# python3 complexity_hist.py  "lean"		500 		5000 		100	
