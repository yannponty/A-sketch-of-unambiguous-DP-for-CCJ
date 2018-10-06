SVGFIGURES=${wildcard *.svg}
FIGURES=${SVGFIGURES:.svg=}

all: $(FIGURES:=.pdf) #$(FIGURES:=.eps)

%.pdf: %.svg
	inkscape --export-pdf $@ $<

%.eps: %.pdf
	pdftops -eps $<

clean:
	$(RM) $(FIGURES:=.pdf) $(FIGURES:=.eps)

