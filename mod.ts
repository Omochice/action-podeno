// import { summary } from "npm:@actions/core@1.10.1";

console.log("hi this is from docker");

const j = Deno.args.join(" ")
console.log(j);

console.log(JSON.parse(j))

// summary.addRaw("## header\n\nthis is message.").write();

Deno.writeTextFileSync("sample.txt", "this is sample.text");
