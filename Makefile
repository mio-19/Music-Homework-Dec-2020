ae := paper

src = ${ae}.scrbl utils.rkt bibliography.scrbl

all: paper.PDF
html: ${ae}.html
pdf: ${ae}.pdf
PDF: pdf ${ae}.PDF

%.PDF: %.pdf
	evince -f -i $${p:-1} $<

%.pdf: %.scrbl ${src}
	scribble --dest-name $@ --pdf $<

${ae}.html: ${ae}.scrbl ${src}
%.html: %.scrbl utils.rkt bibliography.scrbl
	scribble --dest-name $@ --html $<

%.latex: %.scrbl ${src}
	scribble --latex --dest tmp $<

clean:
	rm -f *.pdf *.html *.tex *.css *.js
	rm -rf tmp

