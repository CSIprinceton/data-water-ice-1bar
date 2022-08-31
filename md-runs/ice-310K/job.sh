#!/bin/bash
#SBATCH --ntasks=1               # total number of tasks across all nodes
#SBATCH --ntasks-per-node=1         
#SBATCH --nodes=1         
#SBATCH --cpus-per-task=7        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=4G         # memory per cpu-core (4G is default)
#SBATCH --time=24:00:00          # total run time limit (HH:MM:SS)
#SBATCH --job-name="ice-320" 
#SBATCH --gres=gpu:1             # number of gpus per node

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export PLUMED_NUM_THREADS=$SLURM_CPUS_PER_TASK

pwd; hostname; date

module purge
module load anaconda3/2020.7

conda activate deepmd-new

############################################################################
# Variables definition
############################################################################
LAMMPS_EXE=lmp
############################################################################

############################################################################
# Run
############################################################################
export SLURM_WHOLE=1
srun $LAMMPS_EXE -in start.lmp

date
