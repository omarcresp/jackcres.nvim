# JackCres NeoVIM Config

![image](https://github.com/omarcresp/jackcres.nvim/assets/27465620/5df0d4b9-7ab2-4eb8-a456-7b0023358bab)

## Pre-requisites

- NeoVIM 0.9.0 or higher
- NodeJS 16.0 or higher
- build-essential (gcc, g++, make) or equivalent for your OS
  - macos: `xcode-select --install`
  - ubuntu: `sudo apt-get install build-essential`
  - windows: WIP :)
- NerdFonts (for icons -- optional)
  - [JetBrainsMono NerdFont](https://github.com/JetBrains/JetBrainsMono) (recommended)
  - [NerdFonts](https://www.nerdfonts.com/font-downloads)

> **Note:** This configuration is still in development and may not work as expected. Please use at your own risk.
> **Note:** If you dont install a NerdFont, then you'll need to set the g.have_nerd_font to false in the `lua/jackcres/core/options.lua` file.

## Installation

1. Clone the repository to your `~/.config/nvim` folder
2. Run `nvim` and wait for the plugins to install
3. Close `nvim` and open it again
4. Be a teapot (optional 😄)

### Next steps:

- [ ] Complete document installation process in README (if you know you know, use it right now at your own risk 😄)
- [ ] Document the keybindings
- [ ] Document the plugins
- [ ] Make screenshots easier to use out of the box
- [ ] Configure quickfixlist navigations
- [ ] Make LSP easier to configure with a global
- [ ] Setup `lua/custom` folder with inital variables
- [ ] Move all personal lsp configurations to custom folder
- [ ] Create an sh script to install the config from github releases
- [ ] Create first open guide (hopefully interactive with UI) to setup
