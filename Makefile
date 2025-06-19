.PHONY: help update-cgip update-csep update-runify update-nocol update-new list-releases

# Default target
help:
	@echo "Available targets:"
	@echo "  update-cgip     - Update cgip formula to latest release"
	@echo "  update-csep     - Update csep formula to latest release"
	@echo "  update-runify   - Update runify formula to latest release"
	@echo "  update-nocol    - Update nocol formula to latest release"
	@echo "  update-new      - Update new formula to latest release (if repo exists)"
	@echo "  list-releases   - List latest releases for all projects"
	@echo ""
	@echo "Usage examples:"
	@echo "  make update-cgip"
	@echo "  make list-releases"

# Helper function to update a formula
define update_formula
	@echo "Updating $(1) formula..."
	@LATEST_TAG=$$(gh release list --repo divanvisagie/$(2) --limit 1 --json tagName --jq '.[0].tagName'); \
	if [ -z "$$LATEST_TAG" ]; then \
		echo "Error: Could not fetch latest release for $(2)"; \
		exit 1; \
	fi; \
	echo "Latest version: $$LATEST_TAG"; \
	INTEL_URL="https://github.com/divanvisagie/$(2)/releases/download/$$LATEST_TAG/$(1)-darwin-x86_64.tar.gz"; \
	ARM_URL="https://github.com/divanvisagie/$(2)/releases/download/$$LATEST_TAG/$(1)-darwin-aarch64.tar.gz"; \
	echo "Downloading and calculating checksums..."; \
	INTEL_SHA=$$(curl -sL "$$INTEL_URL" | shasum -a 256 | cut -d' ' -f1); \
	ARM_SHA=$$(curl -sL "$$ARM_URL" | shasum -a 256 | cut -d' ' -f1); \
	if [ -z "$$INTEL_SHA" ] || [ -z "$$ARM_SHA" ]; then \
		echo "Error: Could not calculate checksums"; \
		exit 1; \
	fi; \
	echo "Intel SHA256: $$INTEL_SHA"; \
	echo "ARM SHA256: $$ARM_SHA"; \
	echo "Updating $(1).rb..."; \
	sed -i.bak \
		-e "s|releases/download/v[0-9][^/]*/$(1)-darwin-x86_64.tar.gz|releases/download/$$LATEST_TAG/$(1)-darwin-x86_64.tar.gz|g" \
		-e "s|releases/download/v[0-9][^/]*/$(1)-darwin-aarch64.tar.gz|releases/download/$$LATEST_TAG/$(1)-darwin-aarch64.tar.gz|g" \
		$(1).rb; \
	awk -v intel_sha="$$INTEL_SHA" -v arm_sha="$$ARM_SHA" ' \
		/if Hardware::CPU.intel\?/ { in_intel=1; print; next } \
		/elsif Hardware::CPU.arm\?/ { in_intel=0; in_arm=1; print; next } \
		/else/ && (in_intel || in_arm) { in_intel=0; in_arm=0; print; next } \
		/sha256/ && in_intel { print "    sha256 \"" intel_sha "\""; next } \
		/sha256/ && in_arm { print "    sha256 \"" arm_sha "\""; next } \
		{ print } \
	' $(1).rb > $(1).rb.tmp && mv $(1).rb.tmp $(1).rb; \
	rm -f $(1).rb.bak; \
	echo "✅ Updated $(1) to $$LATEST_TAG"
endef

# Special case for 'new' which has different URL pattern
define update_new_formula
	@echo "Updating new formula..."
	@LATEST_TAG=$$(gh release list --repo divanvisagie/new --limit 1 --json tagName --jq '.[0].tagName'); \
	if [ -z "$$LATEST_TAG" ]; then \
		echo "Error: Could not fetch latest release for new"; \
		exit 1; \
	fi; \
	echo "Latest version: $$LATEST_TAG"; \
	VERSION=$$(echo $$LATEST_TAG | sed 's/^v//'); \
	DOWNLOAD_URL="https://github.com/divanvisagie/new/releases/download/$$LATEST_TAG/new_$${VERSION}_darwin_amd64.tar.gz"; \
	echo "Downloading and calculating checksum..."; \
	SHA256=$$(curl -sL "$$DOWNLOAD_URL" | shasum -a 256 | cut -d' ' -f1); \
	if [ -z "$$SHA256" ]; then \
		echo "Error: Could not calculate checksum"; \
		exit 1; \
	fi; \
	echo "SHA256: $$SHA256"; \
	echo "Updating new.rb..."; \
	sed -i.bak \
		-e "s|url \"https://github.com/divanvisagie/new/releases/download/v[^/]*/new_[^/]*_darwin_amd64.tar.gz\"|url \"$$DOWNLOAD_URL\"|" \
		-e "s|version \"[^\"]*\"|version \"$$VERSION\"|" \
		-e "s|sha256 \"[^\"]*\"|sha256 \"$$SHA256\"|" \
		new.rb; \
	rm -f new.rb.bak; \
	echo "✅ Updated new to $$LATEST_TAG"
endef

update-cgip:
	$(call update_formula,cgip,chat-gipity)

update-csep:
	$(call update_formula,csep,csep)

update-runify:
	$(call update_formula,runify,runify)

update-nocol:
	$(call update_formula,nocol,nocol)

update-new:
	$(call update_new_formula)

list-releases:
	@echo "Latest releases:"
	@echo "cgip (chat-gipity): $$(gh release list --repo divanvisagie/chat-gipity --limit 1 --json tagName --jq '.[0].tagName' 2>/dev/null || echo 'N/A')"
	@echo "csep: $$(gh release list --repo divanvisagie/csep --limit 1 --json tagName --jq '.[0].tagName' 2>/dev/null || echo 'N/A')"
	@echo "runify: $$(gh release list --repo divanvisagie/runify --limit 1 --json tagName --jq '.[0].tagName' 2>/dev/null || echo 'N/A')"
	@echo "nocol: $$(gh release list --repo divanvisagie/nocol --limit 1 --json tagName --jq '.[0].tagName' 2>/dev/null || echo 'N/A')"
	@echo "new: $$(gh release list --repo divanvisagie/new --limit 1 --json tagName --jq '.[0].tagName' 2>/dev/null || echo 'N/A (repo may not exist)')"

# Update all formulae (excluding new since repo may not exist)
update-all: update-cgip update-csep update-runify update-nocol
	@echo "✅ All formulae updated!"
	@echo "Note: 'new' formula not updated - repository may not exist"

# Create a new release of the tap itself
release:
	@echo "Creating new tap release..."
	@git add -A
	@git commit -m "Update formulae" || echo "No changes to commit"
	@git push
	@echo "✅ Tap updated!"
