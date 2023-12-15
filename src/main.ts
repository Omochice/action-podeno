import { debug, getInput, info } from "npm:@actions/core@1.10.1";
import { writeSummary } from "./github.ts";
import { loadConfig } from "./config.ts";
import { ok } from "npm:neverthrow@6.1.0"

const main = async () => {
  info("Start main process");
  const message = getInput("config", { required: true });

  loadConfig(message)
    .andThen((config) => {
      info(JSON.stringify(config, null, 2));
      return ok(undefined)
    })
    .orElse((err: Error) => {
      info(err.message);
      debug(err.stack ?? "");
      debug(`${err.cause}` ?? "");
      return ok(undefined)
    });
  await writeSummary("main", "hi?");

  info("Complete main process");
};
main();
