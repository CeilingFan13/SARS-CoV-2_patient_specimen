#!/usr/bin/env bash
# runSpades.sh

pairedPath="/home/fan.shua/Personal_Project/SARS-CoV-2_patient_specimen/Paired/"
left="_1.fastq"
right="_2.fastq"

/usr/local/programs/SPAdes-3.14.1-Linux/bin/spades.py -t 4 \
    -1 $pairedPath*$left \
    -2 $pairedPath*$right \
    -o SARS-CoV-2
1>runSpades.log 2>runSpades.err
