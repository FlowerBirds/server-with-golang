.PYONY: build run clear
.IGNORE : clear

export GO111MODULE=on
export BINARY=golang-server

build_cmd=go build -o build/$(BINARY)$(3)
run_cmd=build/$(BINARY)$(3)
rm_cmd=rm -rf build/$(BINARY)$(3)

run: build
	$(call run_cmd,,,.exe)

build: clear
	$(call build_cmd,,,.exe)

clear:
	$(call rm_cmd,,,.exe)