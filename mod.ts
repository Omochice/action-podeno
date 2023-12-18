// import { summary } from "npm:@actions/core@1.10.1";
import JSON5 from "npm:json5@2.2.3"

console.log("hi this is from docker");

console.log(JSON5.parse(Deno.args[0]));

// summary.addRaw("## header\n\nthis is message.").write();

Deno.writeTextFileSync("sample.txt", "this is sample.text");
