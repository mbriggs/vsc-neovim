link:
	ln -sf $$HOME/nvim $$HOME/.config/nvim

clean:
	rm -rf $$HOME/.cache/nvim
	rm -rf $$HOME/.local/share/nvim
	rm -rf $$HOME/.config/nvim/plugin
	
packer:
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

install: clean link packer
	
dependencies:
	brew install stylua
	brew install lua
	luarocks install luacheck
	brew install borkdude/brew/clj-kondo
	brew install --cask cljstyle
	
# todo move me
clojure:
	brew install clojure/tools/clojure
	clojure -Ttools install io.github.seancorfield/deps-new '{:git/tag "v0.4.13"}' :as new


dependencies.old:
	brew install rust
	brew install borkdude/brew/clj-kondo
	brew install --cask cljstyle
	brew install ripgrep
	brew install codespell
	brew install shfmt
	brew install sqlparse
	brew install shellcheck
	brew install stylua
	brew install hadolint
	pip3 install cmakelang
	npm i -g prettier
	npm i -g lua-fmt
	npm i -g eslint_d
	npm install -g @fsouza/prettierd
	npm install -g @unibeautify/beautifier-sqlformat
	npm install -g stylelint
	gem install rubocop rubocop-rails
