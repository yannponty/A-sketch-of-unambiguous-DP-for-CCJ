MAIN=main
SOURCE=$(MAIN).tex tikz-grules.tex

all: figs $(MAIN).pdf

pdf: all

$(MAIN).pdf: $(SOURCE)

%.pdf: %.tex
	pdflatex $< | tee $<.out
	if cat $<.out | grep 'Rerun to get' >/dev/null ; then \
	  bibtex ${<:.tex=.aux}; pdflatex $<; pdflatex $< ;\
	fi

figs:
	make -C Figs
