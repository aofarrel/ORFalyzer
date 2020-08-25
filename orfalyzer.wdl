version 1.0

task orf {
	input {
		File inFile
		File outFile
	}

	command {
		./orfalyzer.py ~{inFile} ~{outFile}
	}

	output {
		File orfs = "~{outFile}"
	}

	runtime {
        docker: "quay.io/aofarrel/orfalyzer:latest"
    }

    meta {
        author: "Ash O'Farrell"
        email: "aofarrel@ucsc.edu"
    }

}

workflow orfalyzer {
	input {
		File inFile
		File outFile
	}
	call orf { input: inFile = inFile,
		outFile = outFile
	}
}