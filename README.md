
# **Wolmer's VS Code settings**

This repo is a comprehensive setup for a **Web development environment**, featuring a UI configuration for code editors. The primary goal of this project is to quickly setup a development environment in VS code.


## **Screenshots**

![image.png](https://i.postimg.cc/jSSmGvhy/image.png)


## **Installation**


### Prerequisites
- Ensure you have [Visual Studio Code](https://code.visualstudio.com/download) & [Git](https://git-scm.com/downloads) installed.
- Download fonts
    -    [Gist Mono](https://vercel.com/font)
    -    [CaskaydiaCove Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip)
- Extract and Install Fonts

### Setup
- Clone this repo
```bash
git clone https://github.com/thewolmer/.vscode.git
```
- change directory into `.vscode`
```bash
cd .vscode
```
- Run Bash script to download extentions.
```bash
./extentions.bash
```
> `extentions.bash` will download all the vscode extentions listed in [extentions.](https://github.com/thewolmer/.vscode/blob/master/extentions.bash) You can edits to remove or add according to your needs.

### Applying settings
- Copy and replace `settings.json`
>  Windows
```bash
Copy-Item -Path ".\settings.json" -Destination "$env:APPDATA\Code\User\settings.json" -Force
```
> MacOs
```bash
cp "$PWD/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"

```
> Linux
```bash
cp "$PWD/settings.json" "$HOME/.config/Code/User/settings.json"
```
✨ **You're done!**

## **Removing changes/Resetting to default**
- Remove `settings.jso`n file
⚠️ - *You will lose you settings by removing `settings.json`.*

> Windows
```bash
del /Q "%APPDATA%\Code\User\settings.json"
```
> MacOs
```bash
rm ~/.config/Code/User/settings.json
```
> Linux
```bash
rm ~/.config/Code/User/settings.json
```



## **Customization Disclaimer**
These settings reflect my personal preferences and may not suit everyone. Feel free to customize them to your liking. If you're unsure how to edit VSCode settings, check out the links in Related Section for guide on editing VSCode settings.
## **Related**

Here are some related resources

- [Blog - VS Code settings you should customize](https://dev.to/softwaredotcom/vs-code-settings-you-should-customize-5e75)
- [Blog - User and Workspace Settings](https://code.visualstudio.com/docs/getstarted/settings)
- [Youtube - How to Customize Visual Studio Code Settings.json](https://youtu.be/V0s7uQlbSRY?si=siAEDFe2oyRxLK3l)
## **User Interface**

- **Theme:** [Gruvbox Dark Hard](https://vscodethemes.com/e/jdinhlife.gruvbox/gruvbox-dark-hard?language=javascript)
- **Icons:** [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=pkief.material-icon-theme)
- **Advanced UI Customizations:** [Apc Customize UI++](https://marketplace.visualstudio.com/items?itemName=drcika.apc-extension)
---

## **Support**
For support, reach out [Links](https://wolmer.me?utm_source=github.com/thewolmer/vscode).

