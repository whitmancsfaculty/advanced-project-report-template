#This Makefile defines rules that are appropriate for pdflatex/biblatex
#If the signature page does ever need to be a separate document, you 
#  can accomplish this by explicitly using "make approval_doc.pdf", or 
#  by uncommenting out the second target after "all"
FILE = main
SIGPAGE = approval_doc
SUBS = vitals.tex signaturepage.tex
all: $(FILE).pdf #$(SIGPAGE).pdf

template.pdf: main.pdf
	cp main.pdf template.pdf

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
