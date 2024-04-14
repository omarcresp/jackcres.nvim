# JackCres NeoVIM Config

![image](https://github.com/omarcresp/jackcres.nvim/assets/27465620/5df0d4b9-7ab2-4eb8-a456-7b0023358bab)

## Pre-requisites

- NeoVIM 0.9.0 or higher
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
   - Windows: `git clone https://github.com/omarcresp/jackcres.nvim.git %USERPROFILE%\AppData\Local\nvim`
   - Macos|WSL|Linux: `git clone https://github.com/omarcresp/jackcres.nvim.git ~/.config/nvim`
2. Run `nvim` and wait for the plugins to install
3. Be a teapot (optional 😄)

## Customization

Inside the `lua/custom` folder you can find the `init.lua` file. This file is meant to be used to customize the configuration to your liking. You can add any variables or configurations that you want to change from the default configuration.

#### Nerdfonts

If your terminal doesn't have a NerdFont, you can set the `g.have_nerd_font` variable to `false` in the custom file.

```lua
vim.g.have_nerd_font = true -- Default
```

#### Plugins

You can add new plugins by creating a new file in the `lua/custom/plugins` folder. The file should return a table with the plugin configuration. You can find an example in the `lua/jackcres/plugins/telescope.lua` file.

#### Leader Key

You can change the leader key by setting the `g.leader` variable in the custom file.

```lua
vim.g.leader = ' ' -- Default
```

#### Language Servers (LSP)

If you need to configure a language server, you can add the configuration to the `g.lsp_servers` variable in the custom file. You can find an example in the `lua/jackcres/lsp/emmet.lua` file.

```lua
vim.g.lsp_servers = {
    emmet_language_server = {
        filetypes = { "html", "templ", "typescriptreact", "javascriptreact" },
    },
}
```

#### Formatters

If you need to configure a formatter, you can add the configuration to the `g.formatters` variable in the custom file.

```lua
vim.g.formatters = {
    lua = { "stylua" },
}
```

You can also enable the format on save by setting the `g.format_on_save` variable to `true` in the custom file.

```lua
vim.g.format_on_save = false -- Default
```

#### AutoSession supress dirs

You can change the directories that AutoSession will ignore by setting the `g.session_suppress_dirs` variable in the custom file.
It defaults to `~`. You can add any directory you want to ignore. But keep in mind to add the home directory so you didnt save sessions here

```lua
vim.g.session_suppress_dirs = { "~" } -- Default
```

#### Dashboard

You can change the dashboard to show a different image by setting the `g.dashboard_custom_header` variable in the custom file.

```lua
vim.g.dashboard_custom_header = {} -- Defaults to the Hydra text image, you can add any image you want
```

You can also change the text that appears in the bottom of the dashboard by setting the `g.dashboard_custom_header_bottom` variable in the custom file.

```lua
vim.g.dashboard_custom_header_bottom = {} -- Defaults to the JackCres text
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
