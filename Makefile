MAIN=main
SOURCE=$(MAIN).tex tikz-grules.tex

all: figs $(MAIN).pdf

$(MAIN).pdf: $(SOURCE)

%.pdf: %.tex
	pdflatex $< | tee $<.out
	if cat $<.out | grep 'Rerun to get' >/dev/null ; then \
	  bibtex ${<:.tex=.aux}; pdflatex $<; pdflatex $< ;\
	fi

figs:
	make -C Figs
