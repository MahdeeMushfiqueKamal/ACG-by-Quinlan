## Awk and BioAwk

#### Downloading the file to work with.

```bash
$ wget https://s3.amazonaws.com/bedtools-tutorials/web/cpg.bed
```

#### Terminology: 

- **bed File**: 4 columns. Chromosome number, start co-ordinate, end co-ordinate and CpG score. 
- **CpG Island**: Location in genome where the C followed by G or G followed by C occurs frequently. If a CpG island is hyper methylated, it represses the expression of down stream genes. 
- NR: Record Number
- NF: Field Number 

#### Working with awk: 
```bash
$ awk '$1 == "chr1"' cpg.bed        # $1 means column 1. This program shows the lines with "chr1" pattern in 1st column on cpg.bed
$ grep -w '^chr1' cpg.bed       # Alternative command using grep
$ awk '$1 == "chr1"' cpg.bed        # every line except the lines with "chr1" on column 1
$ awk '$3 < $2' cpg.bed         # Show me lines with end location less than start location. Checking if the file is OK. 
$ awk 'NR == 100' cpg.bed       # Show me the 100th entry. 
$ head -n 100 cpg.bed | tail -n 1       # Alternative command using head & tail
$ awk 'NR >= 100 && NR <= 200' cpg.bed # show me the rows from 100 to 200 (including)
$ awk 'NR >= 100 && NR <= 200' cpg.bed | wc -l  # Checking the number of lines
$
```
