#!/usr/bin/env bash
# trim.sh

fastqPath="/home/fan.shua/Personal_Project/SARS-CoV-2_patient_specimen/"
left="_1.fastq"
right="_2.fastq"
NCBI="SRR1318851"

# create the output directories
pairedOut="Paired/"
unpairedOut="Unpaired/"
mkdir -p $pairedOut
mkdir -p $unpairedOut

# Trimmonmatic
function trim {
    for read in $fastqPath*$left
    do
        pathRemoved="${read/$fastqPath/}"
        sampleName="${pathRemoved/$left}"
        echo $sampleName    
        nice -n19 java -jar /usr/local/programs/Trimmomatic-0.36/trimmomatic-0.36.jar PE \
        -threads 1 -phred33 \
        $fastqPath$sampleName$left \
        $fastqPath$sampleName$right \
        $pairedOut$sampleName$left \
        $unpairedOut$sampleName$left \
        $pairedOut$sampleName$right \
        $unpairedOut$sampleName$right \
        HEADCROP:0 \
        ILLUMINACLIP:/usr/local/programs/Trimmomatic-0.36/adapters/TruSeq3-PE.fa:2:30:10 \
        LEADING:20 TRAILING:20 SLIDINGWINDOW:4:30 MINLEN:36
    done
}
trim 1>trim.log 2>trim.err
