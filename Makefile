# CV Build System
MAIN = cv
TEX  = $(MAIN).tex
PDF  = $(MAIN).pdf

# Default target
.PHONY: all
all: $(PDF)

# Build PDF from TeX source
$(PDF): $(TEX)
	latexmk -pdfxe -interaction=nonstopmode -halt-on-error $<

# Force complete rebuild
.PHONY: rebuild
rebuild: cleanall all

# Watch for changes and rebuild automatically
.PHONY: watch
watch:
	latexmk -pdfxe -pvc -interaction=nonstopmode $(TEX)

# Clean auxiliary files only
.PHONY: clean
clean:
	latexmk -c

# Clean everything including PDF
.PHONY: cleanall
cleanall:
	latexmk -C

# Show available targets
.PHONY: help
help:
	@echo "CV Build System"
	@echo ""
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  all       Build $(PDF) (default)"
	@echo "  rebuild   Clean and rebuild from scratch"
	@echo "  watch     Watch for changes, auto-rebuild"
	@echo "  clean     Remove auxiliary files"
	@echo "  cleanall  Remove all generated files"
	@echo "  help      Show this help message"
