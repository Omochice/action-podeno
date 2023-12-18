// import { summary } from "npm:@actions/core@1.10.1";

console.log("hi this is from docker");

console.log(`[${Deno.args.join(", ")}]`);

// summary.addRaw("## header\n\nthis is message.").write();

Deno.writeTextFileSync("sample.txt", "this is sample.text");
