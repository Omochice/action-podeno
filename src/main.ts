import { debug, getInput, info } from "npm:@actions/core@1.10.1";
import { writeSummary } from "./github.ts";
import { loadConfig } from "./config.ts";
import { ok, ResultAsync } from "npm:neverthrow@6.1.0";
import { execPodium } from "https://raw.githubusercontent.com/Omochice/podeno/main/src/lua.ts";
import { dirname } from "https://deno.land/std@0.209.0/path/posix/dirname.ts";

const main = async () => {
  info("Start main process");
  const message = getInput("config", { required: true });

  const configs = loadConfig(message);
  if (configs.isErr()) {
    info(configs.error.message);
    debug(configs.error.stack ?? "");
    return;
  }

  for (const c of configs.value) {
    try {
      debug(JSON.stringify(Array.from(Deno.readDirSync("."))))
      const converted = await execPodium(
        Deno.readTextFileSync(c.in),
        c.type,
      );
      if (converted.isErr()) {
        info(converted.error.message)
      } else {
        Deno.mkdirSync(dirname(c.out), { recursive: true });
        Deno.writeTextFileSync(c.out, converted.value);
      }
    } catch (e) {
      if (e instanceof Error) {
        info(e.message);
        debug(e.stack ?? "");
      }
      debug(`${e}`);
    }
  }
  await writeSummary("main", "hi?");

  info("Complete main process");
};
main();
