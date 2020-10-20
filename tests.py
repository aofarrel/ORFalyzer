from orfalyzer import orfalyzer
import os


# create test files

noORF = ">noORF\nTCTTTTAAAGGGCCCTTTTAAAATC"
shortORF = ">shortORF\nATGTAA"
newlines = ">newlines\nATGATGATGATG\nTAANNNNNNNNNNNNATG\nCCCGGGCCCGGGTAA"
unknownORF = ">unknownORF\nATGNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNTAA"

orfalyzer.main()