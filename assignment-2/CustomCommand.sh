#/bin/bash
debmalya() {
	echo "Hello this is a new command and the number of shell files in this directoy is:"
	ls -1 *.sh 2>/dev/null | wc -l
}
debmalya
