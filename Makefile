#This Makefile defines rules that are appropriate for pdflatex/biblatex
FILE = main
SIGPAGE = approval_doc
SUBS = vitals.tex signaturepage.tex
all: $(FILE).pdf $(SIGPAGE).pdf

$(FILE).pdf: $(FILE).tex $(FILE).bib $(SUBS)
	pdflatex $(FILE)
	biber $(FILE)
	pdflatex $(FILE)
	pdflatex $(FILE)

$(SIGPAGE).pdf: $(SIGPAGE).tex $(SUBS)
	pdflatex $(SIGPAGE)

clean:
	rm -f ./*.aux ./*.bbl ./*.bcf ./*.blg ./*.dvi ./*.run.xml ./*.pdf ./*.ps pdfa.xmpi
	rm -f $(FILE).log $(SIGPAGE).log $(FILE).out $(SIGPAGE).out  
