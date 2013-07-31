SOURCES = lib/*.js
TESTS = test/*.test.js

lint: lint-jshint
test: test-mocha
test-cov: test-istanbul-mocha
view-cov: view-istanbul-report


# ==============================================================================
# Node.js
# ==============================================================================
include support/mk/node.mk
include support/mk/mocha.mk

# ==============================================================================
# Browserify
# ==============================================================================
BROWSERIFY_MAIN = ./lib/index.js

include support/mk/browserify.mk
include support/mk/testling.mk

# ==============================================================================
# Code Quality
# ==============================================================================
include support/mk/notes.mk
include support/mk/jshint.mk
include support/mk/istanbul.mk

# ==============================================================================
# Continuous Integration
# ==============================================================================

ci-travis: test test-cov

# ==============================================================================
# Clean
# ==============================================================================
clean:
	rm -rf build
	rm -rf reports

clobber: clean clobber-node


.PHONY: lint test test-cov view-cov ci-travis clean clobber
