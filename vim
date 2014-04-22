zainstalowane pluginy:

* pathogen git clone git://github.com/tpope/vim-pathogen.git pathogen
to dodałem do vimrc:
	call pathogen#runtime_append_all_bundles()
	call pathogen#helptags()

* fugitive (trzymanie wszystkiego w gicie) git submodule add git://github.com/tpope/vim-fugitive.git bundle/fugitive
	git submodule init && git submodule update (update dodanych pluginów)

* command-t git submodule add git://git.wincent.com/command-t.git bundle/command-t (nie działa, trzeba poprawić)
* DelimitMate - provides automatic closing of quotes, parenthesis, brackets, etc.
	git submodule add git://github.com/Raimondi/delimitMate.git bundle/delmitmate

* supertab - dopełnianie dowolnych wyrazów w insert
	git submodule add git://github.com/vim-scripts/supertab.git bundle/supertab
* surround - git submodule add git://github.com/tpope/vim-surround.git bundle/surround
	dopołnianie nawiasów itp


zainstalowany config ze strony https://github.com/derekwyatt/vim-config/blob/master/vimrc

