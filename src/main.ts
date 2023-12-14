import { debug, getInput, info } from "npm:@actions/core@1.10.1";
import { writeSummary } from "./github.ts";

const main = async () => {
  info("Start main process");
  const message = getInput("config", { required: true });

  try {
    const json = JSON.stringify(Deno.readTextFileSync(message));
    info(json);
  } catch (e) {
    info(e);
  }
  await writeSummary("main", "hi?");

  info("Complete main process");
};
main();
