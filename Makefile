
.PHONY:	clean all pdf png

all: pdf png

pdf: $(patsubst %.svg, %.pdf, $(wildcard *.svg))

png: $(patsubst %.svg, %.png, $(wildcard *.svg))

aist-ponti.pdf: aist-ponti1.pdf aist-ponti2.pdf
	pdftk aist-ponti2.pdf aist-ponti1.pdf cat output $@

%.pdf : %.svg
	inkscape -f $(CURDIR)/$< -A $(CURDIR)/$*.pdf -d 150 || inkscape -o $(CURDIR)/$*.pdf -d 150 $(CURDIR)/$<

%.png : %.svg
	inkscape -f $(CURDIR)/$< -e $(CURDIR)/$*.png -d 150 -b=FFFFFF -y=0.9 || inkscape -o $(CURDIR)/$*.png -d 150 $(CURDIR)/$<

clean:
	-rm *.png *.pdf
