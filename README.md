# JackCres NeoVIM Config

![image](https://github.com/omarcresp/jackcres.nvim/assets/27465620/5df0d4b9-7ab2-4eb8-a456-7b0023358bab)

## Pre-requisites

- NeoVIM 0.9.0 or higher
- NodeJS 16.0 or higher (optional)
- build-essential (gcc, g++, make) or equivalent for your OS
  - macos: `xcode-select --install`
  - ubuntu: `sudo apt-get install build-essential`
  - arch: `sudo pacman -S base-devel`
  - windows: WIP :)
- NerdFonts (for icons -- optional)
  - [JetBrainsMono NerdFont](https://github.com/JetBrains/JetBrainsMono) (recommended)
  - [NerdFonts](https://www.nerdfonts.com/font-downloads)

> **Note:** If you dont install a NerdFont, read the [Customization](#customization) section to see how to disable the icons.

> **Note:** This configuration is still in development and may not work as expected. Please use at your own risk and knowledge to workaround any issues that may arise. Feel free to open an issue if you find any bugs or have any suggestions.

## Installation

1. Clone the configuration to your machine
   1.a. Windows: `git clone https://github.com/omarcrespo/jackcres.nvim %USERPROFILE%\AppData\Local\nvim`
   2.b. Macos|WSL|Linux: `git clone https://github.com/omarcrespo/jackcres.nvim ~/.config/nvim`
2. Run `nvim` and wait for the plugins to install (it may take a while, first wait for lazy and then you can press :Mason to see the progress of the lsp)
3. Close `nvim`
4. Be a teapot (optional 😄)

## Customization

Inside the `lua/custom` folder you can find the `init.lua` file. This file is meant to be used to customize the configuration to your liking. You can add any variables or configurations that you want to change from the default configuration.

#### Nerdfonts

If your terminal doesn't have a NerdFont, you can set the `g.have_nerd_font` variable to `false` in the custom file.

```lua
vim.g.have_nerd_font = true -- Default
```

#### Leader Key

You can change the leader key by setting the `g.leader` variable in the custom file.

```lua
vim.g.leader = ' ' -- Default
```

### Next steps:

- [ ] Document the keybindings
- [ ] Document the plugins
- [ ] Make screenshots easier to use out of the box
- [ ] Configure quickfixlist navigations
- [ ] Make LSP easier to configure with a global
- [ ] Move all personal lsp configurations to custom folder
- [ ] Create first open guide (hopefully interactive with UI) to setup
- [x] Setup `lua/custom` folder with inital variables
- [x] Document installation process in README
