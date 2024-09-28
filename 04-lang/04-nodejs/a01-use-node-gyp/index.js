var process = require('process');
var pid = process.pid

const util = require('util');
const exec = util.promisify(require('child_process').exec);

var child_process = require('child_process');

async function myOpendDylibs(params) {

    try {
        const { stdout, stderr } = await exec(`cat /proc/${pid}/maps | grep -E '\\.so|\\.node'`);
        if (stdout) {
            console.log(stdout);
        }
        if (stderr) {
            console.log(stderr);
        }
    } catch (e) {
        console.error(e);
    }
}

async function main() {
    console.log('=== before require node-pty')
    await myOpendDylibs()
    var pty = require('node-pty');
    console.log('=== after require node-pty')
    await myOpendDylibs()
}


main()
