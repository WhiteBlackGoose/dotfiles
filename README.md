# Setup

|                  | Past                         | Now                                                                              |
|:-----------------|:-----------------------------|:---------------------------------------------------------------------------------|
| OS               | Ubuntu                       | Debian                                                                           |
| DE               | Xfce4                        | -                                                                                |
| WM               | i3                           | i3                                                                               |
| Status bar       | i3blocks                     | i3blocks                                                                         |
| Terminal         | Terminator                   | Terminator                                                                       |
| Shell            | starship                     | bash                                                                             |
| Text Editor      | neovim                       | [neovim-goose](https://github.com/WhiteBlackGoose/neovim-goose)                  |
| IDE              | VSC, Rider, PyCharm, Jupyter | [neovim-goose](https://github.com/WhiteBlackGoose/neovim-goose)                  |
| PDF editor       | LibreOffice Writer           | [neovim-goose](https://github.com/WhiteBlackGoose/neovim-goose)                  |
| PDF viewer       | -                            | zathura                                                                          |
| Image editor     | Pinta                        | Pinta                                                                            |
| Image viewer     | -                            | [nsxiv-goose](https://github.com/WhiteBlackGoose/nsxiv-goose)                    |
| Git UI           | lazygit                      | lazygit                                                                          |
| Task manager     | bashtop                      | bpytop                                                                           |
| File manager     | vifm                         | -                                                                                |
| Password manager | -                            | [pass](https://gist.github.com/WhiteBlackGoose/8ffb7123b991dcc4cdafcdd574bdc3c6) |
| Font             | FiraCode Nerd                | FiraCode Nerd                                                                    |
| Browser          | firefox                      | firefox + vimium + passff                                                        |
| App launcher     | xfce4-appfinder              | rofi                                                                             |
# nvim

To get my setup of nvim:

- Get `neovim` >= 0.8.0
  - Get `vim-plug`
    - Run it (you will see many errors - it's ok)
    - Type `:PlugInstall` and hit enter, wait until plugins are installed
    - Restart nvim
  - `pip3 install neovim` for deoplete
  - Get `lazygit` for git UI
  - .NET
    - [Install](https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script#recommended-version) .NET (using binaries works too)
    - Install [netcoredbg](https://github.com/Samsung/netcoredbg) and replace the path in the config somewhere to it
    - Make sure that your $PATH has no `~` (neovim can't expand it)
    - Make sure your DOTNET_ROOT is set to the place where your actual binaries are
  - F#
    - `:Mason`, find `fsautocomplete`, press `i`
  - Python
    - `pip install flake8`
    - `pip install debugpy`
    - `pip install jedi-language-server`
  - Any interactive
    - `pip install jupyter_client` for interactive
    - `:UpdateRemotePlugins`
    - 'pip install pyperclip`
  - .NET interactive (C#, F#)
    - `dotnet tool install -g Microsoft.dotnet-interactive`
    - `dotnet interactive jupyter install`
  - Rust
    - Get [vscode-lldb](https://github.com/vadimcn/vscode-lldb/releases)
    - Unpack vsix
    - Update paths in the config file
  - C
    - Install clangd
  - LaTeX
    - Get `latexmk`
    - Get `zathura` (PDF viewer)
    - Get `amcli` (AngouriMathCLI) (optional)
    - Get `texlab` (Language server) (optional)
  - Image
    - `ascii-image-converter`

### Why nvim?

- :white_check_mark: Start up time (< 500 ms is not noticeable by human)
- :white_check_mark: Responsiveness (no GUI - no lags)
- :white_check_mark: Customisation. It's all lua. You almost write your own IDE, given components. Glue them together and add/remove whatever you want
- :white_check_mark: Suitable to run over terminal SSH. So you can literally use a full-blown IDE from a tablet
- :white_check_mark: Optimized for hotkeys. It's impossible to use mouse, so 100% everything is reachable from keyboard
- :white_check_mark: Opens in the same window as your shell, not poping up (because no GUI)
- :white_check_mark: You certainly can copy any part of the window because ... it's all text
- :white_check_mark: FOSS
- :x: Ridiculous learning curve. It's not that you *just* need to learn the completely alien to most modern people keybindings, you also have to learn installing and configuring plugins, and soon, coding some basics in lua as well as basics of interacting with `nvim` itself. Meanwhile in Visual Studio you need to click two buttons and you're set
- :x: Availability. For example, I couldn't find a test explorer for neovim for .net

### Features for developers

- Suggestions for C#, Rust, C work
  - Semantic completions pop up as you type
  - Disable errors/warnings with `Ctrl+q`
  - Enable list of errors and warnings in a file with `Ctrl+p`
- Suggestions for F# work
  - Not tested extensively though. Activate them with Ctrl+space
- Warnings and errors for C#, Rust, Python, C
  - With virtual text (which appears on the same line with error)
  - Works for both themes
- Quick fixes for C#
- Warnings and errors for F#
  - Not yet customised properly
  - But works for both themes
- Debug .NET, Rust, python
  - F5 to start. Before starting .NET, it suggests compilation (y/n) and changing path to dll (y/n if already prompted once)
  - F10/Ctrl+F10 for step over/in, F4 to stop, F7/F8 to show/hide repl
  - Hover over a variable
  - Build .NET project with `Ctrl+B`
- Interactive C#, F#, Python
  - Start typing `:MagmaInit`, see the options
  - Once initialized, `<space>mm` runs the line in normal mode or selected block in visual mode
- Symbols
  - Hover preview documentation
  - Hover preview definition
  - Go to definition
  - Rename symbol
  - See symbols in the current file
- Tests
  - Run tests in a file
  - Run the test  
- Alt+@ for F# interactive
- Rainbow brackets
- Git
  - Git signs (shows which lines are added/modified since the last commit)
  - Open lazygit on hotkey
- Html auto closing and tag renaming
- Folding with `<leader>j` and `<leader>k`
- `mim` or `minimal vim` - nvim without NerdFont symbols - is suitable for using neovim over ssh

### Other features

- Toggle the theme with `\the` (or run `wim` for the white theme and `vim` for the default/dark one)
- Editing
  - Multicaret with holding Ctrl
  - Copy, cut, paste with Ctrl+C, Ctrl+X, Ctrl+V respectively (d'uh, hate me for that)
  - Ctrl+Space to activate completion suggestions
- Files
  - Toggle the file tree with Alt+T
  - Alt+, and Alt+. to switch between tabs
- Telescope
  - `<leader>F` to find among files
  - `<leader>cc` to find among commands
  - `<leader>fb` to find among buffers
  - `<leader>co` to find among commits
  - `<leader>man` to see man entries
- Search
  - Over files with `<leader>F`
  - In files with `<leader>fff`
  - And many more searches
- LaTeX support
  - Edit LaTeX in nvim and preview hot-reloaded PDFs in Zathura
  - Language server (errors, completions)
  - Convert math expressions into LaTeX with hotkeys
- Image preview

#### The rest see the config...

# starship

- Just pretty yet minimalistic config for starship shell
- Shows time: useful when you want to see when a command was run

# i3

- Borderless, very minimalistic
- Xfce apps configured as floating
- Menu is `xfce-appfinder`. Stupid, simple
- `i3blocks` configured for some info about your system

# Screenshots

### 2022-11-23 13:15 UTC

![LaTeX demo](./latex.gif)

### 2022-11-04 06:03 UTC

See branch freebsd for dot files.

![Screenshot_20221104_053856](https://user-images.githubusercontent.com/31178401/199902935-6bd11369-99c1-4d8c-ad85-eb7cfa300ad1.png)

### 2022-11-03 16:48 UTC

See branch arch for dot files.

![Screenshot_2022-11-03_22-40-03](https://user-images.githubusercontent.com/31178401/199783198-22f9a953-035b-4dad-bd7c-2c303fcd192d.png)

### 2022-10-21 07:31 UTC

![image](https://user-images.githubusercontent.com/31178401/197138881-81ab130d-a156-49d9-88a2-5d957c5419c5.png)
![image](https://user-images.githubusercontent.com/31178401/197142494-56966fe3-f06f-4d7f-9eff-2e05b31ecf16.png)


### 2022-09-02 10:48 UTC

![image](https://user-images.githubusercontent.com/31178401/188125083-3f136231-8550-4ecc-b388-288bb83f52de.png)
![image](https://user-images.githubusercontent.com/31178401/188123905-c571f56c-9bb7-4e46-a868-6089777b1954.png)

### 2022-08-31 21:30 UTC

![image](https://user-images.githubusercontent.com/31178401/187789412-2be41579-e1a2-4696-9de3-a867614df74d.png)

### 2022-08-31 11:13 UTC

![nvim-dev](https://user-images.githubusercontent.com/31178401/187665978-5a37f8e5-0eda-49e1-90ba-949b6632d544.gif)

### 2022-08-27 12:46 UTC

![screenshot-2022-08-27](https://user-images.githubusercontent.com/31178401/187030935-077353e2-4c5a-4fe6-92d1-0c541342464f.png)

### 2022-08-23 15:01 UTC

![4DECB587-4924-4F2D-8FAC-459BB7235F4E](https://user-images.githubusercontent.com/31178401/186192562-2584026f-025e-4e1d-9e97-db8dd4fd73a7.png)
![95D51300-7B0F-47EF-A435-F7FF82C104E0](https://user-images.githubusercontent.com/31178401/186192612-2f1c0c33-7ea6-4c13-aa37-44a07a381466.png)

### 2022-08-10 19:26 UTC

![image](https://user-images.githubusercontent.com/31178401/184002354-84b0e663-4ccf-45b1-962f-a00d91f50006.png)
![image](https://user-images.githubusercontent.com/31178401/184002978-67cca6d5-f304-4d27-b904-66aca846083d.png)
