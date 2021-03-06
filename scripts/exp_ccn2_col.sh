#!/bin/bash
#
#SBATCH --job-name=ccn2Col
#SBATCH --output=slurm_out/ccn2Col.out
#SBATCH --error=slurm_out/ccn2Col.err
#SBATCH --time=40:00:00
#SBATCH --nodes=1
#SBATCH --mem=50000
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=ds5821@nyu.edu
#SBATCH --constraint=gpu_12gb

tr_path=/misc/vlgscratch4/BrunaGroup/sulem/chem/data/generated/cp_train_4000.pickle
te_path=/misc/vlgscratch4/BrunaGroup/sulem/chem/data/generated/cp_test_500.pickle
lr='0.00004 0.0001 0.0004'
lrd=0.9
step=4
L=8
n_feat=2

for l in $lr
do
python3 scripts/main_generate_ccn.py --k 2 --lr $l --lrdamping $lrd --L $L --h $n_feat --train_path $tr_path --test_path $te_path
done
echo done
