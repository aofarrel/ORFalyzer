# ORFalyzer
Find ORFs in prokaryotic DNA/RNA sequence and output protein properties -- the ORF itself, location, length in nucleotides, resulting amino acid chain, and the pI, molar and mass extinction, molecular weight, and amino acid composition as a percentage of said amino acid chain. Python3 only.

Authors of the original 2018 code: Ash O'Farrell, [Blaise Nasari](https://www.linkedin.com/in/blaise-nasri-411654139/). As of now I'm the sole maintainer because Blaise changed fields, but with that being said, Blaise definitely has my recommendation as being great to work with.
 
# Disclaimer and License
This is a program I wrote as an undergraduate in an introductory course. I am using it as a test program for other systems rather than for actual research. While prokaryotes tend not to undergo mRNA processing (hence why the scope is limited to prokaryotes), **I don't make any claims about the scientific veracity of this program.** With that being said, please feel free to tear it to pieces or build upon it as you see fit.

I know that writing programs about open reading frames is the sort of thing that be/become a common programming assignment, so if you are a student, please don't copy this code for your programming homework. Not only does it have some issues, but developing an algorithm and banging your fists on the desk as you Google a syntax error are essential computer science skills.

Anyway, until I have my tea and remember the difference between GPLv2 and GPLv3 and GPL (NYSE), I'm just gonna say "attribution" and "share-alike" as I wave my hand.

# Usage
`python3 [optional arguments] inFile outFile `
such as:
`python3 -mg 200 mini_e_coli.fna output.txt`

## Optional Arguments
'-mG', '--minGene',
   * Minimum gene length, in nucleotides, to be reported. If you set -1, all ORFs, even little babies like ATGAAATAG, will be reported.
   * type=int
   * choices=(-1, 100, 200, 300, 500, 1000)
   * default=100

'-s', '--start'
   * List of start codons, because prokaryotes are weird like that.
   * type=list
   * default=['ATG']

 '-t', '--stop'
   * List of stop codons
   * type=list
   * default=['TAG', 'TGA', 'TAA']

'-c', '--cytosine'
   * If True, cytosine is under oxidizing conditions. If false, reducing conditions.
   * default=True,

'-v', '--version'
   * Print the version of orfalyzer


# Output
## First line
* Which frame it's in, where negative numbers are on the minus strand. For example, *ATG*CCAATAG would be +1, while T*ATG*CAATAGGC would be +2.
* Nucleotide position of the ORF relative to where your input file starts
* Length of ORF

Example:
+1 30817...34038  3222

## ORF in frame
Should be relatively self-explanatory. Note that it draws upon the box drawing Unicode block, such as U+250F.

Very tiny example:
┏━━━━━━━━━━━━━━━━┓
┃  ORF in frame  ┃
┡━━━━━━━━━━━━━━━━┩
ATGAAATAA

## Resulting AA
Again, self-explanitory. This assumes that everything begins with methionine and doesn't make any protein folding or processing predictions. Consider it to be secondary structure immediately after synthesis (or during I guess, since some proteins get processed even as they're still being churned out). All output here ends in - which represents the stop codon.

Very tiny example:
┏━━━━━━━━━━━━━━━━┓
┃  Resulting AA  ┃
┡━━━━━━━━━━━━━━━━┩
MK-

## Protein Properties
Gives the properties of the resulting protein. pI (isoelectric point), molar extinction coefficient, mass extinction coefficient, molecular weight, and a percentage breakdown of amino acid composition to the hundredths place.
┏━━━━━━━━━━━━━━━━━━━━━━━┓
┃  Protein properties   ┃
┡━━━━━━━━━━━━━━━━━━━━━━━┩
pI value: 5.044833794385195
Molar Extinction: 69940
Mass Extinction: 0.5935128099437988
Molecular Weight: 117840.75899999999
Amino acid composition:
	A = 10.44%
	C = 1.30%
	D = 5.96%
	E = 8.48%
	F = 3.17%
	G = 7.74%
	H = 1.40%
	I = 6.62%
	K = 5.22%
	L = 7.74%
	M = 2.89%
	N = 3.36%
	P = 4.10%
	Q = 3.26%
	R = 6.43%
	S = 4.29%
	T = 5.59%
	V = 8.76%
	W = 0.37%
	Y = 2.89%
