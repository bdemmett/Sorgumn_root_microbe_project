#!/bin/bash 
#$ -cwd
#$ -l ram.c=15G
#$ -pe pe_slots 32
#$ -M jzz0026@lbl.gov
#$ -m abe
#$ -l h_rt=10:00:00

module load bbtools

input_pacbio_raw=$1
primers=$2

seal.sh in=$input_pacbio_raw pattern=out_%.fq ref=$primers k=16 edist=2 restrictleft=40 


#trim ends
bbduk.sh in=out_0001_F.fq out=out_0001_r_trimmed.fq k=16 ktrim=r edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0002_F.fq out=out_0002_r_trimmed.fq k=16 ktrim=r edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0003_F.fq out=out_0003_r_trimmed.fq k=16 ktrim=r edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0004_F.fq out=out_0004_r_trimmed.fq k=16 ktrim=r edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0005_F.fq out=out_0005_r_trimmed.fq k=16 ktrim=r edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0006_F.fq out=out_0006_r_trimmed.fq k=16 ktrim=r edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0007_F.fq out=out_0007_r_trimmed.fq k=16 ktrim=r edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0008_F.fq out=out_0008_r_trimmed.fq k=16 ktrim=r edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0009_F.fq out=out_0009_r_trimmed.fq k=16 ktrim=r edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0010_F.fq out=out_0010_r_trimmed.fq k=16 ktrim=r edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0011_F.fq out=out_0011_r_trimmed.fq k=16 ktrim=r edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0012_F.fq out=out_0012_r_trimmed.fq k=16 ktrim=r edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0013_F.fq out=out_0013_r_trimmed.fq k=16 ktrim=r edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0014_F.fq out=out_0014_r_trimmed.fq k=16 ktrim=r edist=2 restrictright=40 ref=$primers


bbduk.sh in=out_0001_r_trimmed.fq out=out_0001_rl_trimmed.fq k=16 ktrim=l edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0002_r_trimmed.fq out=out_0002_rl_trimmed.fq k=16 ktrim=l edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0003_r_trimmed.fq out=out_0003_rl_trimmed.fq k=16 ktrim=l edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0004_r_trimmed.fq out=out_0004_rl_trimmed.fq k=16 ktrim=l edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0005_r_trimmed.fq out=out_0005_rl_trimmed.fq k=16 ktrim=l edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0006_r_trimmed.fq out=out_0006_rl_trimmed.fq k=16 ktrim=l edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0007_r_trimmed.fq out=out_0007_rl_trimmed.fq k=16 ktrim=l edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0008_r_trimmed.fq out=out_0008_rl_trimmed.fq k=16 ktrim=l edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0009_r_trimmed.fq out=out_0009_rl_trimmed.fq k=16 ktrim=l edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0010_r_trimmed.fq out=out_0010_rl_trimmed.fq k=16 ktrim=l edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0011_r_trimmed.fq out=out_0011_rl_trimmed.fq k=16 ktrim=l edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0012_r_trimmed.fq out=out_0012_rl_trimmed.fq k=16 ktrim=l edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0013_r_trimmed.fq out=out_0013_rl_trimmed.fq k=16 ktrim=l edist=2 restrictright=40 ref=$primers
bbduk.sh in=out_0014_r_trimmed.fq out=out_0014_rl_trimmed.fq k=16 ktrim=l edist=2 restrictright=40 ref=$primers


#remove low_quality and short reads

reformat.sh in=out_0001_rl_trimmed.fq out=out_0001_rl_trimmed_qfiltered.fq maq=20 minlen=1400 maxlen=1600 ow
reformat.sh in=out_0002_rl_trimmed.fq out=out_0002_rl_trimmed_qfiltered.fq maq=20 minlen=1400 maxlen=1600 ow
reformat.sh in=out_0003_rl_trimmed.fq out=out_0003_rl_trimmed_qfiltered.fq maq=20 minlen=1400 maxlen=1600 ow
reformat.sh in=out_0004_rl_trimmed.fq out=out_0004_rl_trimmed_qfiltered.fq maq=20 minlen=1400 maxlen=1600 ow
reformat.sh in=out_0005_rl_trimmed.fq out=out_0005_rl_trimmed_qfiltered.fq maq=20 minlen=1400 maxlen=1600 ow
reformat.sh in=out_0006_rl_trimmed.fq out=out_0006_rl_trimmed_qfiltered.fq maq=20 minlen=1400 maxlen=1600 ow
reformat.sh in=out_0007_rl_trimmed.fq out=out_0007_rl_trimmed_qfiltered.fq maq=20 minlen=1400 maxlen=1600 ow
reformat.sh in=out_0008_rl_trimmed.fq out=out_0008_rl_trimmed_qfiltered.fq maq=20 minlen=1400 maxlen=1600 ow
reformat.sh in=out_0009_rl_trimmed.fq out=out_0009_rl_trimmed_qfiltered.fq maq=20 minlen=1400 maxlen=1600 ow
reformat.sh in=out_0010_rl_trimmed.fq out=out_0010_rl_trimmed_qfiltered.fq maq=20 minlen=1400 maxlen=1600 ow
reformat.sh in=out_0011_rl_trimmed.fq out=out_0011_rl_trimmed_qfiltered.fq maq=20 minlen=1400 maxlen=1600 ow
reformat.sh in=out_0012_rl_trimmed.fq out=out_0012_rl_trimmed_qfiltered.fq maq=20 minlen=1400 maxlen=1600 ow
reformat.sh in=out_0013_rl_trimmed.fq out=out_0013_rl_trimmed_qfiltered.fq maq=20 minlen=1400 maxlen=1600 ow
reformat.sh in=out_0014_rl_trimmed.fq out=out_0014_rl_trimmed_qfiltered.fq maq=20 minlen=1400 maxlen=1600 ow

#rename
cat out_0001_rl_trimmed_qfiltered.fq | awk '{print (NR%4 == 1) ? “@1st_1_” ++i-1 : $0}' | paste - - - - | sed 's/^@/>/g'| cut -f1-2 | tr '\t' '\n' > re_0001_rl_trimmed_qfiltered.fq


#incorporate trimmed reads of all samples
cat re_*_rl_trimmed_qfiltered.fq > all_rl_trimmed_qfiltered.fq

#annotate (remove) primers and make all seqs into a single orientation followed by filter by length of 1250 and remove chimeric reads (Usearch reference) on Geneious. 




