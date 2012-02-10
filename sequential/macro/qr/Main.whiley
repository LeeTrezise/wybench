import * from whiley.lang.*



void ::main(System.Console sys):
	if |sys.args| == 0:
		sys.out.println("No Input File")
	filename = sys.args[0]
	debug "File Name: " + filename + "\n"
	data = QR.parseImage(filename)	