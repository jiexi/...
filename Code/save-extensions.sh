#!/usr/bin/env bash
# Saves VSCode plugins
FILE=./init.sh
echo "#!/usr/bin/env bash" > $FILE
code --list-extensions | xargs -L 1 echo code --install-extension >> $FILE
chmod +x $FILE
