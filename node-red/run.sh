#!/bin/bash
CONFIG_PATH=/data/options.json

SSL=$(jq --raw-output ".ssl" $CONFIG_PATH)
KEYFILE=$(jq --raw-output ".keyfile" $CONFIG_PATH)
CERTFILE=$(jq --raw-output ".certfile" $CONFIG_PATH)

if [ ! -d /config/node-red]; then
	mkdir /config/node-red
fi
if [ ! -e /config/node-red/settings.js ]; then
    cp /settings.js /config/node-red/settings.js
fi

# Add ssl configs
if [ "$SSL" == "true" ]; then
    sed -i 's/.*var fs = require("fs")/var fs = require("fs")/g' /config/node-red/settings.js
    sed -i '/https: {/,/}/ s/\/\///' /config/node-red/settings.js
    sed -i "s/.*key: fs.readFileSync('.*'),/        key: fs.readFileSync(\'\/ssl\/$KEYFILE\'),/g" /config/node-red/settings.js
    sed -i "s/.*cert: fs.readFileSync('.*')/        cert: fs.readFileSync(\'\/ssl\/$CERTFILE\')/g" /config/node-red/settings.js
else
    sed -i 's/.*var fs = require("fs")/\/\/var fs = require("fs")/g' /config/node-red/settings.js
    sed -i '/^[ ]*https: {/,/}/ s/^[ ]*/    \/\//' /config/node-red/settings.js
    sed -i "s/.*key: fs.readFileSync/    \/\/    key: fs.readFileSync/g" /config/node-red/settings.js
    sed -i "s/.*cert: fs.readFileSync/    \/\/    cert: fs.readFileSync/g" /config/node-red/settings.js
fi

cd /usr/src/node-red
npm start -- --userDir /config/node-red/
