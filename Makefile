PREFIX ?= /usr/local

.PHONY: install uninstall

install:
	@echo "Installing bamboo-switch to $(PREFIX)/bin..."
	@mkdir -p $(PREFIX)/bin
	@cp bamboo-switch $(PREFIX)/bin/bamboo-switch
	@chmod +x $(PREFIX)/bin/bamboo-switch
	@echo "Done! Run 'bamboo-switch init' to get started."

uninstall:
	@echo "Removing bamboo-switch from $(PREFIX)/bin..."
	@rm -f $(PREFIX)/bin/bamboo-switch
	@echo "Done!"
	@echo "Note: Your profiles in ~/Library/Application Support/ were not removed."

install-user:
	@echo "Installing bamboo-switch to ~/bin..."
	@mkdir -p ~/bin
	@cp bamboo-switch ~/bin/bamboo-switch
	@chmod +x ~/bin/bamboo-switch
	@echo "Done!"
	@echo ""
	@echo "Make sure ~/bin is in your PATH. Add this to ~/.zshrc:"
	@echo '  export PATH="$$HOME/bin:$$PATH"'
	@echo ""
	@echo "Then run 'bamboo-switch init' to get started."
