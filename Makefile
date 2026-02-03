PREFIX ?= /usr/local

.PHONY: install uninstall

install:
	@echo "Installing bambu-switch to $(PREFIX)/bin..."
	@mkdir -p $(PREFIX)/bin
	@cp bambu-switch $(PREFIX)/bin/bambu-switch
	@chmod +x $(PREFIX)/bin/bambu-switch
	@echo "Done! Run 'bambu-switch init' to get started."

uninstall:
	@echo "Removing bambu-switch from $(PREFIX)/bin..."
	@rm -f $(PREFIX)/bin/bambu-switch
	@echo "Done!"
	@echo "Note: Your profiles in ~/Library/Application Support/ were not removed."

install-user:
	@echo "Installing bambu-switch to ~/bin..."
	@mkdir -p ~/bin
	@cp bambu-switch ~/bin/bambu-switch
	@chmod +x ~/bin/bambu-switch
	@echo "Done!"
	@echo ""
	@echo "Make sure ~/bin is in your PATH. Add this to ~/.zshrc:"
	@echo '  export PATH="$$HOME/bin:$$PATH"'
	@echo ""
	@echo "Then run 'bambu-switch init' to get started."
