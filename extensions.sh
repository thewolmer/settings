#!/bin/bash

# List of extensions
extensions="
astro-build.astro-vscode
benitezdouglas.express-faster
biomejs.biome
bradlc.vscode-tailwindcss
brenix.hacker-theme
cschlosser.doxdocgen
csstools.postcss
dbaeumer.vscode-eslint
dkundel.vscode-new-file
doppler.doppler-vscode
dsznajder.es7-react-js-snippets
eamodio.gitlens
editorconfig.editorconfig
emeraldwalk.runonsave
esbenp.prettier-vscode
formulahendry.auto-rename-tag
github.copilot
github.copilot-chat
github.vscode-github-actions
golang.go
irongeek.vscode-env
jdinhlife.gruvbox
jock.svg
me-dutour-mathieu.vscode-github-actions
ms-azuretools.vscode-docker
naumovs.color-highlight
nmsmith89.incrementor
octref.vetur
pkief.material-icon-theme
planbcoding.vscode-react-refactor
prisma.prisma
redhat.vscode-yaml
ritwickdey.liveserver
shd101wyy.markdown-preview-enhanced
sleistner.vscode-fileutils
softwaredotcom.swdc-vscode
streetsidesoftware.code-spell-checker
stylelint.vscode-stylelint
suhelmakkad.shadcn-ui
supermaven.supermaven
tomrijndorp.find-it-faster
usernamehw.errorlens
vincaslt.highlight-matching-tag
vue.volar
vunguyentuan.vscode-postcss
wayou.vscode-todo-highlight
yoavbls.pretty-ts-errors
"

# Remove empty lines and count the total number of extensions
extensions=$(echo "$extensions" | sed '/^$/d')
total=$(echo "$extensions" | wc -l)
current=1

# Loop through each extension and install it
echo "$extensions" | while read -r extension; do
    echo "Installing ($current/$total): $extension"
    code --install-extension "$extension"
    ((current++))
done

echo "All extensions installed!"
