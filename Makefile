UTILS=tpa.com tpahex.com version.com
INC=inc

all: ${UTILS}

%.com: %.asm
	z80asm -l -I${INC} -b $< -o$@

.PHONY: all clean distclean 

clean:
	rm -f *~ *.o *.lis

distclean: clean
	rm -f ${UTILS}


