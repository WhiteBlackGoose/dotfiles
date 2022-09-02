# Setup

|                  | Component     |
|:-----------------|:-------------:|
| OS               | Ubuntu        |
| DE               | Xfce4         |
| WM               | i3            |
| Status bar       | i3blocks      |
| Terminal         | Terminator    |
| Shell            | starship      |
| Editor           | NeoVim        |
| Git UI           | lazygit       |
| Task manager     | bashtop       |
| File manager     | xplr          |
| Font             | FiraCode Nerd |

# nvim

To get my setup of nvim:

- `neovim` >= 0.7.0
  - `vim-plug`
    - `:PlugInstall`
    - Restart nvim
  - .NET
    - Install [netcoredbg](https://github.com/Samsung/netcoredbg) and replace the path in the config somewhere to it
    - `:Mason`, find `fsautocomplete`, press `i`


### Dev

- Suggestions for C# work
  - Semantic completions pop up as you type
  - Disable errors/warnings with `Ctrl+q`
  - Enable list of errors and warnings in a file with `Ctrl+p`
- Suggestions for F# work
  - Not tested extensively though. Activate them with Ctrl+space
- Warnings and errors for C#
  - With virtual text (which appears on the same line with error)
  - Works for both themes
- Warnings and errors for F#
  - Not yet customised properly
  - But works for both themes
- Debug .NET
  - F5 to start. Before starting, it suggests compilation (y/n) and changing path to dll (y/n if already prompted once)
  - F10/Ctrl+F10 for step over/in, F4 to stop, F7/F8 to show/hide repl
  - `\h` to hover over a variable
  - Build project with `Ctrl+B`
- Symbols
  - `\hd` to hover preview documentation
  - `\hp` to hover preview definition
  - `\hg` to go to definition
  - `\rr` to rename symbol
  - `\sy` to see symbols in the current file
- Tests
  - `\ta` to run tests in a file
  - `\tt` to run the test  
- Alt+@ for F# interactive
- Rainbow brackets
- Git signs (shows which lines are added/modified since the last commit)


### Misc

- Toggle the theme with `\the`
- Editing
  - Multicaret with holding Ctrl
  - Copy, cut, paste with Ctrl+C, Ctrl+X, Ctrl+V respectively (d'uh, hate me for that)
  - Ctrl+Space to activate completion suggestions
- Files
  - Toggle the file tree with Alt+T
  - Alt+, and Alt+. to switch between tabs
- Telescope
  - `\ff` to find among files
  - `\cc` to find among commands
  - `\fb` to find among buffers
  - `\co` to find among commits
  - `\man` to see man entries

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
