ISTANBUL ?= istanbul
ISTANBUL_OUT ?= ./reports/coverage
ISTANBUL_HTML_REPORT_PATH ?= $(ISTANBUL_OUT)/lcov-report/index.html


test-istanbul-mocha: node_modules
	NODE_PATH=$(NODE_PATH_TEST) \
	$(ISTANBUL) cover \
	--dir $(ISTANBUL_OUT) \
	$(_MOCHA) -- \
		--reporter $(MOCHA_REPORTER) \
		--require $(MOCHA_REQUIRE) $(TESTS)

view-istanbul-report:
	open $(ISTANBUL_HTML_REPORT_PATH)


.PHONY: coverage-browserify