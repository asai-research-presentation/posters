
.SECONDEXPANSION:

.PRECIOUS: %.png %.pdf

.PHONY:	clean all pdf png

all: pdf png

pdf: aist-ponti.pdf

png: aist-ponti1.png aist-ponti2.png

aist-ponti.pdf: aist-ponti1.pdf aist-ponti2.pdf
	pdftk aist-ponti2.pdf aist-ponti1.pdf cat output $@

%.pdf : %.svg
	inkscape -f $< -A $*.pdf -d 50

%.png : %.svg
	inkscape -f $< -e $*.png -d 150 -b=FFFFFF -y=0.9

clean:
	-rm *.png *.pdf
