// import { summary } from "npm:@actions/core@1.10.1";
import { parse } from "https://deno.land/std@0.200.0/jsonc/parse.ts"

console.log("hi this is from docker");

console.log(parse(Deno.args[0]));

// summary.addRaw("## header\n\nthis is message.").write();

Deno.writeTextFileSync("sample.txt", "this is sample.text");
