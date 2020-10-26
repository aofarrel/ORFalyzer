version 1.0

task orf {
	input {
		File script
		File otherscript
		File inFile
		File outFile
	}

	command {
		python ~{script} ~{inFile} ~{outFile}
	}

	output {
		File orfs = "~{outFile}"
	}

	runtime {
        docker: "quay.io/aofarrel/orfalyzer:CICD"
    }

    meta {
        author: "Ash O'Farrell"
        email: "aofarrel@ucsc.edu"
    }

}

workflow orfalyzer {
	input {
		File script
		File otherscript
		File inFile
		File outFile
	}
	call orf { input: script = script,
		otherscript = otherscript,
		inFile = inFile,
		outFile = outFile
	}
}