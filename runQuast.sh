#!/usr/bin/env bash
# runQuast.sh

quast.py -t 4 -s SARS-CoV-2/scaffolds.fasta \
        -G GCF_009858895.2_ASM985889v3_genomic.gff\
        -f \
        -o quast_output
1>runQuast.log 2>runQuast.err
