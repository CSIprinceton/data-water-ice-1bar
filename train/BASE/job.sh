#!/bin/bash
#SBATCH --ntasks=1               # total number of tasks across all nodes
#SBATCH --ntasks-per-node=1         
#SBATCH --nodes=1         
#SBATCH --cpus-per-task=1       # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=4G         # memory per cpu-core (4G is default)
#SBATCH --time=24:00:00          # total run time limit (HH:MM:SS)
#SBATCH --job-name="TrainREPLACE" 
#SBATCH --gres=gpu:1             # number of gpus per node

pwd; hostname; date

module load anaconda3/2020.7

conda activate deepmd-new

dp train input.json

date
