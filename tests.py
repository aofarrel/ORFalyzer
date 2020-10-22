import os
import unittest

from orfalyzer import orfalyzer

############################################
# test weird fastas                        #
############################################

# lateHeader: header row is not the first line
def test_fasta_lateHeader():
	lateHeader = "asdf\nlalalalala\n>now I'm a header\nATGCCCCCCCCCTAA"
	with open('lateHeader.fasta', 'w') as f: f.write(lateHeader)
	lateReader = orfalyzer.sequenceanalysis.FastAreader(fname='lateHeader.fasta')
	for head, seq in lateReader.readFasta():
		assert head == "now I'm a header"
		assert seq == "ATGCCCCCCCCCTAA"
	os.remove('lateHeader.fasta')

# multiHeader: has multiple headers
def test_fasta_multiHeader():
	n = 0
	multiHeader = ">first header\nATGCCCCCCCCCTAA\n>second header\nATGGGGGGGGGTAA"
	with open('multiHeader.fasta', 'w') as f: f.write(multiHeader)
	multiReader = orfalyzer.sequenceanalysis.FastAreader(fname='multiHeader.fasta')
	for head, seq in multiReader.readFasta():
		assert head == ("first header" if n ==0 else "second header")
		assert seq == ("ATGCCCCCCCCCTAA" if n ==0 else "ATGGGGGGGGGTAA")
		n += 1
	os.remove('multiHeader.fasta')

# chevronPlus: has extra chevrons all over the place
def test_fasta_chevronPlus():
	n = 0
	chevronPlus = ">chevron with >techron<\nATGCCCCCCC>CCTAA>\n>wow this file is a mess\nATGCCCCCCCCCTAA"
	with open('chevronPlus.fasta', 'w') as f: f.write(chevronPlus)
	chevronReader = orfalyzer.sequenceanalysis.FastAreader(fname='chevronPlus.fasta')
	for head, seq in chevronReader.readFasta():
		assert head == ("chevron with >techron<" if n ==0 else "wow this file is a mess")
		assert seq == ("ATGCCCCCCC>CCTAA>" if n ==0 else "ATGCCCCCCCCCTAA")
		n += 1
	os.remove('chevronPlus.fasta')

# emptyHeader: header is empty
def test_fasta_emptyHeader():
	emptyHeader = ">\nATGCCCCCCCCCTAA"
	with open('emptyHeader.fasta', 'w') as f: f.write(emptyHeader)
	emptyReader = orfalyzer.sequenceanalysis.FastAreader(fname='emptyHeader.fasta')
	for head, seq in emptyReader.readFasta():
		assert head == ""
		assert seq == "ATGCCCCCCCCCTAA"
	os.remove('emptyHeader.fasta')

############################################
# test weird reading frames                #
############################################
noORF = ">noORF\nTCTTTTAAAGGGCCCTTTTAAAATC"
shortORF = ">shortORF\nATGTAA"
newlines = ">newlines\nATGATGATGATG\nTAANNNNNNNNNNNNATG\nCCCGGGCCCGGGTAA"
unknownORF = ">unknownORF\nATGNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNTAA"

#orfalyzer.main()


############################################
# clean up                                 #
############################################

print("Done.")

#os.remove('blank.txt')
