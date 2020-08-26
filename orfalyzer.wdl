version 1.0

task orf {
	input {
		File script
		File inFile
		File outFile
	}

	command {
		ls -l
		cat orfalyzer.py
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
		File script
		File inFile
		File outFile
	}
	call orf { input: script = script,
		inFile = inFile,
		outFile = outFile
	}
}