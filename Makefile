.PHONY: dependencies
dependencies:
	scripts/dependencies
	scripts/py-dependencies
	scripts/download_curves

.PHONY: prep
prep: 
	scripts/prep

.PHONY: test
test:
	scripts/test

.PHONY: update_branch
update_branch:
	git pull --rebase origin master

.PHONY: add_words_to_pylint
add_words_to_pylint:
	env/bin/pylint --rcfile=setup.cfg --spelling-store-unknown-words=yes --reports=n ./frc_rekt/
	env/bin/pylint --rcfile=setup.cfg --spelling-store-unknown-words=yes --reports=n --disable=missing-docstring,protected-access,redefined-outer-name,invalid-name ./tests/
