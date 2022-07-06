OPENAPI_SPEC_URL := https://external-api.dev.gcp.tinymile.ai/doc/spec-bundle.json
OPENAPI_SPEC_BUNDLE := spec-bundle.json

ALL_TARGETS := \
	$(OPENAPI_SPEC_BUNDLE) \
	types.gen.go \
	client.gen.go

GO_BUILD_DEPS := \
	github.com/deepmap/oapi-codegen/cmd/oapi-codegen@7da811e1cf30c76606750b20b7998543d36a25cb

DOCKER_RUN := docker run --user $(shell id -u) --rm

all: $(ALL_TARGETS)

.PHONY: clean
clean:
	rm -rf $(ALL_TARGETS)

%.gen.go:  gen-%.config.yaml $(OPENAPI_SPEC_BUNDLE)
	oapi-codegen -config $< $(OPENAPI_SPEC_BUNDLE)

.PHONY: install-deps
install-deps: $(GO_BUILD_DEPS)

.PHONY: $(GO_BUILD_DEPS)
$(GO_BUILD_DEPS):
	go install $@

$(OPENAPI_SPEC_BUNDLE):
	mkdir -p $(@D)
	curl -sSL $(OPENAPI_SPEC_URL) > $@
