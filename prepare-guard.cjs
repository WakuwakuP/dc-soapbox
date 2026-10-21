const fs = require('node:fs');
const path = require('node:path');
const lockfile = path.join(__dirname, 'soapbox/yarn.lock');
const lock = fs.readFileSync(lockfile, 'utf8');
fs.writeFileSync(lockfile, lock.replace(/https:\/\/registry\.(?:yarnpkg\.com|npmjs\.org)\//g, 'https://npm.flatt.tech/'));
