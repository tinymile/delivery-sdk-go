OPENAPI_SPEC_URL := https://external-api.dev.gcp.tinymile.ai/doc/spec-bundle.json
OPENAPI_SPEC_BUNDLE := spec-bundle.json

ALL_TARGETS := \
	$(OPENAPI_SPEC_BUNDLE) \
	types.gen.go \
	client.gen.go

OAPI_CODEGEN_CMD := go run github.com/deepmap/oapi-codegen/cmd/oapi-codegen@v1.10.1

DOCKER_RUN := docker run --user $(shell id -u) --rm

all: $(ALL_TARGETS)

.PHONY: clean
clean:
	rm -rf $(ALL_TARGETS)

%.gen.go:  gen-%.config.yaml $(OPENAPI_SPEC_BUNDLE)
	$(OAPI_CODEGEN_CMD) -config $< $(OPENAPI_SPEC_BUNDLE)

.PHONY: install-deps
install-deps: $(GO_BUILD_DEPS)

.PHONY: $(GO_BUILD_DEPS)

$(OPENAPI_SPEC_BUNDLE):
	mkdir -p $(@D)
	curl -sSL $(OPENAPI_SPEC_URL) > $@
