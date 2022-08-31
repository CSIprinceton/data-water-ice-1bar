counter=0
for seed in 25875 31473 26182 12396
do
	counter=$(($counter+1))
	cd $counter
	sbatch < job-compress.sh
	cd ..
done
