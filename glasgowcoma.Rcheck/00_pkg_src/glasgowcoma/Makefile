rd2pdf:
	cd ..; rm glasgowcoma.pdf glasgowcoma/inst/doc/glasgowcoma.pdf; R CMD Rd2pdf glasgowcoma; cp glasgowcoma.pdf glasgowcoma/inst/doc/glasgowcoma.pdf

pkgdown:
	rm -rf docs ;\
	Rscript -e "Sys.setlocale('LC_ALL', 'C'); pkgdown::build_site()"

roxygen:
	Rscript -e "library(glasgowcoma);roxygen2::roxygenise()" 

cran:
	make roxygen ;\
	make rd2pdf ;\
	Rscript -e "devtools::build()" ;\
	R CMD check --as-cran ../glasgowcoma_*.tar.gz; mv ../glasgowcoma_*.tar.gz releases

readme:
	Rscript -e "rmarkdown::render('README.Rmd')"

